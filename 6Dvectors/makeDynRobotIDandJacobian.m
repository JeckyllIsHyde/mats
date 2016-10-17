function [fcn,x_refFcn] = makeDynRobotIDandJacobian(modelRobot,kp,kd)
    pc = [0.5; 0; 0.3];
    r = 0.2;
    w = 0.25;
%    x_refFcn = @(t)([r*cos(w*t)+pc(1);zeros(size(t))+pc(2);r*sin(w*t)+pc(3)]);
%    v_refFcn = @(t)(w*r*[-sin(w*t);zeros(size(t));cos(w*t)]);
%    a_refFcn = @(t)(w^2*r*[-cos(w*t);zeros(size(t));-sin(w*t)]);
    x_refFcn = @(t)([r*sin(w*t)+pc(1);zeros(size(t))+pc(2);r*cos(w*t)+pc(3)]);
    v_refFcn = @(t)(w*r*[cos(w*t);zeros(size(t));-sin(w*t)]);
    a_refFcn = @(t)(w^2*r*[-sin(w*t);zeros(size(t));-cos(w*t)]);
    % dinamic model with joint PD controller with G compensation
    ph = [0.3;0;0]; % Center Tool Point
    % kp = 50.0;kd = 3.5; % 5.0,0.5
    b = 0.2;
    f_extFcn = @(t,x)({[0;-b*x(3)+b*x(4);0;0;0;0],...
                       [0;       -b*x(4);0;0;0;0]});
    function [xp,signals] = dynModelRobot(t,x)
        [p,J,Jd] = directKinematics(modelRobot,x(1:2),x(3:4),ph);
        x_e = x_refFcn(t)-p;
        Jp = xlt(p)*J;
        Jpp = xlt(p)*Jd;
        xp_e = v_refFcn(t)-Jp(4:6,:)*x(3:4);
        fu = a_refFcn(t)+kp*x_e+kd*xp_e-Jpp(4:6,:)*x(3:4); % Fpt(fu,p)
        y = ((J.'*J)\J.')*Fpt(fu,p);
        [B,C] = HandC(modelRobot,x(1:2),x(3:4),f_extFcn(t,x));%{});%
        u = B*y+C;
        f_x = FDab(modelRobot,x(1:2),x(3:4),u,f_extFcn(t,x));
        xp = [x(3:4);...
              f_x];
        signals = p';
    end
    fcn = @(t,x)(dynModelRobot(t,x));
end