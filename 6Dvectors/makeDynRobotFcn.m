function [fcn,xdFcn] = makeDynRobotFcn(modelRobot,datOutput)
    h = 1e-2;
%     stepFcn = @(t,a)(max(0,sign(t-a)));
%     dircFcn = @(t,a)((max(0,sign(t-a))-max(0,sign(t-(a+h))))/h);
    rampFcn = @(t,a)(max(0,t-a));
    parbFcn = @(t,a)(rampFcn(t,a).^2);
    cubcFcn = @(t,a)(rampFcn(t,a).^3);
    xdFcn = {@(t)(1/6*(pi/4/2.5*cubcFcn(t,0)-pi/4/1.25*cubcFcn(t,2.5)+pi/4/1.25*cubcFcn(t,5)-pi/4/1.25*cubcFcn(t,7.5)));
             @(t)(1/6*(pi/4/2.5*cubcFcn(t,0)-pi/4/1.25*cubcFcn(t,2.5)+pi/4/1.25*cubcFcn(t,5)-pi/4/1.25*cubcFcn(t,7.5)))};
    vdFcn = {@(t)(1/2*(pi/4/2.5*parbFcn(t,0)-pi/4/1.25*parbFcn(t,2.5)+pi/4/1.25*parbFcn(t,5)-pi/4/1.25*parbFcn(t,7.5)));
             @(t)(1/2*(pi/4/2.5*parbFcn(t,0)-pi/4/1.25*parbFcn(t,2.5)+pi/4/1.25*parbFcn(t,5)-pi/4/1.25*parbFcn(t,7.5)))};
    adFcn = {@(t)(pi/4/2.5*rampFcn(t,0)-pi/4/1.25*rampFcn(t,2.5)+pi/4/1.25*rampFcn(t,5)-pi/4/1.25*rampFcn(t,7.5));
             @(t)(pi/4/2.5*rampFcn(t,0)-pi/4/1.25*rampFcn(t,2.5)+pi/4/1.25*rampFcn(t,5)-pi/4/1.25*rampFcn(t,7.5))};
%     vdFcn = {@(t)(pi/4/2.5*stepFcn(t,0)-pi/4/1.25*stepFcn(t,2.5)+pi/4/1.25*stepFcn(t,5)-pi/4/1.25*stepFcn(t,7.5));
%              @(t)(pi/4/2.5*stepFcn(t,0)-pi/4/1.25*stepFcn(t,2.5)+pi/4/1.25*stepFcn(t,5)-pi/4/1.25*stepFcn(t,7.5))};
%     adFcn = {@(t)(pi/4/2.5*dircFcn(t,0)-pi/4/1.25*dircFcn(t,2.5)+pi/4/1.25*dircFcn(t,5)-pi/4/1.25*dircFcn(t,7.5));
%              @(t)(pi/4/2.5*dircFcn(t,0)-pi/4/1.25*dircFcn(t,2.5)+pi/4/1.25*dircFcn(t,5)-pi/4/1.25*dircFcn(t,7.5))};
    b = 0.1;
    f_extFcn = @(t,x)({[0;-b*x(3)+b*x(4);0;0;0;0],...
                       [0;       -b*x(4);0;0;0;0]});
    kp = 10; kd = 1.0;
%     controlSignalFcn = @(t,x)(HandC(modelRobot,x([1,2]),[0;0],{})*...
%                               [kp*(xdFcn{1}(t)-x(1))+kd*(1*vdFcn{1}(t)-x(3))+1*adFcn{1}(t);...
%                                kp*(xdFcn{2}(t)-x(2))+kd*(1*vdFcn{2}(t)-x(4))+1*adFcn{2}(t)]...
%                               +1*ID(modelRobot,x([1,2]),1*x([3,4]),[0;0],f_extFcn(t,x)));
    function [xp,signals] = dynModelRobot(t,x)
        tray_d = [xdFcn{1}(t);xdFcn{2}(t);
                  vdFcn{1}(t);vdFcn{2}(t);
                  adFcn{1}(t);adFcn{2}(t)];
        u = (HandC(modelRobot,x([1,2]),[0;0],{})*...
                              [kp*(tray_d(1)-x(1))+kd*(1*tray_d(3)-x(3))+1*tray_d(5);...
                               kp*(tray_d(2)-x(2))+kd*(1*tray_d(4)-x(4))+1*tray_d(6)]...
                              +1*ID(modelRobot,x([1,2]),1*x([3,4]),[0;0],f_extFcn(t,x)));
        f_x = FDab(modelRobot,x(1:2),x(3:4),u,f_extFcn(t,x));
        xp = [x(3:4);...
              f_x];
        signals = [t;tray_d;x;f_x;u]';
        datOutput.append(signals);
    end
    fcn = @(t,x)(dynModelRobot(t,x));
end