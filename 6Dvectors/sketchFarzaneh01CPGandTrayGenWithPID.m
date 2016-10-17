clear,clc
%% CGPs for industrial robots' trajectory generation (1-4 study cases)
% [1] Y. Farzaneh and a. Akbarzadeh, “A bio-inspired approach for online 
%     trajectory generation of industrial robots,” Adapt. Behav., vol. 20, 
%     no. 3, pp. 191–208, 2012.
m = [2;3];L = [0.4845;0.4165];g = [0;0;0];
modelRobot =  createRobot2R(m,L,g);
%%
pA = [ 0.4;0.5;0];
qA = modelRobot.invCinFcn(pA,modelRobot);
pB = [-0.4;0.3;0];
qB = modelRobot.invCinFcn(pB,modelRobot);
pC = [-0.4;0.7;0];
qC = modelRobot.invCinFcn(pC,modelRobot);
pD = [-0.5;0.5;0];
qD = modelRobot.invCinFcn(pD,modelRobot);
%%
showmotion(modelRobot,[0,8],[qA qB])
%% Case 1:
R = (qB-qA)/2;
v = 1/2/8*[1;1];
th0 = [0;0];
a = 7*[1;1];
f_extFcn = {};
Kp = 100;Ki = 1;Kd = 10;
uPID_fcn = @(x,model)(Kp*((x(7:8).*(1-cos(x(5:6)-th0))+qA)-x(1:2))+...
                      Ki*x(11:12)+...
                      Kd*(0-x(3:4))+[1;0]*0);
dynModelRobot = @(t,x)([x(3:4);...
    FDab(modelRobot,x(1:2),x(3:4),uPID_fcn(x,modelRobot),f_extFcn);...
    2*pi*v;...
    x(9:10);...
    a.*(a/4.*(R-x(7:8))-x(9:10));...
    ((R.*(1-cos(x(5:6)-th0))+qA)-x(1:2))]);
