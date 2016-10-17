clear,clc,close all
%%
L = [0.5;0.3]; m = [0.5;0.3]; g = [0;0;-9.81*1];
modelRobot = createRobotArm(L,m,g);
%% dinamic model with joint PD controller with G compensation
kp = 10; kd = 1.0;
stepFcn = @(t,a)(max(0,sign(t-a)));
xdFcn = {@(t)(pi/4*stepFcn(t,0)-pi/4*stepFcn(t,2.5)+pi/4*stepFcn(t,5)-pi/4*stepFcn(t,7.5));
         @(t)(pi/4*stepFcn(t,0)-pi/4*stepFcn(t,2.5)+pi/4*stepFcn(t,5)+pi/4*stepFcn(t,7.5))};
controlSignalFcn = @(t,x)([kp*(xdFcn{1}(t)-x(1))-kd*x(3);...
                           kp*(xdFcn{2}(t)-x(2))-kd*x(4)]...
                          +1*ID(modelRobot,x([1,2]),[0;0],[0;0],{}));
b = 0.1;
f_extFcn = @(t,x)({[0;-b*x(3)+b*x(4);0;0;0;0],...
                   [0;       -b*x(4);0;0;0;0]});
dynModelRobot = @(t,x)([x(3:4);FDab(modelRobot,x(1:2),x(3:4),controlSignalFcn(t,x),f_extFcn(t,x))]);
%% simulation
q = [0;0]; qd = [0;0];
options = odeset('RelTol',1e-4);
tic
[t_data,q_data] = ode45(dynModelRobot,[0,10],[q;qd],options);
toc
%% post-processing
showmotion(modelRobot,t_data,q_data(:,[1 2])')
%%
figure(3)
plot(t_data,q_data(:,[1 2]),'-'),hold on, grid on