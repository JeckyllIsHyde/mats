clear,clc,close all
%% spherical joint
L = 0.5; m = 10;g = [0;0;-9.81];
pendulum = createDoubleSphericalPendulum(m,L,g);
%%
b = 5.00;
NB = 6;
% f_extFcn = @(x)(repmat({zeros(6,1)},1,NB));
tau = zeros(NB,1);
f_extFcn = @(x)(pendulum.viscosuousFrictionFcn(pendulum,x,b));
dynModelRobot = @(t,x)([x(NB+1:2*NB);FDab(pendulum,x(1:NB),x(NB+1:2*NB),tau,f_extFcn(x))]);
%% simulation
q = zeros(NB,1);   q([1,2,3]) = [45;0;0]*pi/180;
qd = zeros(NB,1); qd([1,2,3]) = [0;0;0]*pi/180;
options = odeset('RelTol',1e-4);
tic
[t_data,q_data] = ode15s(dynModelRobot,[0,5],[q;qd],options);
toc
%% post-processing
showmotion(pendulum,t_data,q_data(:,1:NB)')
%%
figure(3)
subplot(211),plot(t_data,q_data(:,1:NB)*180/pi,'-.'),hold on, grid on
subplot(212),plot(t_data,q_data(:,NB+1:2*NB)*180/pi,'-.'),hold on, grid on
%%
pc = zeros(3,length(t_data));
for k = 1:length(t_data)
    x = [q_data(k,:)'];
    for i = 1:pendulum.NB
        [ XJ, S{i} ] = jcalc( pendulum.jtype{i}, x(i) );
        Xup{i} = XJ * pendulum.Xtree{i};
        vJ{i} = S{i}*x(i+pendulum.NB);
        if pendulum.parent(i) == 0
            Xa{i} = Xup{i};
        else
            Xa{i} = Xup{i} * Xa{pendulum.parent(i)};
        end
    end
    pc(:,k) = Xpt(inv(Xa{pendulum.NB}),[L/2;0;0;]);
end
%%
figure(4)
plot(t_data,pc,'-.'),hold on, grid on
%%
figure(5)
plot3(pc(1,:),pc(2,:),pc(3,:),'-.'),hold on, grid on
axis tight,axis equal