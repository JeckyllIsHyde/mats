clear,clc,close all
%% Robot with a viscous friction constraint
L = [0.5;0.3]; m = [0.5;0.3]; g = [0;0;-9.81*1];
modelRobot = createRobotArm(L,m,g)
modelRobotFB = floatbase( modelRobot )
%% model for robot with viscous friction by the wind
xbf = [rq(ry(-0*pi/2));[0;0;1];[0;0;0;0;0;0]];
q = -pi/2; qd = 0;
u = [0;0];
x0 = [xbf;q;qd;u];
b = 0.1;mu = 0.1;
f_extFcn = @(t,x)({[],[],[],[],[],...
                   [0;0;0;0;0;0],...
                   [0;-b*x(15);0;0;0;0],...
                   });
dynModelRobot = @(t,x)(modelRobotFB.dynModelFBWithCoulombContactFcn(modelRobotFB,t,x,mu,f_extFcn));
%% simulation
options = odeset('RelTol',1e-4);
tic
[t_data,q_data] = ode15s(dynModelRobot,[0,20],x0,options);
toc
%% post-processing
Q = fbanim(q_data(:,1:7)',q_data(:,14)');
showmotion(modelRobotFB,t_data,Q)
%% 
figure(3)
plot(t_data,q_data(:,[5 7,11 13]),'.'),hold on, grid on
