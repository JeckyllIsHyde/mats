clear,clc % close all
%% CGPs for industrial robots' trajectory generation (5 study cases)
% [1] Y. Farzaneh and a. Akbarzadeh, “A bio-inspired approach for online 
%     trajectory generation of industrial robots,” Adapt. Behav., vol. 20, 
%     no. 3, pp. 191–208, 2012.
m = [2.80;1.13;0.73];I = [4.17e-2;7.04e-3;2.36e-3];
L = [0.30146;0.19831;0.07382];g = [0;0;0];
modelRobot =  createRobot3R(m,I,L,g);
%%
figure(5)
ax = axes();hold on,grid on
axis equal
axis([-0.1,0.6,-0.1,0.6])
win1 = get(ax,'position');
set(ax,'position',[win1(1),win1(2)+win1(4)/4,win1(3),win1(4)*3/4],...
       'box','on')
handles = drawModel(modelRobot,ax);
positionModel(modelRobot,zeros(9,1),handles);
%%
pG = [ 0.57;0.0;0];
qG = modelRobot.invCinFcn(pG,0,modelRobot);
pH = [ 0.0;0.5;0];
qH = modelRobot.invCinFcn(pH,pi/2,modelRobot);
pI = [ 0.4;0.25;0];
qI = modelRobot.invCinFcn(pI,0,modelRobot);
pK = [ 0.3;0.3;0];
qK = modelRobot.invCinFcn(pK,0,modelRobot);
pTarget = [pG,pI,pK,pH];
plot(pTarget(1,:),pTarget(2,:),'o')
%%
%showmotion(modelRobot,[0,3,5,8],[qG qI qK qH])
%% Case 5: Coupled CPGs, finding parameters
q_knownFcn = @(t,Ta)([ones(size(t)),cos(pi*t/Ta),cos(2*pi*t/Ta),cos(3*pi*t/Ta)]);
T = 8;
C = [q_knownFcn(0,T);
     q_knownFcn(3/8*T,T);
     q_knownFcn(5/8*T,T);
     q_knownFcn(T,T)]\[qG,qI,qK,qH]';
t = 0:0.1:18;
q = q_knownFcn(t',T)*C;
tTarget = [0,3/8,5/8,1]*T;
qTarget = [qG,qI,qK,qH];
figure(3)
plot(t,q,'-',tTarget,qTarget,'o'),grid on, hold on
title('Joint Position')
xlabel('time'),ylabel('q_i')
% The time from G to H, T is 8. The signal from 0 to T is mirrored from T to 2T.
% The whole signal is defined from 0 to 2T
%% some non-vectorized code for cpg networks
% w = 4;
% v = repmat([1;2;3]/2/T,3,1);
% dynCPG_NetworkFcn = @(t,th)([2*pi*v(1);...
%                              2*pi*v(2)+w*sin(th(1)-v(2)*th(2)/v(1));
%                              2*pi*v(3)+w*sin(th(1)-v(3)*th(3)/v(1));
%                              2*pi*v(4)+w*sin(th(1)-v(4)*th(4)/v(1));...
%                              2*pi*v(5)+w*sin(th(4)-v(5)*th(5)/v(4));
%                              2*pi*v(6)+w*sin(th(4)-v(6)*th(6)/v(4));
%                              2*pi*v(7)+w*sin(th(4)-v(7)*th(7)/v(4));...
%                              2*pi*v(8)+w*sin(th(7)-v(8)*th(8)/v(7));
%                              2*pi*v(9)+w*sin(th(7)-v(9)*th(9)/v(7))]);
% dynCPG_NetworkFcn = @(t,th)([2*pi*v+[0;4;4].*sin(th(1)-(v/v(1)).*th);...
%                              2*pi*v(4:6)+4*sin(th(4)-v(1)./v.*th(4:6));
%                              ]);
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
