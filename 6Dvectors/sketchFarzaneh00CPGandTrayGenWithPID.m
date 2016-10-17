clear,clc
%% CGPs for industrial robots' trajectory generation (Properties of mod-CPGs)
% [1] Y. Farzaneh and a. Akbarzadeh, “A bio-inspired approach for online 
%     trajectory generation of industrial robots,” Adapt. Behav., vol. 20, 
%     no. 3, pp. 191–208, 2012.
%% Properties of modified CPGs
% perturbacion en la frecuencia intrinseca v
% (1) probar con w = 4, una red acoplada y produce sincronizacion
% (2) probar con w = 0, una red acoplada y no hay sincronizacion
w = 4;
v = [10;10]/2/pi;
W = [0 1;1 0];
R = [1.8;1.8];
nCPG = 2;a = 10;
stepFcn = @(t,a)(max(0,sign(t-a)));
dh = 0.25;
phiFcn = @(t)([-1*(stepFcn(t,2-dh/2)-stepFcn(t,2+dh/2))/dh;0]);
dynCPG_NetworkFcn = @(t,th)([2*pi*v+...
    w*sum(W.*sin(repmat(th(1:nCPG),1,nCPG)'-...
                 (repmat(v,1,nCPG)./repmat(v,1,nCPG)')'.*repmat(th(1:nCPG),1,nCPG)-...
                 0*repmat(phiFcn(t),1,nCPG)),2)+1*phiFcn(t);...
                 th(2*nCPG+1:3*nCPG);...
                 a*(a/4*(R-th(nCPG+1:2*nCPG))-th(2*nCPG+1:3*nCPG))]);
%%
q = zeros(nCPG,1);r = [1.8;1.8;0;0];
options = odeset('RelTol',1e-8,'AbsTol',1e-6);
tic
[t_data,q_data] = ode45(dynCPG_NetworkFcn,[0:0.001:4],[q;r],options);
toc
plot(t_data,q_data(:,[3,4]).*cos(q_data(:,[1,2])),'-'),hold on, grid on
%%
% Preturbaciones de R, phi y v
w = 4;
v = [10;10]/2/pi;
W = [0 1;1 0];
R = [1.8;1.8];
nCPG = 2;a = 100;
stepFcn = @(t,a)(max(0,sign(t-a)));
Rfcn = @(t)(1.8*stepFcn(t,0)+(0.9-1.8)*stepFcn(t,2)...
          +(1.8-0.9)*stepFcn(t,3)+(0.9-1.8)*stepFcn(t,6)...
          +(1.8-0.9)*stepFcn(t,8));
phiFcn = @(t)(pi/2*stepFcn(t,3)...
             -pi/2*stepFcn(t,5)+pi/2*stepFcn(t,6)...
             -pi/2*stepFcn(t,8));
q0Fcn = @(t)(-0.9*stepFcn(t,2)+0.9*stepFcn(t,3)...
             -0.9*stepFcn(t,6)+0.9*stepFcn(t,8));
dynCPG_NetworkFcn = @(t,th)([2*pi*v+...
    w*sum(W.*sin(repmat(th(1:nCPG),1,nCPG)'-...
                 (repmat(v,1,nCPG)./repmat(v,1,nCPG)')'.*repmat(th(1:nCPG),1,nCPG)-...
                 repmat([phiFcn(t);-phiFcn(t)],1,nCPG)),2);...
                 th(2*nCPG+1:3*nCPG);...
                 a*(a/4*(Rfcn(t)*[1;1]-th(nCPG+1:2*nCPG))-th(2*nCPG+1:3*nCPG))]);
%%
q = zeros(nCPG,1);r = [1.8;1.8;0;0];
options = odeset('RelTol',1e-8,'AbsTol',1e-6);
tic
[t_data,q_data] = ode45(dynCPG_NetworkFcn,[0:0.001:10],[q;r],options);
toc
plot(t_data,-q_data(:,[3,4]).*cos(q_data(:,[1,2]))+repmat(q0Fcn(t_data),1,2),'-'),hold on, grid on
