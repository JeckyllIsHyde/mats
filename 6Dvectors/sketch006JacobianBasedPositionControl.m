clear,clc,close all
%% Tracking control with P and transpose jacobian
L = [0.5;0.3]; m = [0.5;0.3]; g = [0;0;-9.81*1];
modelRobot = createRobotArm(L,m,g);
%% model for robot and controller 'trp', 'tcg' or 'inv'
dynModelRobot = makeDynRobotTransposeJacobian(modelRobot,'inv');
% [dynModelRobot,xdFcn] = makeDynRobotIDandJacobian(modelRobot);
%% simulation
q = [0;1*pi/2]; qd = [0;0];
options = odeset('RelTol',1e-4);
tic
[t_data,q_data] = ode45(dynModelRobot,[0,20],[q;qd],options);
toc
%% post-processing
showmotion(modelRobot,t_data,q_data(:,[1 2])')
%%
figure(3)
plot(t_data,q_data(:,[1 2]),'.'),hold on, grid on
%%
figure(4)
yd = [xdFcn{1}(t_data) xdFcn{2}(t_data)];
plot(t_data,yd-q_data(:,[1 2]),'-'),hold on, grid on
