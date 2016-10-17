clear,clc,close all
%% Tracking control with PD with ID compensation
L = [0.5;0.3]; m = [0.5;0.3]; g = [0;0;-9.81*1];
modelRobot = createRobotArm(L,m,g);
%% input signal construction
h = 1e-2;
stepFcn = @(t,a)(max(0,sign(t-a)));
dircFcn = @(t,a)((max(0,sign(t-a))-max(0,sign(t-(a+h))))/h);
rampFcn = @(t,a)(max(0,t-a));
parbFcn = @(t,a)(rampFcn(t,a).^2);
% xdFcn = {@(t)(1/2*(pi/4/2.5*parbFcn(t,0)-pi/4/1.25*parbFcn(t,2.5)+pi/4/1.25*parbFcn(t,5)-pi/4/1.25*parbFcn(t,7.5)));
%          @(t)(1/2*(pi/4/2.5*parbFcn(t,0)-pi/4/1.25*parbFcn(t,2.5)+pi/4/1.25*parbFcn(t,5)-pi/4/1.25*parbFcn(t,7.5)))};
xdFcn = {@(t)(pi/4/2.5*rampFcn(t,0)-pi/4/1.25*rampFcn(t,2.5)+pi/4/1.25*rampFcn(t,5)-pi/4/1.25*rampFcn(t,7.5));
         @(t)(pi/4/2.5*rampFcn(t,0)-pi/4/1.25*rampFcn(t,2.5)+pi/4/1.25*rampFcn(t,5)-pi/4/1.25*rampFcn(t,7.5))};
vdFcn = {@(t)(pi/4/2.5*stepFcn(t,0)-pi/4/1.25*stepFcn(t,2.5)+pi/4/1.25*stepFcn(t,5)-pi/4/1.25*stepFcn(t,7.5));
         @(t)(pi/4/2.5*stepFcn(t,0)-pi/4/1.25*stepFcn(t,2.5)+pi/4/1.25*stepFcn(t,5)-pi/4/1.25*stepFcn(t,7.5))};
adFcn = {@(t)(pi/4/2.5*dircFcn(t,0)-pi/4/1.25*dircFcn(t,2.5)+pi/4/1.25*dircFcn(t,5)-pi/4/1.25*dircFcn(t,7.5));
         @(t)(pi/4/2.5*dircFcn(t,0)-pi/4/1.25*dircFcn(t,2.5)+pi/4/1.25*dircFcn(t,5)-pi/4/1.25*dircFcn(t,7.5))};
%% dinamic model with joint PD controller with G compensation
b = 0.1;
f_extFcn = @(t,x)({[0;-b*x(3)+b*x(4);0;0;0;0],...
                   [0;       -b*x(4);0;0;0;0]});
kp = 10; kd = 1.0;
controlSignalFcn = @(t,x)(HandC(modelRobot,x([1,2]),[0;0],{})*...
                          [kp*(xdFcn{1}(t)-x(1))+kd*(1*vdFcn{1}(t)-x(3))+1*adFcn{1}(t);...
                           kp*(xdFcn{2}(t)-x(2))+kd*(1*vdFcn{2}(t)-x(4))+1*adFcn{2}(t)]...
                          +1*ID(modelRobot,x([1,2]),0*x([3,4]),[0;0],f_extFcn(t,x)));
dynModelRobot = @(t,x)([x(3:4);FDab(modelRobot,x(1:2),x(3:4),controlSignalFcn(t,x),f_extFcn(t,x))]);
%% simulation
q = [0;0]; qd = [0;0];
options = odeset('RelTol',1e-6);
tic
[t_data,q_data] = ode45(dynModelRobot,[0,10],[q;qd],options);
toc
%% post-processing
showmotion(modelRobot,t_data,q_data(:,[1 2])')
%%
figure(3)
plot(t_data,q_data(:,[1 2]),'--'),hold on, grid on
%%
figure(4)
yd = [xdFcn{1}(t_data) xdFcn{2}(t_data)];
plot(t_data,yd-q_data(:,[1 2]),'--'),hold on, grid on
