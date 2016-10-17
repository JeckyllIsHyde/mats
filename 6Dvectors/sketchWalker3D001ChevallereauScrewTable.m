clear,clc,close all
%% create model
g = [0;0;-9.81];
walker = createChevallereauWalker02(g)
walker = floatbase(walker)
%%
% showmotion(walker)
%% dinamic model
b = 2.80;
NB = 20; ost = 5;% 15 or 20 for foating base
gL = -0.82;
%f_extFcn = @(x)(repmat({zeros(6,1)},1,NB));
tau = zeros(NB,1);
f_extFcn = @(x)(walker.viscosuousFrictionFcn(walker,x,b));
f_extFcn = @(x)(walker.limitJointForcesFcn(walker,x,f_extFcn));
%f_extFcn = @(x)(walker.musclesForcesFcn(walker,x,f_extFcn));
f_extFcn = @(x)(walker.footContactFcn(walker,x,gL,f_extFcn));
dynModelRobot = @(t,x)([x(NB+1:2*NB);FDab(walker,x(1:NB),x(NB+1:2*NB),tau,f_extFcn(x))]);
%% simulation
q = zeros(NB,1); q([3,5]+ost) = [-30;45]*pi/180; q([12,13]+ost) = [80,40]*pi/180;
qd = zeros(NB,1); qd(3+ost) = 0;
options = odeset('RelTol',1e-4);
tic
[t_data,q_data] = ode15s(dynModelRobot,[0,4],[q;qd]);%,options);
toc
%% post-processing
showmotion(walker,t_data,q_data(:,1:NB)')
%%
figure(3)
subplot(211),plot(t_data,q_data(:,1:NB)*180/pi,'--'),hold on, grid on
subplot(212),plot(t_data,q_data(:,NB+1:2*NB)*180/pi,'--'),hold on, grid on
%%
figure(4)
subplot(211),plot(t_data,q_data(:,[1,4,5,6]+ost)'*180/pi,'-'),hold on,grid on
subplot(212),plot(t_data,q_data(:,[1,4,5,6]+NB+ost)'*180/pi,'-'),hold on,grid on
%% muscles visualization
figure(5)
ax = axes();hold on,grid on
handles = drawModel(walker,ax);
q = zeros(walker.NB,1);
hR1 = line([0;0],[0,0],'color','k','linewidth',4.0);
hR2 = line([0;0],[0,0],'color','k','linewidth',4.0);
hR3 = line([0;0],[0,0],'color','k','linewidth',4.0);
positionModel(walker,q,handles);
axis equal
axis([-0.5,0.5,-0.5,0.5,-2,1])
view(3)
%%
tdat = 0:0.01:5;%qdat = zeros(walker.NB,length(tdat));
qdat = interp1(t_data,q_data,tdat);
%%
d([1,4,5,8,11,12,15],1) = [0.185;0.392;0.392;0.190;0.392;0.392;0.185];
ltorso = 0.3;Lp = 0.207;l1 = 0.05925;
for i = 1:length(tdat)
    [~,Xup] = positionModel(walker,qdat(i,:)',handles);
    p1 = Xpt(inv(Xup{4+ost}),[d(4)/2;0;0;]);
    p2 = Xpt(inv(Xup{5+ost}),[d(5)/2;0;0;]);
    set(hR1,'xdata',[p1(1),p2(1)],'ydata',[p1(2),p2(2)],'zdata',[p1(3),p2(3)])
    p1 = Xpt(inv(Xup{1+ost}),[ltorso-0.1;-d(8)/2;0.05;]);
    p2 = Xpt(inv(Xup{4+ost}),[d(4)/2;0;0;]);
    set(hR2,'xdata',[p1(1),p2(1)],'ydata',[p1(2),p2(2)],'zdata',[p1(3),p2(3)])
    p1 = Xpt(inv(Xup{5+ost}),[d(5)/2;0;0;]);
    p2 = Xpt(inv(Xup{8+ost}),[l1;0;d(1)/2;]);
    set(hR3,'xdata',[p1(1),p2(1)],'ydata',[p1(2),p2(2)],'zdata',[p1(3),p2(3)])
    drawnow
end