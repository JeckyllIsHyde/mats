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
RnA = min(repmat(A,9,1),Z');
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
%% max-min
Z = [0.7,0.3,0.1;...
     0.4,0.8,0.2;...
     0.1,0.2,0.9];
A = [0.1,1,0.4]';
min(repmat(A,1,3),Z)
max(min(repmat(A,1,3),Z),[],1)
%% max-prod
Z = [0.7,0.3,0.1;...
     0.4,0.8,0.2;...
     0.1,0.2,0.9];
A = [0.1,1,0.4]';
repmat(A,1,3).*Z
max(repmat(A,1,3).*Z,[],1)
%% Punto 7
% n = 5
% A = [0,0.1,0.4,0.8,1]'
% B = [0,0.6,1,0.6,0]
% Rmin = min(repmat(A,1,n),repmat(B,n,1))
% Rlzw = min(1,1-repmat(A,1,n)+repmat(B,n,1))
% A_ = [0,0.2,0.8,1,0.1]'
% B_min = max(min(repmat(A_,1,n),Rmin),[],1)
% B_lzw = max(min(repmat(A_,1,n),Rlzw),[],1)
n = 3
A = [0.1,0.4,1.0]'
B = [0.0,1.0,0.2]
Rmin = min(repmat(A,1,n),repmat(B,n,1))
Rlzw = min(1,1-repmat(A,1,n)+repmat(B,n,1))
A_ = [0.3,1.0,0.3]'
B_min = max(min(repmat(A_,1,n),Rmin),[],1)
B_lzw = max(max(0,repmat(A_,1,n)+Rlzw-1),[],1)
figure(1)
%[X,Y] = meshgrid([0.3,0.5,0.7]);
surf(Rmin,'facecolor','g'), colormap('gray'),hold on,grid on
%axis([0,1,0,1,0,1])
%figure(2)
surf(Rlzw,'facecolor','r'), colormap('jet'),hold on,grid on
stem3(Rmin,'linewidth',2)
stem3(Rlzw,'linewidth',2)
light
xlabel('X'),ylabel('Y'),zlabel('Z')
legend('t-norm: Min','t-norm: Lukasiewicz')
title('Reglas con: Min vs Lukasiewicz')
%axis([0,1,0,1,0,1])
%% Punto 8
% s = [B,M,A]; % Bajo, Medio, Alto: s \in [0,5]M
% d = [P,Mn,G]; % Pequena, Mediana, Grande: d \in [0,10]Km 
% c = [I,T,E]; % Inaceptable, Tolerable, Excelente: c \in [0,100]%
B = [-0.1,-0.1,0.7,1.3];
M = [0.7,1.3,2.4,3.0];
A = [2.4,3.0,5.1,5.1];
P = [-0.1,-0.1,0.7,1];
Mn= [0.7,1,3,5];
G = [3,5,10.1,10.1];
I = [-0.1,-0.1,25,40];
T = [25,40,60,75];
E = [60,75,100.1,100.1];
mufun = @(x,p)(max(0,min((x-p(1))/(p(2)-p(1)),min(1,(p(4)-x)/(p(4)-p(3))))));
s = 0:0.1:5;
figure(1)
muB = mufun(s,B);muM = mufun(s,M);muA = mufun(s,A);
plot(s,muB,s,muM,s,muA),hold on,grid on
d = 0:0.1:10;
figure(2)
muP = mufun(d,P);muMn = mufun(d,Mn);muG = mufun(d,G);
plot(d,muP,d,muMn,d,muG),hold on,grid on
c = 0:1:100;
figure(3)
muI = mufun(c,I);muT = mufun(c,T);muE = mufun(c,E);
plot(c,muI,c,muT,c,muE),hold on,grid on
% 
%            Salario S
%            B    M    A
%          ---------------
%  D  P  ||  A |  E |  E |
%  i  Mn ||  I |  A |  E |
%  s  G  ||  I |  A |  E |
%          ---------------
%  width for member function
%
s = 0.1;d = 0.8;
aggrS = max([mufun(s,P),mufun(s,M),mufun(s,G)])
aggrD = max([mufun(d,B),mufun(d,Mn),mufun(d,A)])
intSD = min([aggrS,aggrD])
%%
a = readfis('Punto8RG');
gensurf(a)