%% simulation
q = qA; qd = [0;0];th = [0;0];r = [0;0;0;0];ei = [0;0];
options = odeset('RelTol',1e-6);
tic
[t_data,q_data] = ode15s(dynModelRobot,[0,32],[q;qd;th;r;ei],options);
toc
%% post-processing
showmotion(modelRobot,t_data,q_data(:,[1 2])')
%%
figure(3)
plot(t_data,q_data(:,[1:4]),'-'),hold on, grid on, axis tight
figure(4)
p = modelRobot.fwrCinFcn(q_data(:,[1 2])',modelRobot);
plot(p(1,:),p(2,:),'-'),hold on, grid on
tau = zeros(2,length(t_data));
accel = zeros(2,length(t_data));
for i = 1:length(t_data)
    x = q_data(i,:)';
    tau(:,i) = uPID_fcn(x,modelRobot);
    accel(:,i) = FDab(modelRobot,x(1:2),x(3:4),tau(:,i),f_extFcn); 
end
figure(5)
plot(t_data,tau,'-'),hold on, grid on, axis tight
figure(6)
plot(t_data,accel,'-'),hold on, grid on, axis tight
figure(7)
jerk = [diff(accel(1,:)')./diff(t_data),diff(accel(2,:)')./diff(t_data)];
plot(diff(cumsum(t_data)),jerk,'-'),hold on, grid on, axis tight
%% Case 2:
Rb = (qB-qA)/2;
Rc = (qC-qA)/2;
v = 1/2/8*[1;1];
a = 7*[1;1];
th0 = [0;0];
f_extFcn = {};
Kp = 100;Ki = 10;Kd = 10;
stepFcn = @(t,a)(max(0,sign(t-a)));
Rfcn = @(t)(Rb*stepFcn(t,0)+(Rc-Rb)*stepFcn(t,16));
uPID_fcn = @(x,model)(Kp*((x(7:8).*(1-cos(x(5:6)-th0))+qA)-x(1:2))+...
                      Ki*x(11:12)+...
                      Kd*(0-x(3:4))+[1;0]*0);
dynModelRobot = @(t,x)([x(3:4);...
    FDab(modelRobot,x(1:2),x(3:4),uPID_fcn(x,modelRobot),f_extFcn);...
    2*pi*v;...
    x(9:10);...
    a.*(a/4.*(Rfcn(t)-x(7:8))-x(9:10));...
    ((x(7:8).*(1-cos(x(5:6)-th0))+qA)-x(1:2))]);
%% simulation
q = qA; qd = [0;0];th = [0;0];r = [0;0;0;0];ei = [0;0];
options = odeset('RelTol',1e-6);
tic
[t_data,q_data] = ode15s(dynModelRobot,[0,32],[q;qd;th;r;ei],options);
toc
%% post-processing
showmotion(modelRobot,t_data,q_data(:,[1 2])')
%%
figure(3)
plot(t_data,q_data(:,[1:4]),'-'),hold on, grid on, axis tight
figure(4)
p = modelRobot.fwrCinFcn(q_data(:,[1 2])',modelRobot);
plot(p(1,:),p(2,:),'-'),hold on, grid on
tau = zeros(2,length(t_data));
accel = zeros(2,length(t_data));
for i = 1:length(t_data)
    x = q_data(i,:)';
    tau(:,i) = uPID_fcn(x,modelRobot);
    accel(:,i) = FDab(modelRobot,x(1:2),x(3:4),tau(:,i),f_extFcn); 
end
figure(5)
plot(t_data,tau,'-'),hold on, grid on, axis tight
figure(6)
plot(t_data,accel,'-'),hold on, grid on, axis tight
figure(7)
jerk = [diff(accel(1,:)')./diff(t_data),diff(accel(2,:)')./diff(t_data)];
plot(diff(cumsum(t_data)),jerk,'-'),hold on, grid on, axis tight
%% Case 3:
Rb = (qB-qA)/2;
Rc = (qC-qA)/2;
v = 1/2/8*[1;1];
a = 7*[1;1];
th0 = [0;0];
f_extFcn = {};
Kp = 100;Ki = 1;Kd = 17;
stepFcn = @(t,a)(max(0,sign(t-a)));
Rfcn = @(t)(Rb*stepFcn(t,0)+(Rc-Rb)*stepFcn(t,4));
uPID_fcn = @(x,model)(Kp*((x(7:8).*(1-cos(x(5:6)-th0))+qA)-x(1:2))+...
                      Ki*x(11:12)+...
                      Kd*(0-x(3:4))+[1;0]*0);
dynModelRobot = @(t,x)([x(3:4);...
    FDab(modelRobot,x(1:2),x(3:4),uPID_fcn(x,modelRobot),f_extFcn);...
    2*pi*v;...
    x(9:10);...
    a.*(a/4.*(Rfcn(t)-x(7:8))-x(9:10));...
    ((x(7:8).*(1-cos(x(5:6)-th0))+qA)-x(1:2))]);
%% simulation
q = qA; qd = [0;0];th = [0;0];r = [0;0;0;0];ei = [0;0];
options = odeset('RelTol',1e-6);
tic
[t_data,q_data] = ode15s(dynModelRobot,[0,16],[q;qd;th;r;ei],options);
toc
%% post-processing
showmotion(modelRobot,t_data,q_data(:,[1 2])')
%%
figure(3)
plot(t_data,q_data(:,[1:4]),'-'),hold on, grid on, axis tight
figure(4)
p = modelRobot.fwrCinFcn(q_data(:,[1 2])',modelRobot);
plot(p(1,:),p(2,:),'-'),hold on, grid on
tau = zeros(2,length(t_data));
accel = zeros(2,length(t_data));
for i = 1:length(t_data)
    x = q_data(i,:)';
    tau(:,i) = uPID_fcn(x,modelRobot);
    accel(:,i) = FDab(modelRobot,x(1:2),x(3:4),tau(:,i),f_extFcn); 
end
figure(5)
plot(t_data,tau,'-'),hold on, grid on, axis tight
figure(6)
plot(t_data,accel,'-'),hold on, grid on, axis tight
figure(7)
jerk = [diff(accel(1,:)')./diff(t_data),diff(accel(2,:)')./diff(t_data)];
plot(diff(cumsum(t_data)),jerk,'-'),hold on, grid on, axis tight
%% Case 4:
Rb = (qB-qA)/2;
Rc = (qC-qA)/2;
Rd = (qD-qA)/2;
v = 1/2/8*[1;1];
a = 7*[1;1];
th0 = [0;0];
f_extFcn = {};
Kp = 100;Ki = 10;Kd = 50;
stepFcn = @(t,a)(max(0,sign(t-a)));
Rfcn = @(t)(Rb*stepFcn(t,0)+(Rc-Rb)*stepFcn(t,3)+(Rd-Rc)*stepFcn(t,6));
uPID_fcn = @(x,model)(Kp*((x(7:8).*(1-cos(x(5:6)-th0))+qA)-x(1:2))+...
                      Ki*x(11:12)+...
                      Kd*(0-x(3:4))+[1;0]*0);
dynModelRobot = @(t,x)([x(3:4);...
    FDab(modelRobot,x(1:2),x(3:4),uPID_fcn(x,modelRobot),f_extFcn);...
    2*pi*v;...
    x(9:10);...
    a.*(a/4.*(Rfcn(t)-x(7:8))-x(9:10));...
    ((x(7:8).*(1-cos(x(5:6)-th0))+qA)-x(1:2))]);
%% simulation
q = qA; qd = [0;0];th = [0;0];r = [0;0;0;0];ei = [0;0];
options = odeset('RelTol',1e-6);
tic
[t_data,q_data] = ode15s(dynModelRobot,[0,16],[q;qd;th;r;ei],options);
toc
%% post-processing
showmotion(modelRobot,t_data,q_data(:,[1 2])')
%%
figure(3)
plot(t_data,q_data(:,[1:4]),'-'),hold on, grid on, axis tight
figure(4)
p = modelRobot.fwrCinFcn(q_data(:,[1 2])',modelRobot);
plot(p(1,:),p(2,:),'-'),hold on, grid on
tau = zeros(2,length(t_data));
accel = zeros(2,length(t_data));
for i = 1:length(t_data)
    x = q_data(i,:)';
    tau(:,i) = uPID_fcn(x,modelRobot);
    accel(:,i) = FDab(modelRobot,x(1:2),x(3:4),tau(:,i),f_extFcn); 
end
figure(5)
plot(t_data,tau,'-'),hold on, grid on, axis tight
figure(6)
plot(t_data,accel,'-'),hold on, grid on, axis tight
figure(7)
jerk = [diff(accel(1,:)')./diff(t_data),diff(accel(2,:)')./diff(t_data)];
plot(diff(cumsum(t_data)),jerk,'-'),hold on, grid on, axis tight
%%
figure(8)
plot(q_data(:,1),q_data(:,3),'-'),hold on, grid on
figure(9)
plot(q_data(:,2),q_data(:,4),'-'),hold on, grid on
