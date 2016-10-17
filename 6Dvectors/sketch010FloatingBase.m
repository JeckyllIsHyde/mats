clear,clc,close all
%% Robot with a viscous friction constraint
L = [0.5;0.3]; m = [0.5;0.3]; g = [0;0;-9.81*1];
modelRobot = createRobotArm(L,m,g)
modelRobotFB = floatbase( modelRobot )
%% model for robot with viscous friction by the wind
xbf = [rq(rz(-0*pi/2));[0;0;1];[0;0;0;0;0;0]];
q = [-pi/2;-pi/2]; qd = [0;0];
x0 = [xbf;0*q(2);qd(2)];
b = 10.0;k = 0.0;
f_extFcn = @(t,x)({[],[],[],[],[],...
                   Fpt([0;0;-k*x(7)-b*x(13)],[0.25;0.0;x(7)]),...
                   [0;-b*x(15);0;0;0;0]+0.6*Fpt([0;0;-k*x(7)-b*x(13)],[0.65;0.0;x(7)]),...
                   });
dynModelRobot = @(t,x)(modelRobotFB.dynModelWithFreeBaseFcn(modelRobotFB,t,x,f_extFcn));
%% simulation
options = odeset('RelTol',1e-4);
tic
[t_data,q_data] = ode15s(dynModelRobot,[0,10],x0,options);
toc
%% post-processing
Q = fbanim(q_data(:,1:7)',q_data(:,14)');
showmotion(modelRobotFB,t_data,Q)
%% 
figure(3)
plot(t_data,q_data(:,[7,13]),'.'),hold on, grid on
