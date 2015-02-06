function [T01,T12,T23] = moverRobot3R(hRobot,th1,th2,th3,pos)

T23 = makehgtform('translate',[hRobot.L2;0;0])*makehgtform('zrotate',th3);
set(hRobot.hL3,'matrix',T23);
T12 = makehgtform('translate',[hRobot.L1;0;0])*makehgtform('zrotate',th2);
set(hRobot.hL2,'matrix',T12);
T01 = makehgtform('translate',pos)*makehgtform('zrotate',th1);
set(hRobot.hL1,'matrix',T01);
