function fkb = springLoadFcn(model,p,x,k,b,Ln)

q = x(1:2);

Xtmp = eye(6);
for i = 1:model.NB
    XJ = jcalc( model.jtype{i}, q(i) );
    Xup{i} = XJ * model.Xtree{i};
    if isempty(p{i}),continue,end
    Xtmp = Xup{i}*Xtmp;
    pG{i} = Xpt(inv(Xtmp),p{i});
end

Lk = norm(pG{2}-pG{1});
fk12 = Fpt(k*(pG{2}-pG{1})/Lk*(Lk-Ln),pG{1});
fb1 = [0;-b*x(3)+b*x(4);0;0;0;0];
fb2 = [0;       -b*x(4);0;0;0;0];
fkb = {fb1-fb2+fk12,...
       fb2-fk12};
