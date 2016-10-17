clear,clc,close all
%% Tracking control with PD with ID compensation
L = [0.5;0.3]; m = [0.5;0.3]; g = [0;0;-9.81*1];
modelRobot = createRobotArm(L,m,g);
bdata = bufferData(10000,15);
[dynModelRobot,xdFcn] = makeDynRobotFcn(modelRobot,bdata);
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
plot(t_data,q_data(:,[1 2]),'-*'),hold on, grid on
%%
figure(4)
yd = [xdFcn{1}(t_data) xdFcn{2}(t_data)];
plot(t_data,yd-q_data(:,[1 2]),'-*'),hold on, grid on
%% [t;tray_d;x;f_x;u]
% Using bufferData class. Fast but...
maxidx = bdata.getPointer;
figure(5)
plot(bdata.data(1:maxidx,1),bdata.data(1:maxidx,[2,3,8,9])),hold on, grid on
figure(6)
plot(bdata.data(1:maxidx,1),bdata.data(1:maxidx,[4,5,10,11])),hold on, grid on
figure(7)
plot(bdata.data(1:maxidx,1),bdata.data(1:maxidx,[6,7,12,13])),hold on, grid on
figure(8)
plot(bdata.data(1:maxidx,1),bdata.data(1:maxidx,[14,15])),hold on, grid on
%% ... some problems
figure(9)
plot(bdata.data(1:maxidx,1)),hold on,grid on
plot(t_data,'g')
%% Using signals from dynFcn, addtional computational cost and needs more code
signals = zeros(length(t_data),15);
for i = 1:length(t_data)
    [~,signals(i,:)] = dynModelRobot(t_data(i),q_data(i,:)');
end
figure(5)
plot(t_data,signals(:,[2,3,8,9]),'*'),hold on, grid on
figure(6)
plot(t_data,signals(:,[4,5,10,11]),'*'),hold on, grid on
figure(7)
plot(t_data,signals(:,[6,7,12,13]),'*'),hold on, grid on
figure(8)
plot(t_data,signals(:,[14,15]),'*'),hold on, grid on
