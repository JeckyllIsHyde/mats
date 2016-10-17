clear,clc,clf
%% Direct Kinematic,Jacobian and Velocities
%% 
L1 = 0.5;
L2 = 0.3;
pl1 = [0,L1;0,0];
pl2 = [0,L2;0,0];
hL1 = hgtransform;
hL2 = hgtransform;
set(line(pl2(1,:),pl2(2,:),'color','b',...
    'linewidth',2.0,'marker','o'),'parent',hL2);
set([line(pl1(1,:),pl1(2,:),'color','g',...
    'linewidth',2.0,'marker','o'),hL2],'parent',hL1);
hold on, grid on
axis equal
axis(1*[-1,1,-1,1]);
%% the old way direct kinematics
th = pi/180*[30 45];
r1 = [0;0;0];
TJ1 = [rz(th(1)) [0;0;0];0 0 0 1];
TT1 = [eye(3) -r1;0 0 0 1];
set(hL1,'Matrix',inv(TJ1*TT1))
r2 = [L1;0;0];
TJ2 = [rz(th(2)) [0;0;0];0 0 0 1];
TT2 = [eye(3) -r2;0 0 0 1];
set(hL2,'Matrix',inv(TJ2*TT2))
%% the screw featherstone's way direct kinematics
% pluho X => T or T => X
% plux X => E,r or E,r => X
th = pi/180*[30 45];
XJ1 = rotz(th(1));
XT1 = xlt(r1);
X1 = XJ1*XT1;
set(hL1,'Matrix',inv(pluho(X1)))
XJ2 = rotz(th(2));
XT2 = xlt(r2);
X2 = XJ2*XT2;
set(hL2,'Matrix',inv(pluho(X2)))
%% velocity jacobian
s1 = [0;0;1;0;0;0]
s2 = [0;0;1;0;0;0]
J = [X1\s1 (X2*X1)\s2]
%% how to know end-effector point or other point
pH = [L2;0;0];
% long way
pT = inv(pluho(X2*X1))*[pH;1]; pT = pT(1:3)
% short way
Xpt(inv(X2*X1),pH)
%% specific point jacobian
p = [-0.3;0.5;0];
Jp = xlt(p)*J
% 6D spatial vector and point vector to 3D vector
% vp = Vpt( v, p )
Jp = Vpt(J,repmat(p,1,2))
% several linear 3D velocities on points
vs = Vpt(J(:,2),[p,pT])
%% v = XtoV(X)
vs = [XtoV(XJ1) XtoV(XJ2) XtoV(XT2)]
