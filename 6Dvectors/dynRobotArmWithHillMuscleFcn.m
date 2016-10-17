function xp  = dynRobotArmWithHillMuscleFcn(model,x,p,k,b,Ln)

q = x(1:2);qd = x(3:4);
d = x(5);

k_muscle = k(1);b_muscle = b(1);
k_tendon = k(2);b_joint = b(2);

Xtmp = eye(6);
for i = 1:model.NB
    [ XJ, S{i} ] = jcalc( model.jtype{i}, q(i) );
%    vJ = S{i}*qd(i); % activar en entrada directa al musculo
    Xup{i} = XJ * model.Xtree{i};
%    if model.parent(i) == 0 % activar en entrada directa al musculo
%        v{i} = vJ;
%    else
%        v{i} = Xup{i}*v{model.parent(i)} + vJ;
%    end
    Xtmp = Xup{i}*Xtmp;
    pG{i} = Xpt(inv(Xtmp),p{i});
%    vG{i} = Vpt(Xtmp\v{i},pG{i}); % activar en entrada directa al musculo
end

Lk = norm(pG{2}-pG{1});
nLk = (pG{2}-pG{1})/Lk;
% ud3 = (vG{2}-vG{1})'*nLk; % activar en entrada directa al musculo
u3 = (Lk-sum(Ln));
f_tendon = k_tendon*(u3-d)*nLk;
% f_tendon = k_tendon*(d)*nLk; % activar en entrada directa al musculo
f_muscle = Fpt(f_tendon,pG{1});
% friccion viscosa en articulaciones
fb1 = [0;-b_joint*x(3)+b_joint*x(4);0;0;0;0];
fb2 = [0;             -b_joint*x(4);0;0;0;0];
% gravedad sobre las articulaciones
g = [0;0;-9.81]*0;
fg = {Fpt(g,pG{1}),Fpt(g,pG{2})};
% fuerzas externas totales
f_ext = {fb1-fb2+f_muscle+fg{1},...
         fb2-f_muscle+fg{2}};
% torques de articulacion     
tau = [0;0];
% ecuacion de estado del musculo 
dd = (-(k_tendon+k_muscle)*d + k_tendon*u3)/b_muscle;
% dd = (-(k_tendon+k_muscle)*d + k_muscle*u3)/b_muscle + ud3; % activar en entrada directa al musculo
%
xp = [qd;
      FDcrb(model,x(1:2),x(3:4),tau,f_ext);
      dd];
