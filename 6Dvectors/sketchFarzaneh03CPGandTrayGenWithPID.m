clear,clc % close all
%% CGPs for industrial robots' trajectory generation (approx. vs interpol.)
% [1] Y. Farzaneh, A. Akbarzadeh, and A. A. Akbari, “New automated learning
%     CPG for rhythmic patterns,” Intell. Serv. Robot., vol. 5, no. 3, 
%     pp. 169–177, 2012.
m = [2.80;1.13;0.73];I = [4.17e-2;7.04e-3;2.36e-3];
L = [0.30146;0.19831;0.07382];g = [0;0;0];
modelRobot =  createRobot3R(m,I,L,g);
%%
figure(5)
ax = axes();hold on,grid on
axis equal
axis([-0.2,0.5,-0.1,0.6])
win1 = get(ax,'position');
set(ax,'position',[win1(1),win1(2)+win1(4)/4,win1(3),win1(4)*3/4],...
       'box','on')
handles = drawModel(modelRobot,ax);
positionModel(modelRobot,zeros(9,1),handles);
%% Known points for interpolation and approximation of circle trajectory
% 1) interpolation
n = 6;
c = [0;3]; r = 0.1;
circleFcn = @(s,s0)(r*[cos(s+s0)+c(1);sin(s+s0)+c(2)]);
sTarget = -2*pi*(0:n)/n;s0 = pi/2;
pTarget = circleFcn(sTarget,s0);
figure(5)
plot(pTarget(1,:),pTarget(2,:),'o')
qTarget = zeros(3,n);
for i = 1:n+1
    qTarget(:,i) = modelRobot.invCinFcn([pTarget(:,i);0],150*pi/180,modelRobot);
    positionModel(modelRobot,qTarget(:,i),handles);
    drawnow
    pause
end
T = 2;w = 2*pi/T;
tTarget = -sTarget/w;
figure(3)
subplot(311),plot(tTarget,qTarget(1,:),'o'),grid on, hold on
title('Joint Position'),ylabel('q_1')
subplot(312),plot(tTarget,qTarget(2,:),'o'),grid on, hold on
ylabel('q_2')
subplot(313),plot(tTarget,qTarget(3,:),'o'),grid on, hold on
xlabel('time'),ylabel('q_3')
%% Coupled CPGs, finding parameters
basisFcn = @(t,w)([ones(size(t)),sin(w*t),cos(w*t),...
                                 sin(2*w*t),cos(2*w*t),sin(3*w*t)]);
C = [basisFcn(tTarget(1),w/2);
     basisFcn(tTarget(2),w/2);
     basisFcn(tTarget(3),w/2);
     basisFcn(tTarget(4),w/2);
     basisFcn(tTarget(5),w/2);
     basisFcn(tTarget(6),w/2)]\qTarget(:,1:end-1)';
t = (0:0.01:1)*T;
q = basisFcn(t',w)*C;
figure(3)
subplot(311),plot(t,q(:,1),'-'),grid on, hold on
subplot(312),plot(t,q(:,2),'-'),grid on, hold on
subplot(313),plot(t,q(:,3),'-'),grid on, hold on
%% 2) apporximation
n = 6;
c = [0;3]; r = 0.1;
circleFcn = @(s,s0)(r*[cos(s+s0)+c(1);sin(s+s0)+c(2)]);
sTarget = -2*pi*(0:n)/n;s0 = pi/2;
pTarget = circleFcn(sTarget,s0);
figure(5)
plot(pTarget(1,:),pTarget(2,:),'o')
qTarget = zeros(3,n);
for i = 1:n+1
    qTarget(:,i) = modelRobot.invCinFcn([pTarget(:,i);0],150*pi/180,modelRobot);
    positionModel(modelRobot,qTarget(:,i),handles);
    drawnow
    pause
end
T = 2;w = 2*pi/T;
tTarget = -sTarget/w;
figure(3)
subplot(311),plot(tTarget,qTarget(1,:),'o'),grid on, hold on
title('Joint Position'),ylabel('q_1')
subplot(312),plot(tTarget,qTarget(2,:),'o'),grid on, hold on
ylabel('q_2')
subplot(313),plot(tTarget,qTarget(3,:),'o'),grid on, hold on
xlabel('time'),ylabel('q_3')
%% Coupled CPGs, finding parameters
basisFcn = @(t,w)([ones(size(t)),sin(w*t),cos(w*t),...
                                 sin(2*w*t),cos(2*w*t),sin(3*w*t)]);
C = [basisFcn(tTarget(1),w/2);
     basisFcn(tTarget(2),w/2);
     basisFcn(tTarget(3),w/2);
     basisFcn(tTarget(4),w/2);
     basisFcn(tTarget(5),w/2);
     basisFcn(tTarget(6),w/2)]\qTarget(:,1:end-1)';
