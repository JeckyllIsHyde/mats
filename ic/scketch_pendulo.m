clear,clc,clf
%% Plane generations
plCar=[1,0;0,0.5]*[0,1,1,0,0;0,0,1,1,0]+repmat([-0.5;0],1,5);
plBar=[0,1;0,0];
plBall=0.1*[cos(2*pi*([0:0.01:1,0]));sin(2*pi*([0:0.01:1,0]))];
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
% D(q)*qpp+V(qp,q)+G(q)=u(t)
D = [M+m,-l*m*cos(th);-l*m*cos(th),m*l^2];
V = [m*l*w^2*sin(th);0];
G = [0;m*l*g*sin(th)];
qpp = D\(V+G-u)
