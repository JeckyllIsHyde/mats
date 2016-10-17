clear,clc,clf
%%
syms e1 e2 x1 x2 x3 x4 y1 y2 y3 y4
% e1 = -1:0.01:1;
% e2 = -1:0.01:1;
N1 = 1/2*(1+e1)*1/2*(1+e2);
N2 = 1/2*(1-e1)*1/2*(1+e2);
N3 = 1/2*(1-e1)*1/2*(1-e2);
N4 = 1/2*(1+e1)*1/2*(1-e2);
Xp = [x1;x2;x3;x4];
Yp = [y1;y2;y3;y4];
N = [N1 N2 N3 N4];
dNde1 = diff(N,e1);
dNde2 = diff(N,e2);
X = N*Xp;
Y = N*Yp;
dXde = [diff(X,e1),diff(X,e2);
        diff(Y,e1),diff(Y,e2)];
% dedX = inv(dXde)
%% 
figure(1)
[e1,e2] = meshgrid(-1:0.1:1);
N1 = 1/2*(1+e1)*1/2.*(1+e2);
N2 = 1/2*(1-e1)*1/2.*(1+e2);
N3 = 1/2*(1-e1)*1/2.*(1-e2);
N4 = 1/2*(1+e1)*1/2.*(1-e2);
x = [2;-2;-2;2];
y = [1;1;-1;-1];
N = [N1 N2 N3 N4];
X = N1*x(1) + N2*x(2) + N3*x(3) + N4*x(4);
Y = N1*y(1) + N2*y(2) + N3*y(3) + N4*y(4);
surf(X,Y,zeros(size(X)),'facecolor','b','edgecolor','k'),axis equal,view(2)
%%
figure(2)
[e1,e2] = meshgrid(-1:0.1:1);
N1 = 1/2*(1+e1)*1/2.*(1+e2);
N2 = 1/2*(1-e1)*1/2.*(1+e2);
N3 = 1/2*(1-e1)*1/2.*(1-e2);
N4 = 1/2*(1+e1)*1/2.*(1-e2);
x = [-1;-1;1;1];
y = [2;-2;-2;2];
N = [N1 N2 N3 N4];
X = N1*x(1) + N2*x(2) + N3*x(3) + N4*x(4);
Y = N1*y(1) + N2*y(2) + N3*y(3) + N4*y(4);
surf(X,Y,zeros(size(X)),'facecolor','r','edgecolor','k'),axis equal,view(2)
%%
figure(3)
[e1,e2] = meshgrid(-1:0.1:1);
N1 = 1/2*(1+e1)*1/2.*(1+e2);
N2 = 1/2*(1-e1)*1/2.*(1+e2);
N3 = 1/2*(1-e1)*1/2.*(1-e2);
N4 = 1/2*(1+e1)*1/2.*(1-e2);
%x = [3;-2;-2;2];
%y = [2;1;-1;-1];
x = [3;-2;-2;2];
y = [2;1;-1;-1];
N = [N1 N2 N3 N4];
X = N1*x(1) + N2*x(2) + N3*x(3) + N4*x(4);
Y = N1*y(1) + N2*y(2) + N3*y(3) + N4*y(4);
surf(X,Y,zeros(size(X)),'facecolor','c','edgecolor','k'),axis equal,view(2)
%%
e1 = 1;
e2 = -1;
%%
x = [2;-2;-2;2];
y = [1;1;-1;-1];
dNde1 = [ e2/4 + 1/4, - e2/4 - 1/4, e2/4 - 1/4, 1/4 - e2/4];
dNde2 = [ e1/4 + 1/4, 1/4 - e1/4, e1/4 - 1/4, - e1/4 - 1/4];
dXde = [[dNde1;dNde2]*x [dNde1;dNde2]*y]'
%%
%x = [-1;-1;1;1];
%y = [2;-2;-2;2];
x = [3;-2;-2;2];
y = [2;1;-1;-1];
dNde1 = [ e2/4 + 1/4, - e2/4 - 1/4, e2/4 - 1/4, 1/4 - e2/4];
dNde2 = [ e1/4 + 1/4, 1/4 - e1/4, e1/4 - 1/4, - e1/4 - 1/4];
dxde = [[dNde1;dNde2]*x [dNde1;dNde2]*y]'
%%
ux = [3;-2;-2;2]-[2;-2;-2;2];
uy = [2;1;-1;-1]-[1;1;-1;-1];
dude = [[dNde1;dNde2]*ux [dNde1;dNde2]*uy]'
%%
dxdX = dxde*inv(dXde)
dXdx = dXde*inv(dxde)
F = dxdX
C = F'*F
E = 1/2*(C-eye(2))
dudX = F-eye(2)
acosd(C(1,2)/sqrt(C(1,1)*C(2,2)))
atand(3)