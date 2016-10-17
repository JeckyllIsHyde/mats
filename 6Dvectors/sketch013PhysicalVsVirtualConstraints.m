clear,clc
%% physical vs virtual constraint: differences inside dynamics
modelRobot = createRobotRP(1,[0;0;0]);
showmotion(modelRobot)
%% model for robot with constrain
f_extFcn = {};
dld_fcn = @(th)(cos(th));
d2ld_fcn = @(th)(-sin(th));
uVirtual_fcn = @(x,model)([0;...
      model.m*((-x(2)+d2ld_fcn(x(1)))*x(3)^2-2/x(2)*dld_fcn(x(1))*x(3)*x(4))]);
dynModelRobotPhy = @(t,x)([x(3:4);FDgq(modelRobot,x(1:2),x(3:4),[0;0],f_extFcn)]);
dynModelRobotVir = @(t,x)([x(3:4);FDab(modelRobot,x(1:2),x(3:4),uVirtual_fcn(x,modelRobot),f_extFcn)]);
%% simulation
q = [0.0;1.5]; qd = [1;1];
options = odeset('RelTol',1e-4);
tic
[t_dataPhy,q_dataPhy] = ode45(dynModelRobotPhy,[0,50],[q;qd],options);
toc
tic
[t_dataVir,q_dataVir] = ode45(dynModelRobotVir,[0,50],[q;qd],options);
toc
%% post-processing
showmotion(modelRobot,t_dataPhy,q_dataPhy(:,[1 2])')
%% post-processing
showmotion(modelRobot,t_dataVir,q_dataVir(:,[1 2])')
%%
figure(1)
plot(t_dataPhy,q_dataPhy(:,2),'-',...
     t_dataVir,q_dataVir(:,2),'-'),hold on, grid on
figure(2)
plot(q_dataPhy(:,1),q_dataPhy(:,2),'-',...
     q_dataVir(:,1),q_dataVir(:,2),'-'),hold on, grid on
