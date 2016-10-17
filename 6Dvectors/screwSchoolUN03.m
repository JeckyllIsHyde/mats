clear,clc,close all
%% model
% model.Xtree{i}    X :==>
% model.jtype{i} char :==> [Xj,S] = jcalc( model.jtype{i}, q )
% model.parent(i)
% 
% model.I{i}        I :==> I = mcI(mass_i, CoM_i, Icm_i)
q = [0;0];
L = [1;1];
m = [1;1];

modelRobot.NB = 2;
modelRobot.Xtree = {xlt([0;0;0]),xlt([L(1);0;0])};
modelRobot.jtype = {'Ry','Ry'};
modelRobot.parent = [0,1];
modelRobot.I = {mcI(m(1),L(1)*[0.5 0 0],m(1)*L(1)^2*diag([0.0025,1.015/12,1.015/12])),...
                mcI(m(2),L(2)*[0.5 0 0],m(2)*L(2)^2*diag([0.0025,1.015/12,1.015/12]))};
modelRobot.gravity = [0;0;-10]
%% static analysis with gravity
qd = [0;0];
qdd = [0;0];
[tau,f] = ID(modelRobot,q,qd,qdd);
tau
[f{1},f{2}]
%% external forces
p = [L(1);0;0];
fp = [0;0;-1];
fex{1} = Fpt( fp, p ); % external force on body 1
p = [sum(L);0;0];
fp = [0;0;-1];
fex{2} = [];
fex{2} = Fpt( fp, p );
fex{2} = fex{2} + Fpt( fp, p ); % external force on body 2
[tau,f] = ID(modelRobot,q,qd,qdd,fex);
tau
[f{1},f{2} fex{1},fex{2}]
%% 
