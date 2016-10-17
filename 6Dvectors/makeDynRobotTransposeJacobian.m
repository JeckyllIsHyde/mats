function [fcn,xdFcn] = makeDynRobotTransposeJacobian(modelRobot,mode)
    stepFcn = @(t,a)(max(0,t>=a));
    p1 = [0.5; 0; 0.3];
    p2 = [0.5; 0;-0.3];
    % dinamic model with joint PD controller with G compensation
    ph = [0.3;0;0];
    % flag for xdFcn, flag = 0 for only a step
    if strcmp(mode,'trp')
        kp = 10;b = 0.2;flag = 1;
    elseif strcmp(mode,'tcg')
        kp = 10;b = 0.2;kd = 0.8;flag = 1;
    elseif strcmp(mode,'inv')
        kp = 10;b = 0.2;flag = 1;flagG = 1;
    end
    xdFcn = @(t)(p1*stepFcn(t,0)-flag*p1*stepFcn(t,2.5)...
                +flag*p2*stepFcn(t,2.5)-flag*p2*stepFcn(t,5)...
                +flag*p1*stepFcn(t,5)-flag*p1*stepFcn(t,7.5)...
                +flag*p2*stepFcn(t,7.5));
    f_extFcn = @(t,x)({[0;-b*x(3)+b*x(4);0;0;0;0],...
                       [0;       -b*x(4);0;0;0;0]});
    function xp = dynModelRobotTrp(t,x)
        [p,J,~] = directKinematics(modelRobot,x(1:2),x(3:4),ph);
        fu = kp*(xdFcn(t)-p);
        u = J.'*Fpt(fu,p);
        f_x = FDab(modelRobot,x(1:2),x(3:4),u,f_extFcn(t,x));
        xp = [x(3:4);...
              f_x];
    end
    function xp = dynModelRobotTrpCG(t,x)
        [p,J,~] = directKinematics(modelRobot,x(1:2),x(3:4),ph);
        fu = kp*(xdFcn(t)-p)+kd*(0-J(4:6,:)*x(3:4));
        u = J.'*Fpt(fu,p)...
            +ID(modelRobot,x([1,2]),[0;0],[0;0],{});
        f_x = FDab(modelRobot,x(1:2),x(3:4),u,f_extFcn(t,x));
        xp = [x(3:4);...
              f_x];
    end
    function xp = dynModelRobotInv(t,x)
        [p,J,~] = directKinematics(modelRobot,x(1:2),x(3:4),ph);
        x_err = xdFcn(t)-p;
        Jp = xlt(p)*J;
        invJp = (Jp.'*Jp)\Jp.'; invJp = invJp(:,4:6); 
        u = kp*invJp*x_err... % with inverse jacobian
            +flagG*ID(modelRobot,x([1,2]),[0;0],[0;0],{});
        f_x = FDab(modelRobot,x(1:2),x(3:4),u,f_extFcn(t,x));
        xp = [x(3:4);...
              f_x];
    end
    if strcmp(mode,'trp')
        fcn = @(t,x)(dynModelRobotTrp(t,x));
    elseif strcmp(mode,'tcg')
        fcn = @(t,x)(dynModelRobotTrpCG(t,x));
    elseif strcmp(mode,'inv')
        fcn = @(t,x)(dynModelRobotInv(t,x));
    else
        error('Specify jacobian-based control: trp, tcg or inv!!!')
    end
end