clear,clc,clf
%% Plane generations
plCar=[1,0;0,0.5]*[0,1,1,0,0;0,0,1,1,0]+repmat([-0.5;0],1,5);
params.M = 100;
%% Drawing Scene
figure(1)
hCar=hgtransform; line(plCar(1,:),plCar(2,:),'parent',hCar)
hold on, grid on
axis equal
axis([-20,20,-0.2,1])
%% Degrees of freedom
px = 0.1;
set(hCar,'matrix',makehgtform('translate',[px,0,0]))
%% Modelo dinamico
figure(1)
h=0.01;
nmax = 5000;
xrk = -1*[2;5;];
xr = [];
for n=0:nmax
    trk = n*h;
    F = @(t)(100*blockFLC(xrk(1),xrk(2)));
%    xrk = methodRK(@(x)(dynBlock(x,params)),xrk,h);
    xrk = methodRKandF(@(t,x,f,pars)(dynBlock(t,x,f,pars)),F,params,trk,xrk,h);
    xr = [xr xrk];
    px = xrk(1);
    set(hCar,'matrix',makehgtform('translate',[px,0,0]))
    drawnow
end
%%
figure(2)
subplot(2,1,1),plot(xr(1,:),'r--'),grid on, hold on
subplot(2,1,2),plot(xr(2,:),'r--'),grid on, hold on
%%
z = [];
for x = -100:100
    for v = -100:100
        z = [z blockFLC(x,v)];
    end
end
%%
figure(3)
surf(reshape(z,201,[]),'edgecolor','none')
hold on, grid on
xlabel('x'),ylabel('v'),zlabel('z')
light
axis tight
