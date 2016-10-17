clear,clc,close all
%%
L = [0.846;0.441;0.4428;0.441;0.4428];m = [46.26;8;3;8;3]; 
g = [0;0;-9.81*1];
walker = createWalker4DOF(L,m,g);
walkerFB = floatbase( walker )
%% dinamic model with human-based joint limits
%xbf = [rq(ry(-0*pi/2));[0;0;1];[0;0;0;0;0;0]];
%q = [0;0;pi/2;0]; 
xbf = [rq(ry(1*pi/2));[0;0;2];[0;0;0;0;0;0]];
q = [-1*pi*20/180;0;1*pi*20/180;0]; 
qd = [0;0;0;0];
u = [0;0;0;0];
x0 = [xbf;q;qd;u];
b = 2.5;mu = 0.1;
f_extFcn = @(x)({...
                [0;-b*(x(6) -x(7) -x(9));0;0;0;0],...
                [0;-b*(x(7) -x(8));0;0;0;0],...
                [0;-b*(x(8));0;0;0;0],...
                [0;-b*(x(9)-x(10));0;0;0;0],...
                [0;-b*x(10);0;0;0;0]});
f_extFcn = @(x)(walkerFB.limitJointForcesFnc(x,f_extFcn));
%%
Ln = 0.1;k = 1e2;
resortes.p = [{[]},[walker.L(2)/2;0;0],{[]},[walker.L(4)/2;0;0],{[]}];
resortes.pairLink = [2;4];
f_extFcn = @(x)(walker.muscleForceSystemFcn(walker,x,resortes,k,Ln,f_extFcn));
%%
dynModelRobot = @(t,x)(walkerFB.dynModelFBWithCoulombContactFcn(walkerFB,x,mu,f_extFcn));
%%
% x0 = q_data(end,:);
options = odeset('RelTol',1e-4);
tic
[t_data,q_data] = ode15s(dynModelRobot,[0,10],x0);%,options);
toc
%% post-processing
Q = fbanim(q_data(:,1:7)',q_data(:,14:17)');
showmotion(walkerFB,t_data,Q)
%%
figure(4)
subplot(221),plot(t_data,q_data(:,[5 7]),'.-'),hold on, grid on
subplot(223),plot(t_data,q_data(:,[11 13]),'.-'),hold on, grid on
subplot(222),plot(t_data,q_data(:,[14:17]),'.-'),hold on, grid on
subplot(224),plot(t_data,q_data(:,[18:21]),'.-'),hold on, grid on
