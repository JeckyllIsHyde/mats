function model = createRobotRP(m,g)

model.m = m;
model.NB = 2;
model.Xtree = {xlt([0;0;0]),xlt([0;0;0])};
model.jtype = {'Ry','Px'};
model.parent = [0,1];
model.I = { zeros(6),...
            mcI(m,zeros(1,3),zeros(3))};

model.appearance.base = ...
    { 'sphere',[0.0,0.0,0.0],0.05, ...
    };

model.appearance.body{1} = ...
    { 'colour', [0.0,1.0,0.0],...
      'line', [0 0 0; 2.5 0 0;], ...
    };

model.appearance.body{2} = ...
    { 'colour', [0.0,0.0,1.0],...
      'sphere',[0.0,0.0,0.0],0.1, ...
    };

model.gravity = g;

model.gamma_q = @gamma_q;

%model.gc.body = 2;
%model.gc.point = [L(2);0;0];

%model.contactFcn = @contactFcn;

%model.dynModelWithCoulombContactFcn = @dynModelWithCoulombContactFcn;

%model.dynModelWithFreeBaseFcn = @dynModelWithFreeBaseFcn;

%model.dynModelFBWithCoulombContactFcn = @dynModelFBWithCoulombContactFcn;

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
