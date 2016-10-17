function model = createRobot3R(m,I,L,g)

model.m = m;
model.I = I;
model.L = L;
model.NB = 3;
model.Xtree = {xlt([0;0;0]),xlt([L(1);0;0]),xlt([L(2);0;0])};
model.jtype = {'Rz','Rz','Rz'};
model.parent = [0,1,2];
model.I = { mcI(m(1),[L(1)/2,0,0],I(1)*[0,0,0;0,0,0;0,0,1]),...
            mcI(m(2),[L(2)/2,0,0],I(2)*[0,0,0;0,0,0;0,0,1]),...
            mcI(m(3),[L(3)/2,0,0],I(3)*[0,0,0;0,0,0;0,0,1])};

model.appearance.base = ...
    { 'sphere',[0.0,0.0,0.0],0.05, ...
    };

model.appearance.body{1} = ...
    { 'colour', [1.0,0.0,0.0],...
      'box',[0.0,-0.025,-0.025;L(1),0.025,0.025;], ...
    };

model.appearance.body{2} = ...
    { 'colour', [1.0,1.0,0.0],...
      'box',[0.0,-0.025,-0.025;L(2),0.025,0.025;], ...
    };

model.appearance.body{3} = ...
    { 'colour', [0.0,1.0,0.0],...
      'box',[0.0,-0.025,-0.025;L(3),0.025,0.025;], ...
    };

model.gravity = g;

%model.gamma_q = @gamma_q;

model.invCinFcn = @invCinFcn;

model.fwrCinFcn = @fwrCinFcn;

%model.gc.body = 2;
%model.gc.point = [L(2);0;0];

%model.contactFcn = @contactFcn;

%model.dynModelWithCoulombContactFcn = @dynModelWithCoulombContactFcn;

%model.dynModelWithFreeBaseFcn = @dynModelWithFreeBaseFcn;

%model.dynModelFBWithCoulombContactFcn = @dynModelFBWithCoulombContactFcn;

end

function q = invCinFcn(p,phi,model)

q = zeros(3,1);
X = p-model.L(3)*[cos(phi);sin(phi);0];
c2 = (X'*X-model.L(1:2)'*model.L(1:2))/(2*model.L(1)*model.L(2));
s2 = sqrt(1-c2^2);

k1 = model.L(1)+model.L(2)*c2;
k2 = model.L(2)*s2;

q(2) = atan2(s2,c2);
q(1) = atan2(X(2),X(1))-atan2(k2,k1);
q(3) = phi-sum(q(1:2));

end

function p = fwrCinFcn(q,model)

p = zeros(3,size(q,2));

p(1:2,:) = [model.L(1)*cos(q(1,:)) + model.L(2)*cos(q(1,:)+q(2,:)) + model.L(3)*cos(q(1,:)+q(2,:)+q(3,:));
            model.L(1)*sin(q(1,:)) + model.L(2)*sin(q(1,:)+q(2,:)) + model.L(3)*sin(q(1,:)+q(2,:)+q(3,:))];

end
