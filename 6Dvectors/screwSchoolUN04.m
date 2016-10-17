clear,clc,close all
%% Forward Dynamics
%% making a model structure for post simulation
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
%% appereance ( see gfxExample.m from the library of Featherstone )
% model.appearance.base
% model.appearance.body{i} for each i in 1..NB

modelRobot.appearance.base = ...
    { 'sphere',[0.0,0.0,0.0],0.05, ...
    };

modelRobot.appearance.body{1} = ...
    { 'colour', [0.0,1.0,0.0],...
      'box',[0.0,0.0,0.0;1.0,0.05,0.1;], ...
    };

modelRobot.appearance.body{2} = ...
    { 'colour', [0.0,0.0,1.0],...
      'box',[0.0,0.0,0.0;1.0,0.05,0.1;], ...
    };
showmotion(modelRobot)
%% gravity
% modelRobot.gravity = [0;0;0]
q = [0;90*pi/180];
qd = [0;0];
tau = [0;0];
pk = {[L(1)/2;0;0],[L(2)/2;0;0]};
fkb = springLoadFcn(modelRobot,pk,[q;qd],[]);
%% Visco-friction
% b = 4.0;
% f_extFcn = @(t,u)({[0;-b*u(3);0;0;0;0],...
%          [0;-b*u(4);0;0;0;0]});
% qdd = FDab(modelRobot,q,qd,tau,f_ext)
% dynModelRobot = @(t,x)([x(3:4);FDab(modelRobot,x(1:2),x(3:4),tau,f_extFcn(t,x))])
%% Visco-Elastic-friction with Composite Rigid Body
dynModelRobot = @(t,x)([x(3:4);FDcrb(modelRobot,x(1:2),x(3:4),tau,springLoadFcn(modelRobot,pk,x,t))]);
%% t_data, q_data
options = odeset('RelTol',1e-4);
tic
for i=1:100,[t_data,q_data] = ode45(dynModelRobot,[0,20],[q;qd],options); end
toc
%% Visco-Elastic-friction with Articulated Rigid Body
dynModelRobot = @(t,x)([x(3:4);FDab(modelRobot,x(1:2),x(3:4),tau,springLoadFcn(modelRobot,pk,x,t))]);
%% t_data, q_data
options = odeset('RelTol',1e-4);
tic
for i=1:100,[t_data,q_data] = ode45(dynModelRobot,[0,20],[q;qd],options); end 
toc
%% post-processing
showmotion(modelRobot,t_data,q_data(:,[1 2])')
