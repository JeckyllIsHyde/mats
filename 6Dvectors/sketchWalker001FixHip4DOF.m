clear,clc,close all
%%
L = [0.846;0.441;0.4428;0.441;0.4428];m = [46.26;8;3;8;3]; 
g = [0;0;-9.81*1];
walker = createWalker4DOF(L,m,g)
%% dinamic model with human-based joint limits
b = 2.0;
f_extFcn = @(x)({[0;-b*(x(6) -x(7) -x(9));0;0;0;0],...
                [0;-b*(x(7) -x(8));0;0;0;0],...
                [0;-b*(x(8));0;0;0;0],...
                [0;-b*(x(9)-x(10));0;0;0;0],...
                [0;-b*x(10);0;0;0;0]});
f_extFcn = @(x)(walker.limitJointForcesFnc(x,f_extFcn));
%% springs
Ln = 0.1;k = 1e3;
resortes.p = [{[]},[walker.L(2)/2;0;0],{[]},[walker.L(4)/2;0;0],{[]}];
resortes.pairLink = [2;4];
f_extFcn = @(x)(walker.muscleForceSystemFcn(walker,x,resortes,k,Ln,f_extFcn));
%%
dynModelWalker = @(t,x)([x(6:10);FDab(walker,x(1:5),x(6:10),zeros(5,1),f_extFcn(x))]);
%%
q = [0;0;0;pi/2;0]; qd = zeros(5,1);
% q = q_data(end,1:5);qd = q_data(end,6:10);
options = odeset('RelTol',1e-4);
tic
[t_data,q_data] = ode15s(dynModelWalker,[0,15],[q;qd],options);
toc
%%
showmotion(walker,t_data,q_data(:,1:5)')
%%
figure(3)
subplot(211),plot(t_data,180/pi*q_data(:,1:5),'--',...
                  [0,15],repmat([-30;-130;110;15],1,2),'k-'),hold on, grid on
subplot(212),plot(t_data,180/pi*q_data(:,6:10),'--'),hold on, grid on
