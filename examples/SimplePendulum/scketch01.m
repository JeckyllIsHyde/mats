clear,clc,clf
%% Plane generations
plBar=[0,1;0,0];
plBall=0.1*[cos(2*pi*([0:0.01:1,0]));sin(2*pi*([0:0.01:1,0]))];
params.m = 0.1;
params.k = 0.1;
params.l = 1;
%% Drawing Scene
figure(1)
hBar=hgtransform; line(plBar(1,:),plBar(2,:),'parent',hBar)
set(hBar,'matrix',makehgtform('translate',[0,0,0])*makehgtform('zrotate',-pi/2))
hBall=hgtransform('parent',hBar); line(plBall(1,:),plBall(2,:),'parent',hBall)
set(hBall,'matrix',makehgtform('translate',[1,0,0]))
hold on, grid on
axis([-3,3,-0.2,2])
axis equal
%% Degrees of freedom
th = 45*pi/180;
set(hBar,'matrix',makehgtform('zrotate',pi/2+th))
%% Modelo dinamico
figure(1)
h=0.001;
nmax = 10000;
xrk = [-2*180*pi/180;10;];
xr = [];
for n=0:nmax
    trk = n*h;
    F = @(t)(0);
%    xrk = methodRK(@(x)(dynSimplePendulum(x,params)),xrk,h);
    xrk = methodRKandF(@(t,x,f,pars)(dynSimplePendulum(t,x,f,pars)),F,params,trk,xrk,h);
    xr = [xr xrk];
    th = xrk(1);
    set(hBar,'matrix',makehgtform('zrotate',-pi/2+th))
    drawnow
end
%%
figure(2)
subplot(2,1,1),plot(xr(1,:),'g'),grid on, hold on,ylabel('th')
subplot(2,1,2),plot(xr(2,:),'g'),grid on, hold on,ylabel('w')
%% diagrama de vectores de campo
k = params.k;
m = params.m;
l = params.l;

g = 9.81; tau = 0;

% modelo dinamico
[x1,x2] = meshgrid(-2*pi:0.5:2*pi,-4*pi:0.5:4*pi);
x1p = x2;
x2p = -g*sin(x1)/l-k/m*x2+tau/(m*l^2);

figure(5)
quiver(x1,x2,x1p,x2p),grid on, hold on
%%
figure(5)
plot(xr(1,:),xr(2,:),'r')
