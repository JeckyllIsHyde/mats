clear,clc,clf
%% Etiquetas linguisticas
NG=1; NP=2; Z=3; PP=4; PG=5;
%% funciones de pertenencia
x = 10;
% mu = memberFun(x,params);
paramsNG = struct('a',-100,'b',-100,'c',-50,'d',-25); 
funNG = @(x) (memberFun(x,paramsNG))
paramsNP = struct('a',-50,'b',-25,'c',-25,'d',0); 
funNP = @(x) (memberFun(x,paramsNP))
paramsZ = struct('a',-25,'b',0,'c',0,'d',25); 
funZ = @(x) (memberFun(x,paramsZ))
paramsPP = struct('a',0,'b',25,'c',25,'d',50); 
funPP = @(x) (memberFun(x,paramsPP))
paramsPG = struct('a',25,'b',50,'c',100,'d',100); 
funPG = @(x) (memberFun(x,paramsPG))
%%
x=-100:100;
y = zeros(5,length(x));
for i=1:length(x)
    y(:,i) = [funNG(x(i));funNP(x(i));funZ(x(i));funPP(x(i));funPG(x(i))];
end
figure(1)
plot(x,y), hold on, grid on
legend('NG','NP','Z','PP','PG')
%%
cntr = [-75,-25,-25,-25,-25;
        -25,  0, 25,-25,  0;
        -25, 25,  0, 75, 25;
          0, 25, 25,  0, 25;
         25, 25, 25, 25, 75];
%% 
z = [];
for th = -100:100
    for w = -100:100
%        muth = [funNG(th);funNP(th);funZ(th);funPP(th);funPG(th)];
%        muw = [funNG(w);funNP(w);funZ(w);funPP(w);funPG(w)];
%        infe = min(repmat(muw,1,5),repmat(muth',5,1));
%        z = [z sum(sum(infe.*cntr))/sum(sum(infe))];
        z = [z carPendulumFLC(th,w)];
    end
end
%%
figure(2)
surf(reshape(z,201,[]),'edgecolor','none')
hold on, grid on
light
%% FLC
th = 10; w = -5;
u = carPendulumFLC(th,w)