clear,clc,close all
%% Tracking control with P and transpose jacobian
L = [0.5;0.3]; m = [0.5;0.3]; g = [0;0;-9.81*0];
modelRobot = createRobotArm(L,m,g);
%% model for robot and controller
kp = 150.0;kd = 3.5;
[dynModelRobot,xdFcn] = makeDynRobotIDandJacobian(modelRobot,kp,kd);
%% simulation
q = [0;-1*pi/2]; qd = [0;0];
options = odeset('RelTol',1e-4);
tic
[t_data,q_data] = ode45(dynModelRobot,[0,60],[q;qd],options);
toc
%% post-processing
showmotion(modelRobot,t_data,q_data(:,[1 2])')
%%
figure(3)
plot(t_data,q_data(:,[1 2]),'--'),hold on, grid on
%%
phTray = zeros(length(t_data),3);
for i = 1:length(t_data)
    [~,phTray(i,:)] = dynModelRobot(t_data(i),q_data(i,:)');
end
%%
xtr = xdFcn(t_data');
figure(4)
plot(t_data,xtr(1,:)-phTray(:,1)',t_data,xtr(3,:)-phTray(:,3)'),hold on, grid on
%%
figure(5)
for i = 1:length(t_data)
    plot(xtr(1,i),xtr(3,i),'*',...
         phTray(i,1),phTray(i,3),'*'),hold on, grid on
    title(['time: ',num2str(t_data(i))])
    drawnow
end

