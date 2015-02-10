clear,clc,clf
%% Plane generations
plCar=[1,0;0,0.5]*[0,1,1,0,0;0,0,1,1,0]+repmat([-0.5;0],1,5);
plBar=[0,1;0,0];
plBall=0.1*[cos(2*pi*([0:0.01:1,0]));sin(2*pi*([0:0.01:1,0]))];
params.M = 1;
params.m = 0.1;
params.l = 1;
%% Drawing Scene
figure(1)
hCar=hgtransform; line(plCar(1,:),plCar(2,:),'parent',hCar)
hBar=hgtransform('parent',hCar); line(plBar(1,:),plBar(2,:),'parent',hBar)
set(hBar,'matrix',makehgtform('translate',[0,0.5,0])*makehgtform('zrotate',pi/2))
hBall=hgtransform('parent',hBar); line(plBall(1,:),plBall(2,:),'parent',hBall)
set(hBall,'matrix',makehgtform('translate',[1,0,0]))
hold on, grid on
axis([-3,3,-0.2,2])
axis equal
%% Degrees of freedom
px = 0.1;
th = 45*pi/180;
set(hCar,'matrix',makehgtform('translate',[px,0,0]))
set(hBar,'matrix',makehgtform('translate',[0,0.5,0])*makehgtform('zrotate',pi/2+th))
%% Modelo dinamico
figure(1)
h=0.001;
nmax = 3000;
xrk = [0.5;0;-14*pi/180;0.0;];
xr = [];
K = [-163.0989  -73.3945  369.8899   97.3945];
for n=0:nmax
    trk = n*h;
%    F = @(t)([carPendulumFLC(xrk(3),xrk(4));0]); %
    F = @(t)([K(1)*1-K*xrk;0]); %
%    xrk = methodRK(@(x)(dynCarPendulum(x,params)),xrk,h);
    xrk = methodRKandF(@(t,x,f,pars)(dynCarPendulum(t,x,f,pars)),F,params,trk,xrk,h);
    xr = [xr xrk];
    px = xrk(1);
    th = xrk(3);th*180/pi
    set(hCar,'matrix',makehgtform('translate',[px,0,0]))
    set(hBar,'matrix',makehgtform('translate',[0,0.5,0])*makehgtform('zrotate',pi/2+th))
    drawnow
end
%%
figure(2)
subplot(4,1,1),plot(xr(1,:),'r'),grid on, hold on,ylabel('x')
subplot(4,1,2),plot(xr(2,:),'r'),grid on, hold on,ylabel('v')
subplot(4,1,3),plot(xr(3,:),'r'),grid on, hold on,ylabel('th')
subplot(4,1,4),plot(xr(4,:),'r'),grid on, hold on,ylabel('w')