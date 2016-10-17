function model = createSphericalPendulum(m,L,g)

% number of bodies
model.NB = 3;
% joint type
model.jtype = {'Rx','Rz','Ry'};
% spatial inertias
miniI = 0*eye(6)*1e-4;
model.I = {miniI,miniI,...
           mcI(m,...
               [L/2;0;0],...
               m*L^2*diag([0.0025,1.015/12,1.015/12]))};
% topology
model.parent = [0,1,2];
% geometry and appereance
model.Xtree = {eye(6),eye(6),eye(6)};
lax = 0.02;
model.appearance.body{1} = ...
    { 'colour', [1.0,0.0,0.0],...
      'cyl',[-lax,0.0,0.0;lax,0.0,0.0;],0.015,...
    };
model.appearance.body{2} = ...
    { 'colour', [0.0,0.0,1.0],...
      'cyl',[0.0,0.0,-lax;0.0,0.0,lax;],0.015,...
    };
model.appearance.body{3} = ...
    { 'colour', [0.0,1.0,0.0],...
      'cyl',[0.0,-lax,0.0;0.0,lax,0.0;],0.015,...
      'colour', [1.0,1.0,0.0],...
      'box',[0,-0.01,-0.01;L,0.01,0.01;],...
      'colour', [1.0,0.0,1.0],...
      'sphere',[L/2,0,0],0.02,...
    };
% base
model.appearance.base = ...
    { 'box',[-lax,-lax,-2*lax;lax,lax,-1.5*lax], ...
    };
% gravity
model.gravity = g;

% some functions
model.viscosuousFrictionFcn = @viscosuousFrictionFcn;
end

function fex = viscosuousFrictionFcn(model,x,b)
% 'Rx','Rz','Ry',... spherical joint

for i = 1:model.NB
    [ XJ, S{i} ] = jcalc( model.jtype{i}, x(i) );
    Xup{i} = XJ * model.Xtree{i};
    vJ{i} = S{i}*x(i+model.NB);
    if model.parent(i) == 0
        Xa{i} = Xup{i};
    else
        Xa{i} = Xup{i} * Xa{model.parent(i)};
    end
end

v13 = (Xa{1}\vJ{1}+Xa{2}\vJ{2}+Xa{3}\vJ{3});
%disp(['vJ: ',num2str(v13')])

fex = {zeros(6,1),zeros(6,1),-b*v13};

end
