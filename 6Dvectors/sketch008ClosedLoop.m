clear,clc,close all
%% Closed-loop example
% x^2 = L1^2+L2^2+2*L1*L2*cos(q2)
% x*sin(q1) = L2*sin(q2)
% q1 = atan2(L2*sin(q2),L2*cos(q2)+L1)
% option 1
% q1 = y1;
% q2 = f1(y1);
% option 2
% q2 = y2;
% q1 = f2(y2);
% q = [atan2(-L2*sin(q2),L2*cos(q2)+L1);q2];
%%
% x = L1*cos(q1)+L2*cos(q1+q2); % Direct Kinematics
% 0 = L1*sin(q1)+L2*sin(q1+q2); % Direct Kinematics
L1 = 0.5;L2 = 0.3;
q2 = 0:0.01:2*pi;
q1 = atan2(-L2*sin(q2),L2*cos(q2)+L1);
figure(1)
plot(180/pi*q2,180/pi*q1),hold on, grid on
x = L1*cos(q1)+L2*cos(q1+q2);
figure(2)
plot(180/pi*q2,x),hold on, grid on
y = L1*sin(q1)+L2*sin(q1+q2);
figure(3)
plot(180/pi*q2,y),hold on, grid on
%%
% gammaFcn = @(y)([atan2(-L2*sin(y),L2*cos(y)+L1);y]);
% GFcn = @(y)([ -(L2*(L2 + L1*cos(y)))./(L1^2 + 2*cos(y)*L1*L2 + L2^2);1]); 
% gFcn = @(y,yd)([((L1*L2*sin(y)*(L1^2 - L2^2))./(L1^2 + 2*cos(y)*L1*L2 + L2^2)^2).*yd.^2;0]);
%% Robot with a viscous friction constraint
L = [0.5;0.3]; m = [0.5;0.3]; g = [0;0;-9.81*1];
modelRobot = createRobotArm(L,m,g);
%% model for robot
b = 0.008;
% f_extFcn = @(t,x)({[0;-b*x(3)+b*x(4);0;0;0;0],...
%                    [0;       -b*x(4);0;0;0;0]});
k = 50;b = 0.01;Ln = 0.1;
p = {[0.25;0;0],[0.15;0;0]};
f_extFcn = @(t,x)(springLoadFcn(modelRobot,p,x,k,b,Ln));
dynModelRobot = @(t,x)([x(3:4);FDgq(modelRobot,x(1:2),x(3:4),[0;0],f_extFcn(t,x))]);
%% simulation
q = [0;0*pi/2]; qd = [0;0];
options = odeset('RelTol',1e-4);
tic
[t_data,q_data] = ode45(dynModelRobot,[0,10],[q;qd],options);
toc
%% post-processing
showmotion(modelRobot,t_data,q_data(:,[1 2])')
%%
figure(5)
plot(t_data,q_data(:,[1 2]),'*'),hold on, grid on
