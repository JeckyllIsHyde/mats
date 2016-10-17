function model = createRobot2R(m,L,g)

model.m = m;
model.L = L;
model.NB = 2;
model.Xtree = {xlt([0;0;0]),xlt([L(1);0;0])};
model.jtype = {'Rz','Rz'};
model.parent = [0,1];
model.I = { mcI(m(1),[L(1)/2,0,0],m(1)*L(1)^2/12*[1,0,0;0,0,0;0,0,1]),...
            mcI(m(2),[L(2)/2,0,0],m(2)*L(2)^2/12*[1,0,0;0,0,0;0,0,1])};

model.appearance.base = ...
    { 'sphere',[0.0,0.0,0.0],0.05, ...
    };

model.appearance.body{1} = ...
    { 'colour', [0.0,1.0,0.0],...
      'box',[0.0,-0.025,-0.025;L(1),0.025,0.025;], ...
    };

model.appearance.body{2} = ...
    { 'colour', [0.0,0.0,1.0],...
      'box',[0.0,-0.025,-0.025;L(2),0.025,0.025;], ...
    };

model.gravity = g;

model.gamma_q = @gamma_q;

model.invCinFcn = @invCinFcn;

model.fwrCinFcn = @fwrCinFcn;

%model.gc.body = 2;
%model.gc.point = [L(2);0;0];

%model.contactFcn = @contactFcn;

%model.dynModelWithCoulombContactFcn = @dynModelWithCoulombContactFcn;

%model.dynModelWithFreeBaseFcn = @dynModelWithFreeBaseFcn;

%model.dynModelFBWithCoulombContactFcn = @dynModelFBWithCoulombContactFcn;

end

function q = invCinFcn(p,model)

q = zeros(2,1);
c2 = (p'*p-model.L'*model.L)/(2*model.L(1)*model.L(2));
s2 = sqrt(1-c2^2);

q(2) = atan2(s2,c2);
k1 = model.L(1)+model.L(2)*c2;
k2 = model.L(2)*s2;

q(1) = atan2(p(2),p(1))-atan2(k2,k1);

end

function p = fwrCinFcn(q,model)

p = zeros(3,size(q,2));

p(1:2,:) = [model.L(1)*cos(q(1,:)) + model.L(2)*cos(q(1,:)+q(2,:));
            model.L(1)*sin(q(1,:)) + model.L(2)*sin(q(1,:)+q(2,:))];

end

function [q,qd,G,g] = gamma_q( model, qo, qdo )

ld_fcn = @(th)(1.5+sin(th));
dld_fcn = @(th)(cos(th));
d2ld_fcn = @(th)(-sin(th));

y = qo(1);   % y = gamma^-1(q0);
q = [y;ld_fcn(y)];

G = [ 1;dld_fcn(y)];

yd = qdo(1); % yd = d/dt gamma^-1(q0);
qd = G*yd;

Tstab = 0.1;
gs = 2/Tstab*(qd-qdo) + 1/Tstab^2*(q-qo);

g = [0;d2ld_fcn(y)*yd^2]+gs;

end
