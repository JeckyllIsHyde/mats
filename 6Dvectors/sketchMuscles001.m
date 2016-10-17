clear,clc,%close all
%% Forward Dynamics
%% making a model structure for post simulation
% model.Xtree{i}    X :==>
% model.jtype{i} char :==> [Xj,S] = jcalc( model.jtype{i}, q )
% model.parent(i)
% 
% model.I{i}        I :==> I = mcI(mass_i, CoM_i, Icm_i)
q = [0;0];
L = 0.5*[1;1];
m = [1;1];

modelRobot.NB = 2;
modelRobot.Xtree = {xlt([0;0;0]),xlt([L(1);0;0])};
modelRobot.jtype = {'Ry','Ry'};
modelRobot.parent = [0,1];
modelRobot.I = {mcI(m(1),L(1)*[0.5 0 0],m(1)*L(1)^2*diag([0.0025,1.015/12,1.015/12])),...
                mcI(m(2),L(2)*[0.5 0 0],m(2)*L(2)^2*diag([0.0025,1.015/12,1.015/12]))};
%% appereance ( see gfxExample.m from the library of Featherstone )
% model.appearance.base
% model.appearance.body{i} for each i in 1..NB

modelRobot.appearance.base = ...
    { 'sphere',[0.0,0.0,0.0],0.05, ...
    };

modelRobot.appearance.body{1} = ...
    { 'colour', [0.0,1.0,0.0],...
      'box',[0.0,-0.025,-0.05;L(1),0.025,0.05;], ...
    };

modelRobot.appearance.body{2} = ...
    { 'colour', [0.0,0.0,1.0],...
      'box',[0.0,-0.025,-0.05;L(2),0.025,0.05;], ...
    };
showmotion(modelRobot)
%% gravity
% modelRobot.gravity = [0;0;0];
q = [0*45*pi/180;90*pi/180];qd = [0;0];d = 0;
x = [q;qd;d];
pk = {[L(1)/2;0;0],[L(2)/2;0;0]};
% k = [k_muscle,k_tendon]; b = [b_muscle,b_joint];
k = [1000,100]/2; b = [1.0e-1,1.0e-1]; Ln = 0.1;
% fkb = springLoadFcn(modelRobot,pk,[q;qd],k,b,Ln);
xp = dynRobotArmWithHillMuscleFcn(modelRobot,x,pk,k,b,Ln);
%% Visco-Elastic-friction with Composite Rigid Body
dynModelRobot = @(t,x)(dynRobotArmWithHillMuscleFcn(modelRobot,x,pk,k,b,Ln));
%% t_data, q_data = b(2)
options = odeset;%('RelTol',1e-4);
tic
[t_data,q_data] = ode15s(dynModelRobot,[0,20.0],[q;qd;d]);%,options);
toc
%% post-processing
showmotion(modelRobot,t_data,q_data(:,[1 2])')
%%
figure(3)
plot(t_data,q_data(:,[1 2]),'*'), hold on,grid on