t = (0:0.01:1)*T;
q = basisFcn(t',w)*C;
figure(3)
subplot(311),plot(t,q(:,1),'-'),grid on, hold on
subplot(312),plot(t,q(:,2),'-'),grid on, hold on
subplot(313),plot(t,q(:,3),'-'),grid on, hold on
%% creating the CPG dynamics
w = 4;                                 % strength coupling
v = repmat([1;2;3]/2/T,3,1);           % cpg intrinsic frecuencies
W = sparse(zeros(9));                  % cpg network topology. See paper.
W(2:3,1) = 1;
W(4,1) = 1;W(5:6,4) = 1;
W(7,4) = 1;W(8:9,7) = 1;
%W = W+W';
%W = W';
R = reshape(C(2:4,:),[],1);            % defining CPGs' ratio cycles
nCPG = 9;a = 7;                        % number of CPGs and critical damping
stepFcn = @(t,a)(max(0,sign(t-a)));    % step function
% probe with times, pP and steps on R_Fcn
dh = 0.5;pP = 0.0;                     % a perturbation fcn on phi and R
phiFcn = @(t)([-pP*(stepFcn(t,2-dh/2)-stepFcn(t,2+dh/2))/dh;zeros(nCPG-1,1)]);
R_Fcn = @(t)(R+(-R*stepFcn(t,8)+R*stepFcn(t,10))*0);
% dynamic system function
dynCPG_NetworkFcn = @(t,th)([2*pi*v+phiFcn(t)+...
    w*sum(W.*sin(repmat(th(1:nCPG),1,nCPG)'-...
                 (repmat(v,1,nCPG)./repmat(v,1,nCPG)')'.*repmat(th(1:nCPG),1,nCPG)),2);...
    th(2*nCPG+1:3*nCPG);...
    a*(a/4*(R_Fcn(t)-th(nCPG+1:2*nCPG))-th(2*nCPG+1:3*nCPG))]);
%% simulation and results from distrubing phi and R at t=2
q = zeros(9,1);r = zeros(2*9,1);r(1:nCPG) = R;
options = odeset('RelTol',1e-6);
% cpg dynamic simulation 
tic
[t_data,q_data] = ode45(dynCPG_NetworkFcn,[0,18],[q;r],options);
toc
% cpgs output computation
q1 = C(1,1)+sum(cos(q_data(:,1:3)).*q_data(:,10:12),2);
q2 = C(1,2)+sum(cos(q_data(:,4:6)).*q_data(:,13:15),2);
q3 = C(1,3)+sum(cos(q_data(:,7:9)).*q_data(:,16:18),2);
% graphics
plot(t_data,q1,'-o',...
     t_data,q2,'-o',...
     t_data,q3,'-o')     
%% stand a while on a specific point
f_extFcn = {};
Kp = 100;Ki = 1;Kd = 17;
stepFcn = @(t,a)(max(0,sign(t-a)>=0));
Rfcn = @(t)(Rb*stepFcn(t,0)+(Rc-Rb)*stepFcn(t,4));
t_stop = 8; dt = 2;
dtFcn = @(t)(2*stepFcn(t,t_stop+dt));
CPGs_outputFcn = @(t,x)((1-(stepFcn(t,0)-stepFcn(t,t_stop)+stepFcn(t,t_stop+dt)))*qH+...
                        (stepFcn(t,0)-stepFcn(t,t_stop)+stepFcn(t,t_stop+dt))*...                        
                        [C(1,1)+sum(cos(x(1:3)-2*pi*v(1:3)*dtFcn(t)).*x(10:12),1);
                         C(1,2)+sum(cos(x(4:6)-2*pi*v(4:6)*dtFcn(t)).*x(13:15),1);
                         C(1,3)+sum(cos(x(7:9)-2*pi*v(7:9)*dtFcn(t)).*x(16:18),1)]);
uPID_fcn = @(t,x,model)(Kp*(CPGs_outputFcn(t,x(7:33))-x(1:3))+...
                      Ki*x(34:36)+...
                      Kd*(0-x(4:6))+[1;0;0]*0);
dynModelRobot = @(t,x)([x(4:6);...                % Robot dynamics [dq;q]
    FDab(modelRobot,x(1:3),x(4:6),uPID_fcn(t,x,modelRobot),f_extFcn);...
    dynCPG_NetworkFcn(t,x(7:33));...              % CPG dynamics [phi;dR;R]
    (CPGs_outputFcn(t,x(7:33))-x(1:3))]);         % Integral action [ep]
%% simulation
q = qG; qd = [0;0;0];
th = zeros(9,1);
r = R;%zeros(9,1);
dr = zeros(9,1);
ei = [0;0;0];
options = odeset('RelTol',1e-6);
tic
[t_data,q_data] = ode15s(dynModelRobot,[0,18],[q;qd;th;r;dr;ei],options);
toc
%% post-processing
showmotion(modelRobot,t_data,q_data(:,[1 2 3])')
%%
figure(4)
subplot(211),plot(t_data,q_data(:,1:3),'-'),hold on, grid on
title('position'),ylabel('q_i')
subplot(212),plot(t_data,q_data(:,4:6),'-'),hold on, grid on
title('velocity'),ylabel('dq_i'),xlabel('t')
figure(5)
p = modelRobot.fwrCinFcn(q_data(:,[1 2 3])',modelRobot);
plot(p(1,:),p(2,:),'-'),hold on, grid on
%%
tau = zeros(3,length(t_data));
accel = zeros(3,length(t_data));
for i = 1:length(t_data)
    x = q_data(i,:)';t = t_data(i);
    tau(:,i) = uPID_fcn(t,x,modelRobot);
    accel(:,i) = FDab(modelRobot,x(1:3),x(4:6),tau(:,i),f_extFcn); 
    positionModel(modelRobot,x,handles);
    drawnow
end
%%
figure(6)
plot(t_data,tau,'-'),hold on, grid on, axis tight
title('Torque')
figure(7)
plot(t_data,accel,'-'),hold on, grid on, axis tight
title('Acceleration')
figure(8)
jerk = [diff(accel(1,:)')./diff(t_data),diff(accel(2,:)')./diff(t_data)];
plot(diff(cumsum(t_data)),jerk,'-'),hold on, grid on, axis tight
title('Jerk')
