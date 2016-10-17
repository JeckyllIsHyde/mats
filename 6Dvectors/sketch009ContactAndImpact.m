clear,clc,close all
%% Robot with a viscous friction constraint
L = [0.5;0.3]; m = [0.5;0.3]; g = [0;0;-9.81*1];
modelRobot = createRobotArm(L,m,g);
%% model for robot only contact
b = 0.01;
dynModelRobot = @(t,x)([x(3:4);
                        FDab(modelRobot,...
                             x(1:2),x(3:4),[0;0],...
                             modelRobot.contactFcn(modelRobot,x,b))]);
q = [-pi/2;-pi/2]; qd = [0;0];
x0 = [q;qd];
%% model for robot coulomb and tangent contact
b = 0.01;mu = 0.1;
dynModelRobot = @(t,x)(modelRobot.dynModelWithCoulombContactFcn(modelRobot,x,b,mu));
q = [-pi/2;-pi/2]; qd = [0;0]; u = [0;0];
x0 = [q;qd;u];
%%
options = odeset('RelTol',1e-4);
tic
[t_data,q_data] = ode45(dynModelRobot,[0,10],x0,options);
toc
%% post-processing
showmotion(modelRobot,t_data,q_data(:,[1 2])')
%%
figure(3)
plot(t_data,q_data(:,[1 2]),'.'),hold on, grid on
