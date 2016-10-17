function model = createRobotArm(L,m,g)

model.L = L;

model.NB = 2;
model.Xtree = {xlt([0;0;0]),xlt([L(1);0;0])};
model.jtype = {'Ry','Ry'};
model.parent = [0,1];
model.I = {mcI(m(1),L(1)*[0.5 0 0],m(1)*L(1)^2*diag([0.0025,1.015/12,1.015/12])),...
                mcI(m(2),L(2)*[0.5 0 0],m(2)*L(2)^2*diag([0.0025,1.015/12,1.015/12]))};


model.appearance.base = ...
    { 'sphere',[0.0,0.0,0.0],0.05, ...
    };

model.appearance.body{1} = ...
    { 'colour', [0.0,1.0,0.0],...
      'box',[0.0,-0.025,-0.05;L(1),0.025,0.05;], ...
    };

model.appearance.body{2} = ...
    { 'colour', [0.0,0.0,1.0],...
      'box',[0.0,-0.025,-0.05;L(2),0.025,0.05;], ...
    };

model.gravity = g;

model.gamma_q = @gamma_q;

model.gc.body = 2;
model.gc.point = [L(2);0;0];

model.contactFcn = @contactFcn;

model.dynModelWithCoulombContactFcn = @dynModelWithCoulombContactFcn;

model.dynModelWithFreeBaseFcn = @dynModelWithFreeBaseFcn;

model.dynModelFBWithCoulombContactFcn = @dynModelFBWithCoulombContactFcn;

end

function [q,qd,G,g] = gamma_q( model, qo, qdo )

L1 = model.L(1);L2 = model.L(2);
y = qo(2);   % y = gamma^-1(q0);
q = [atan2(-L2*sin(y),L2*cos(y)+L1);y];

G = [ -(L2*(L2 + L1*cos(y)))./(L1^2 + 2*cos(y)*L1*L2 + L2^2);1];

yd = qdo(2); % yd = d/dt gamma^-1(q0);
qd = G*yd;

Tstab = 0.1;
gs = 2/Tstab*(qd-qdo) + 1/Tstab^2*(q-qo);

g = [((L1*L2*sin(y)*(L1^2 - L2^2))./(L1^2 + 2*cos(y)*L1*L2 + L2^2)^2).*yd.^2;0]+gs;

end

function f_ext = contactFcn(model,x,b)

q = x([1;2]); qd = x([3;4]);
K = 1e6; D = 2000;
posvel = gcPosVel( model, q, qd );
f = gcontact( K, D, 0, posvel(1:3,:), posvel(4:6,:) );
f = Fpt([0;0;f],posvel(1:3,:));
f_ext = {[0;-b*x(3);0;0;0;0],[0;-b*x(4);0;0;0;0]+f};

end

function xp = dynModelWithCoulombContactFcn(model,x,b,mu)

q = x([1;2]); qd = x([3;4]); u = x([5;6]);
K = 1e6; D = 2000;
posvel = gcPosVel( model, q, qd );
[f,ud,~] = gcontact( K, D, mu, posvel(1:3,:), posvel(4:6,:), u );
f = Fpt(f,posvel(1:3,:));

f_ext = {[0;-b*x(3);0;0;0;0],[0;-b*x(4);0;0;0;0]+f};

xp = [x(3:4);
      FDab(model,...
           x(1:2),x(3:4),[0;0],...
           f_ext);
      ud];
end

function xp = dynModelWithFreeBaseFcn(modelFB,t,x,f_extFcn)

[xdbf,qdd] = FDfb(modelFB,...
                  x(1:13),...
                  x(14:modelFB.NB+7),...
                  x(modelFB.NB+8:2*modelFB.NB+1),...
                  [0;0],...
                  f_extFcn(t,x));

xp = [xdbf;x(modelFB.NB+8:2*modelFB.NB+1);qdd];

end

function xp = dynModelFBWithCoulombContactFcn(modelFB,t,x,mu,f_extFcn)

xfb = x(1:13);
q = x(14:modelFB.NB+7); 
qd = x(modelFB.NB+8:2*modelFB.NB+1); 
u = x(2*modelFB.NB+(2:3));

K = 1e6; D = 2000;

posvel = gcPosVel( modelFB, xfb, q, qd );
[f,ud,~] = gcontact( K, D, mu, posvel(1:3,:), posvel(4:6,:), u );

f_ext = f_extFcn(t,x);

f_ext{7} = f_ext{7} + Fpt(f,posvel(1:3,:));

[xdbf,qdd] = FDfb(modelFB,...
                  x(1:13),...
                  x(14:modelFB.NB+7),...
                  x(modelFB.NB+8:2*modelFB.NB+1),...
                  [0;0],...
                  f_ext);

xp = [xdbf;
      x(modelFB.NB+8:2*modelFB.NB+1);
      qdd
      ud];
end
