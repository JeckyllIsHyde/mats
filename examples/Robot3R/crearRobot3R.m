function hRobot = crearRobot3R(L1,L2,L3,m1,m2,m3)

hRobot.L1 = L1;
hRobot.L2 = L2;
hRobot.L3 = L3;
hRobot.m1 = m1;
hRobot.m2 = m2;
hRobot.m3 = m3;

hL1 = line([0,L1],[0,0],'color','r');
hL2 = line([0,L2],[0,0],'color','g');
hL3 = line([0,L3],[0,0],'color','b');
hRobot.hL1 = hgtransform;
hRobot.hL2 = hgtransform;
hRobot.hL3 = hgtransform;

set(hL3,'parent',hRobot.hL3)
set([hL2,hRobot.hL3],'parent',hRobot.hL2)
set([hL1,hRobot.hL2],'parent',hRobot.hL1)

th1 = 0; th2 = 0; th3 = 0; pos = [0;0;0];
moverRobot3R(hRobot,th1,th2,th3,pos);
