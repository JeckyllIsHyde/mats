function model = createWalker4DOF(L,m,g)

model.L = L;

model.NB = 5;
model.jtype = {'Ry','Ry','Ry','Ry','Ry'};
model.parent = [0,1,2,1,4];

model.Xtree = cell(1,5);
model.I = cell(1,5);
model.appearance.body = cell(1,5);
for i = 1:5
    if i==1
        model.Xtree{i} = xlt([0;0;0]);
        model.appearance.body{i} = ...
            { ...%'colour', [0.0,1.0,0.0],...
              'sphere',[0,0.0,0.0],0.1, ...
              'sphere',[L(i),0.0,0.0],0.1, ...
              'box',[0.0,-0.025,-0.05;L(i),0.025,0.05;], ...
            };
    else
        model.Xtree{i} = xlt([L(model.parent(i));0;0]);
        model.appearance.body{i} = ...
            { ...%'colour', [0.0,1.0,0.0],...
              'sphere',[L(i),0.0,0.0],0.1, ...
              'box',[0.0,-0.025,-0.05;L(i),0.025,0.05;], ...
            };
    end
    model.I{i} = mcI(m(i),...
                     L(i)*[0.5 0 0],...
                     m(1)*L(i)^2*diag([0.0025,1.015/12,1.015/12]));
end

model.appearance.base = ...
    { 'sphere',[0.0,0.0,0.0],0.05, ...
    };

model.gravity = g;

model.gc.body = [3,5];
model.gc.point = [[L(5);0;0],[L(5);0;0]];

model.limitJointForcesFnc = @limitJointForcesFnc;

model.dynModelFBWithCoulombContactFcn = @dynModelFBWithCoulombContactFcn;
model.muscleForceSystemFcn = @muscleForceSystemFcn;

end

function fex = limitJointForcesFnc(x, f_extFcn)

K = 1e6; D = 2000;
fex = f_extFcn(x);
% left hip
if x(2)<-30*pi/180 || x(2)>110*pi/180
    f = -K*x(2)-D*x(7);
    fex{1} = [0;-f;0;0;0;0]+fex{1};
    fex{2} = [0; f;0;0;0;0]+fex{2};
    % disp(['collision left hip: ',num2str(180/pi*x(2))])
end
% left knee
if x(3)<-130*pi/180 || x(3)>15*pi/180
    f = -K*x(3)-D*x(8);
    fex{2} = [0;-f;0;0;0;0]+fex{2};
    fex{3} = [0; f;0;0;0;0]+fex{3};
    % disp(['collision left knee: ',num2str(180/pi*x(3))])
end
% right hip
if x(4)<-30*pi/180 || x(4)>110*pi/180
    f = -K*x(4)-D*x(9);
    fex{1} = [0;-f;0;0;0;0]+fex{1};
    fex{4} = [0; f;0;0;0;0]+fex{4};
    % disp(['collision right hip: ',num2str(180/pi*x(4))])
end
% right knee
if x(5)<-130*pi/180 || x(5)>15*pi/180
    f = -K*x(5)-D*x(10);
    fex{4} = [0;-f;0;0;0;0]+fex{4};
    fex{5} = [0; f;0;0;0;0]+fex{5};
    % disp(['collision right knee: ',num2str(180/pi*x(5))])
end

end

function xp = dynModelFBWithCoulombContactFcn(modelFB,x,mu,f_extFcn)

xfb = x(1:13);
q = x(14:modelFB.NB+7); 
qd = x(modelFB.NB+8:2*modelFB.NB+1); 
u = reshape(x(2*modelFB.NB+2:end),2,[]);

K = 1e6; D = 2000;

posvel = gcPosVel( modelFB, xfb, q, qd );
[f,ud,~] = gcontact( K, D, mu, posvel(1:3,:), posvel(4:6,:), u );

f_ext = f_extFcn([0;q;0;qd]);
f_ext = [{[],[],[],[],[]},f_ext];

f_ext{8} = f_ext{8} + Fpt(f(:,1),posvel(1:3,1));
f_ext{10} = f_ext{10} + Fpt(f(:,2),posvel(1:3,2));

[xdbf,qdd] = FDfb(modelFB,...
                  x(1:13),...
                  x(14:modelFB.NB+7),...
                  x(modelFB.NB+8:2*modelFB.NB+1),...
                  zeros(5,1),...
                  f_ext);

xp = [xdbf;
      x(modelFB.NB+8:2*modelFB.NB+1);
      qdd
      ud(:)];
end

function fex = muscleForceSystemFcn(model,x,resortes,k,Ln,f_extFcn)

p = resortes.p;
pairLink = resortes.pairLink;

q = x(1:model.NB);

for i = 1:model.NB
  XJ = jcalc( model.jtype{i}, q(i) );
  Xup{i} = XJ * model.Xtree{i};
end

Xtmp = eye(6);
for i = 1:model.NB
    if isempty(p{i})
        continue
    end
    pG{i} = Xpt(inv(Xup{i}),p{i});
end

Lk = norm(pG{pairLink(2)}-pG{pairLink(1)});
fkij = Fpt(k*(pG{pairLink(2)}-pG{pairLink(1)})/Lk*(Lk-Ln),pG{pairLink(1)});


fex = f_extFcn(x);
i = pairLink(1);
j = pairLink(2);
fex{i} = fex{i}+fkij;
fex{j} = fex{j}-fkij;

end
