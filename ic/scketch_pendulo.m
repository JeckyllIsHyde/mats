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
axis([-1,1,-0.2,2])
axis equal
%% Degrees of freedom
px = 0.1;
th = 45*pi/180;
set(hCar,'matrix',makehgtform('translate',[px,0,0]))
set(hBar,'matrix',makehgtform('translate',[0,0.5,0])*makehgtform('zrotate',pi/2+th))
%% Modelo dinamico
figure(1)
h=0.001;
nmax = 10000;
% F = @(t)([0;0]);
xrk = [0.1;0;45*pi/180;0.0;];
xr = [];
for n=0:nmax
    trk = n*h;
%     F = @(t)([u(1)-b*xrk(2);u(2)-b*xrk(4)]);
    xrk = methodRK(@(x)(dynCarPendulum(x,params)),xrk,h);
%     xrk = methodRKandF(@(t,x,f,pars)(dynRobot2R(t,x,f,pars)),F,params,trk,xrk,h);
    xr = [xr xrk];
    px = xrk(1);
    th = xrk(3);
    set(hCar,'matrix',makehgtform('translate',[px,0,0]))
    set(hBar,'matrix',makehgtform('translate',[0,0.5,0])*makehgtform('zrotate',pi/2+th))
%     pause
    drawnow
end
