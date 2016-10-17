function [p,J,Jp] = directKinematics(model,q,qd,ph)

J = zeros(6,model.NB);
Jp = zeros(6,model.NB);
for i = 1:model.NB
    [XJ,s] = jcalc( model.jtype{i}, q(i) );
    vJ = s*qd(i);
    Xup{i} = XJ * model.Xtree{i};
    J(:,i) = Xup{i}\s;
    if model.parent(i) == 0
        v{i} = vJ;
    else
        v{i} = Xup{i}*v{model.parent(i)} + vJ;
        Jp(:,i) = crm(v{i})*s;
    end
end

Xtmp = eye(6);
for i = 1:model.NB
    Xtmp = Xup{i}*Xtmp;
end

p = Xpt(inv(Xtmp),ph);
