function [fcn,x_refFcn] = makeDynRobotWithForceFeedback(modelRobot,kp,kd)
    pc = [0.5; 0; -0.3];
    v = [0;0;0.05];
    x_refFcn = @(t)(repmat(v,1,length(t)).*repmat(t,3,1)+repmat(pc,1,length(t)));
    v_refFcn = @(t)(repmat(v,1,length(t)));
    a_refFcn = @(t)(zeros(3,length(t)));
    % dinamic model with joint PD controller with G compensation
    ph = [0.3;0;0]; % Center Tool Point
    b = 0.2;
    f_extFcn = @(t,x)({[0;-b*x(3)+b*x(4);0;0;0;0],...
                       [0;       -b*x(4);0;0;0;0]});               
    Bc = diag(0.01*[1;1;1]);
    Fc = diag(kd*[1;1;1]);
    function [xp,signals] = dynModelRobot(t,x)
        [p,J,Jd] = directKinematics(modelRobot,x(1:2),x(3:4),ph);

        kenv = 1e2;
        fenv = Fpt([-kenv*max(0,p(1)-0.49);0;0],p);
        
        fr = Fpt([-0.4;0;0],p);
        f_e = fr(4:6)-fenv(4:6);
        
        x_c = x(5:7);
        xp_c = x(8:10);
        xpp_c = Bc\(f_e-Fc*xp_c);
        
        x_e = x_refFcn(t)+x_c-p;
        Jp = xlt(p)*J;
        Jpp = xlt(p)*Jd;
        xp_e = v_refFcn(t)+xp_c-Jp(4:6,:)*x(3:4);

        fu = a_refFcn(t)+xpp_c+kp*x_e+kd*xp_e-Jpp(4:6,:)*x(3:4);
        y = ((J.'*J)\J.')*Fpt(fu,p);
 
        fext = f_extFcn(t,x); 
        fext{end} = fext{end}+fenv;
        
        [B,C] = HandC(modelRobot,x(1:2),x(3:4),fext);
        u = B*y+C+J'*fenv;
        
        f_x = FDab(modelRobot,x(1:2),x(3:4),u,fext);
        xp = [x(3:4);...
              f_x;...
              xp_c;...
              xpp_c];
        signals = [p;fenv]';
    end
    fcn = @(t,x)(dynModelRobot(t,x));
end