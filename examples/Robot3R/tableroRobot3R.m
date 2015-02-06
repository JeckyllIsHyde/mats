clear,clc,clf
%% crear robot
L1 = 0.5;L2 = 0.23;L3 = 0.27;m1 = 0.5;m2 = 0.23;m3 = 0.27;
params.L1 = L1;
params.L2 = L2;
params.L3 = L3;
params.m1 = m1;
params.m2 = m2;
params.m3 = m3;
figure(1)
hRobot = crearRobot3R(L1,L2,L3,m1,m2,m3);
hold on, grid on
axis equal
axis([-0.5,1,-0.5,1])
%% mover robot
th1 = 100*pi/180;
th2 = 150*pi/180;
th3 = 0;
pos = [0;0;0];
moverRobot3R(hRobot,th1,th2,th3,pos);
%% 
figure(1)
h=0.001;
nmax = 500;
F = @(t)([0;0;0]);
xrk = [100*pi/180;-2.0;150*pi/180;0;0;0];
b = 4.0;
xr = [];
for n=0:nmax
    trk = n*h;
%     F = @(t)([u(1)-b*xrk(2);u(2)-b*xrk(4)]);
    xrk = methodRK(@(x)(dynRobot3R(x,params)),xrk,h);
%     xrk = methodRKandF(@(t,x,f,pars)(dynRobot2R(t,x,f,pars)),F,params,trk,xrk,h);
    xr = [xr xrk];
    moverRobot3R(hRobot,xrk(1),xrk(3),xrk(5),pos);
%     pause
    drawnow
end
