clear,clc,close all
%% Tracking control with P and transpose jacobian
L = [0.5;0.3]; m = [0.5;0.3]; g = [0;0;-9.81*0];
modelRobot = createRobotArm(L,m,g);
%% model for robot and controller
kp = 10000.0;kd = 5000;
[dynModelRobot,xdFcn] = makeDynRobotWithForceFeedback(modelRobot,kp,kd);
%% simulation
q = [0;1*pi/2]; qd = [0;0];
x_c = [0;0;0];xp_c = [0;0;0];
options = odeset('RelTol',1e-4);
tic
[t_data,q_data] = ode15s(dynModelRobot,[0,12],[q;qd;x_c;xp_c]);%,options);
toc
%% post-processing
showmotion(modelRobot,t_data,q_data(:,[1 2])')
%%
figure(3)
plot(t_data,q_data(:,[1 2]),'--'),hold on, grid on
%%
signals = zeros(length(t_data),9);
tic
for i = 1:length(t_data)
    [~,signals(i,:)] = dynModelRobot(t_data(i),q_data(i,:)');
end
toc
%%
xtr = xdFcn(t_data');
figure(4)
plot(t_data,xtr(1,:)-signals(:,1)',t_data,xtr(3,:)-signals(:,3)'),hold on, grid on
%%
figure(5)
plot(xtr(1,:),xtr(3,:),'*',...
     signals(:,1),signals(:,3),'*'),hold on, grid on
%for i = 1:length(t_data)
%    plot(xtr(1,i),xtr(3,i),'*',...
%         signals(i,1),signals(i,3),'*'),hold on, grid on
%    title(['time: ',num2str(t_data(i))])
%    drawnow
%end
%%
figure(6)
plot(t_data,signals(:,7)),hold on,grid on
