clear,clc,clf
%%
plCar=[1,0;0,0.5]*[0,1,1,0,0;0,0,1,1,0];
plBar=[0,1;0,0];
plBall=0.1*[cos(2*pi*([0:0.01:1,0]));sin(2*pi*([0:0.01:1,0]))];
%%
figure(1)
hCar=hgtransform; line(plCar(1,:),plCar(2,:),'parent',hCar)
hBar=hgtransform('parent',hCar); line(plBar(1,:),plBar(2,:),'parent',hBar)
hBall=hgtransform('parent',hBar); line(plBall(1,:),plBall(2,:),'parent',hBall)
hold on, grid on
axis([])
axis equal