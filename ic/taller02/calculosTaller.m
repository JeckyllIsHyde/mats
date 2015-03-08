clear,clc,clf
%% Punto 1
x = -6:0.1:8;
y = 1./(1+(x-1).^2);
plot(x,y,'linewidth',2), hold on, grid on
plot(x(y>=0.5),y(y>=0.5),'bo-','linewidth',2), hold on, grid on
plot([-6,8],[0.5,0.5],'r--')
title('Funcion de pertenencia \mu_C(x)')
ylabel('\mu_C'),xlabel('x')
legend('\mu_C','A_{0.5}')
%% Punto 2
xA = [0,0.2,0.4,0.6,1;0,0,1,0,0];
xB = [0,0.3,0.5,0.7,1;0,0,1,0,0];
xC = [0,0.3,0.45,0.6,1;0,0,0.75,0,0];
subplot(121)
plot(xA(1,:),xA(2,:),'b-^','linewidth',2), hold on, grid on
plot(xB(1,:),xB(2,:),'g-*','linewidth',2)
plot(xC(1,:),xC(2,:),'r-*','linewidth',2)
ylabel('\mu(x)'),xlabel('x')
legend('\mu_{A}','\mu_{B}','\mu_{C}=\mu_{A}*\mu_{B}')
title('Caso Convexo')
xA = [0,0.2,0.4,0.5,1;0,0,1,0.5,1];
xB = [0,0.3,0.5,0.7,1;0,0,1,0,0];
xC = [0,0.3,0.45,0.5,0.5833,0.7,1;0,0,0.75,0.5,0.5833,0,0];
subplot(122)
plot(xA(1,:),xA(2,:),'b-^','linewidth',2), hold on, grid on
plot(xB(1,:),xB(2,:),'g-*','linewidth',2)
plot(xC(1,:),xC(2,:),'r-*','linewidth',2)
plot([0,1],0.55*[1,1],'k--')
ylabel('\mu(x)'),xlabel('x')
legend('\mu_{A}','\mu_{B}','\mu_{C}=\mu_{A}*\mu_{B}','\alpha_{nc}')
title('Caso no Convexo')
%% Punto 3
X = [0.4,0.6];
Y = [0.4,0.6];
Z = [0.2,0.3,0.6,0.8];
stem3(reshape([X;X],1,[]),[Y Y],Z,'linewidth',2),hold on,grid on
stem3(X,[0,0],Z([2 4]),'r','linewidth',2),hold on,grid on
stem3([0,0],Y,Z([3,4]),'g','linewidth',2),hold on,grid on
axis([0,1,0,1,0,1])
zlabel('\mu_{A}'),ylabel('Y'),xlabel('X'),
title('Proyecciones')
%% Punto 4
X = [0.4,0.6];
Z = [0.3,0.5];
stem3(X,[0,0],Z,'b','linewidth',2),hold on,grid on
stem3(X(1)*ones(1,10),(0.1:0.1:1),Z(1)*ones(1,10),'g','linewidth',2),hold on,grid on
stem3(X(2)*ones(1,10),(0.1:0.1:1),Z(2)*ones(1,10),'g','linewidth',2),hold on,grid on
axis([0,1,0,1,0,1])
zlabel('\mu_{A}'),ylabel('Y'),xlabel('X'),
title('Proyecciones')
%% Punto 6
X = [0 0.1 0.2 0.3,0.5,0.7 0.8 0.9 1.0];
Y = [0 0.1 0.2 0.3,0.5,0.7 0.8 0.9 1.0];
Z = zeros(9,9);
Z(4:6,4:6) = [0.7,0.3,0.1;...
              0.4,0.8,0.2;...
              0.1,0.2,0.9];
A = zeros(1,9);
A(4:6) = [0.1,1,0.4];
figure(1)
stem3(repmat(X,9,1),repmat(Y',1,9),Z','b','linewidth',2),hold on,grid on
surf(repmat(X,9,1),repmat(Y',1,9),Z','edgecolor','none','facecolor','interp')
axis([0,1,0,1,0,1])
% A
figure(2)
stem3(repmat(X,9,1),repmat(Y',1,9),repmat(A,9,1),'k','linewidth',2),hold on,grid on
surf(repmat(X,9,1),repmat(Y',1,9),repmat(A,9,1),'edgecolor','none','facecolor','interp')
stem3(X,zeros(1,9),A,'g','linewidth',2)
plot3(X,zeros(1,9),A,'g')
axis([0,1,0,1,0,1])
% graphical intersection begin
figure(5)
surf(repmat(X,9,1),repmat(Y',1,9),Z','edgecolor','none','facecolor','b'),hold on,grid on
surf(repmat(X,9,1),repmat(Y',1,9),repmat(A,9,1),'edgecolor','none','facecolor','r')
axis([0,1,0,1,0,1]), light('Position',[0 0 1],'Style','infinite')
% intersection or MIN op.
RnA = min(repmat(X,9,1),Z');
figure(3)
stem3(repmat(X,9,1),repmat(Y',1,9),RnA,'k','linewidth',2),hold on,grid on
surf(repmat(X,9,1),repmat(Y',1,9),RnA,'edgecolor','none','facecolor','interp')
axis([0,1,0,1,0,1])
% graphical intersection end
figure(6)
surf(repmat(X,9,1),repmat(Y',1,9),RnA,'edgecolor','none','facecolor','b')
axis([0,1,0,1,0,1]), light('Position',[0 0 1],'Style','infinite')
% MAX op.
B = max(RnA,[],2);
figure(4)
stem3(repmat(X,9,1),repmat(Y',1,9),repmat(B,1,9),'k','linewidth',2),hold on,grid on
surf(repmat(X,9,1),repmat(Y',1,9),repmat(B,1,9),'edgecolor','none','facecolor','interp')
stem3(zeros(1,9),Y,B,'g','linewidth',2)
plot3(zeros(1,9),Y,B,'g')
axis([0,1,0,1,0,1])
%
Z = [0.7,0.3,0.1;...
     0.4,0.8,0.2;...
     0.1,0.2,0.9];
A = [0.1,1,0.4]';
min(repmat(A,1,3),Z)
