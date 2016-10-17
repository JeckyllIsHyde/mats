function model = createChevallereauWalker(g)
% centers of masses
c.rfoot = [-0.1035;0;0.0341];
c.rtibia = [0.1686;0;0];
c.rfemur = [0.1686;0;0];
c.torso = [0.0963;0.0019;0.2813];
c.lfemur = [0.2234;0;0];
c.ltibia = [0.2234;0;0];
c.lfoot = [-0.0216;0;0.0252];
% masses
m.foot = 0.678;
m.tibia = 2.188;
m.femur = 5.025;
m.torso = 24.97;
% intertias
Ifoot = [[ 0.0013;      0;-0.6767],...
         [      0; 0.0098;      0],...
         [ 0.0024;      0; 0.0093]];
I.foot = Ifoot + m.foot*skew(c.rfoot)^2;
R = round(rz(-pi/2)*rx(-pi/2));
I.tibia = R'*( diag([1.9e-3;0.0898;0.0898]) + m.tibia*skew(c.rtibia)^2 )*R;
I.femur = R'*( diag([0.0664;0.2092;0.2092]) + m.femur*skew(c.rfemur)^2 )*R;
Itorso = [[ 3.0115;-0.0045;-0.6767],...
          [-0.0045; 3.3357;-0.0138],...
          [-0.6767;-0.0138; 0.4383]];
R = round(rz(pi/2));
I.torso = R*( Itorso + m.torso*skew(c.torso)^2 )*R;
% DH joint parameters
d([1,4,5,8,11,12,15],1) = [0.185;0.392;0.392;0.190;0.392;0.392;0.185];

% model structure
model.NB = 15;
% joint type
model.jtype = {'Ry', ... right toe
               'Rz','Rx','Ry', ... right ankle 
               'Ry', ... right knee
               'Ry','Rx','Rz',... right hip
               'Rz','Rx','Ry',... left hip
               'Ry', ... left knee
               'Ry','Rx','Rz', ... left ankle                
               };
% spatial inertias
model.I = {mcI(m.foot,c.rfoot,I.foot),... right foot
           eye(6)*1e-6,eye(6)*1e-6,mcI(m.tibia,c.rtibia,I.tibia),... right tibia
           mcI(m.femur,c.rfemur,I.femur),... right femur
           eye(6)*1e-6,eye(6)*1e-6,mcI(m.torso,c.torso,I.torso),... torso
           eye(6)*1e-6,eye(6)*1e-6,mcI(m.femur,c.lfemur,I.femur),... left femur
           mcI(m.tibia,c.ltibia,I.tibia),... left tibia
           eye(6)*1e-6,eye(6)*1e-6,mcI(m.foot,c.lfoot,I.foot),... left foot
          };
% topology
model.parent = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14];
% geometry and appereance
model.Xtree{1} = xlt([0;0;0]);
Lp = 0.207;lp = 0.08;
% right foot and toe
model.appearance.body{1} = ...
    { 'colour', [1.0,1.0,0.0],...
      'box',[0.0,-lp/2,0;-Lp,lp/2,-0.005;], ...
    };
% right ankle and shin
l1 = 0.05925;
model.Xtree{2} = xlt([-d(1);0;l1]);
model.appearance.body{2} = ...
    { 'colour', [0.0,0.0,1.0],...
      'cyl',[0.0,0,0.01-l1;0,0,0.041-l1;],0.01, ...
    };
model.Xtree{3} = xlt([0;0;0]);
model.appearance.body{3} = ...
    { 'colour', [1.0,0.0,0.0],...
      'cyl',[-0.01+l1,0.0,0.0;-0.041+l1,0,0;],0.01, ...
    };
model.Xtree{4} = xlt([0;0;0]);
model.appearance.body{4} = ...
    { 'colour', [0.0,1.0,0.0],...
      'cyl',[0.0,-0.02,0.0;0.0,0.02,0.0;],0.01, ...
      'colour', [1.0,0.0,1.0],...
      'cyl',[0.0,0.0,0.0;0.0,0.0,d(4);],0.01, ...
    };
% right knee
model.Xtree{5} = xlt([0;0;d(4)]);
model.appearance.body{5} = ...
    { 'colour', [0.0,1.0,0.0],...
      'cyl',[0.0,-0.02,0.0;0.0,0.02,0.0;],0.01, ...
      'colour', [1.0,0.0,1.0],...
      'cyl',[0.0,0.0,0.0;0.0,0.0,d(5);],0.01, ...
    };
% right hip and torso
model.Xtree{6} = xlt([0;0;d(5)]);
model.appearance.body{6} = ...
    { 'colour', [0.0,1.0,0.0],...
      'cyl',[0.0,-0.02,0.0;0.0,0.02,0.0;],0.01, ...
    };
model.Xtree{7} = xlt([0;0;0]);
model.appearance.body{7} = ...
    { 'colour', [1.0,0.0,0.0],...
      'cyl',[-0.02,0.0,0.0;0.02,0.0,0.0;],0.01, ...
    };
model.Xtree{8} = xlt([0;0;0]);
model.appearance.body{8} = ...
    { 'colour', [0.0,0.0,1.0],...
      'cyl',[0.0,0.0,-0.02;0.0,0.0,0.02;],0.01, ...
      'colour', [0.0,1.0,1.0],...
      'cyl',[0.0,0.0,0.0;0.0,d(8),0.0;],0.01, ...
      'cyl',[0.0,d(8)/2,0.0;0.0,d(8)/2,0.28;],0.01, ...
    };
% left hip
model.Xtree{9} = xlt([0;d(8);0]);
model.appearance.body{9} = ...
    { 'colour', [0.0,0.0,1.0],...
      'cyl',[0.0,0.0,-0.02;0.0,0.0,0.02;],0.01, ...
    };
model.Xtree{10} = xlt([0;0;0]);
model.appearance.body{10} = ...
    { 'colour', [1.0,0.0,0.0],...
      'cyl',[-0.02,0.0,0.0;0.02,0.0,0.0;],0.01, ...
    };
model.Xtree{11} = xlt([0;0;0]);
model.appearance.body{11} = ...
    { 'colour', [0.0,1.0,0.0],...
      'cyl',[0.0,-0.02,0.0;0.0,0.02,0.0;],0.01, ...
      'colour', [1.0,0.0,1.0],...
      'cyl',[0.0,0.0,0.0;0.0,0.0,-d(11);],0.01, ...
    };
% left knee
model.Xtree{12} = xlt([0;0;-d(11)]);
model.appearance.body{12} = ...
    { 'colour', [0.0,1.0,0.0],...
      'cyl',[0.0,-0.02,0.0;0.0,0.02,0.0;],0.01, ...
      'colour', [1.0,0.0,1.0],...
      'cyl',[0.0,0.0,0.0;0.0,0.0,-d(12);],0.01, ...
    };
% left ankle-foot
model.Xtree{13} = xlt([0;0;-d(12)]);
model.appearance.body{13} = ...
    { 'colour', [0.0,1.0,0.0],...
      'cyl',[0.0,-0.02,0.0;0.0,0.02,0.0;],0.01, ...
    };
model.Xtree{14} = xlt([0;0;0]);
model.appearance.body{14} = ...
    { 'colour', [1.0,0.0,0.0],...
      'cyl',[-0.01+l1,0.0,0.0;-0.041+l1,0,0;],0.01, ...
    };
model.Xtree{15} = xlt([0;0;0]);
model.appearance.body{15} = ...
    { 'colour', [0.0,0.0,1.0],...
      'cyl',[0.0,0,0.01-l1;0,0,0.041-l1;],0.01, ...
      'colour', [1.0,1.0,0.0],...
      'box',[d(1)-Lp,-lp/2,-l1;d(1),lp/2,-l1-0.005;], ...
    };
% base
model.appearance.base = ...
    { 'sphere',[0.0,0.0,0.0],0.025, ...
    };
% gravity
model.gravity = g;

% some functions
model.viscosuousFrictionFcn = @viscosuousFrictionFcn;
model.limitJointForcesFnc = @limitJointForcesFnc;
end

function fex = viscosuousFrictionFcn(x,b)

fex = cell(1,15);
fex{1} = [0;b*x(16);0;0;0;0];
fex{15} = [0;b*x(30);0;0;0;0];
for i = 2:14
    fex{i} = [0;-b*x(15+i)+b*x(16+i);0;0;0;0];
end

end

function fex = limitJointForcesFnc(x,f_extFcn)

% 'Ry', ... right toe (flexion-extension)
% 'Rz','Rx','Ry', ... right ankle (),()
% 'Ry', ... right knee
% 'Ry','Rx','Rz',... right hip
% 'Rz','Rx','Ry',... left hip
% 'Ry', ... left knee
% 'Ry','Rx','Rz', ... left ankle                

K = 1e6; D = 2000;
fex = f_extFcn(x);
% stand on toe
if x(1)< 0*pi/180 || x(1)>30*pi/180
    f = -K*x(1)-D*x(16);
    fex{1} = [0;f;0;0;0;0]+fex{1};
%    disp(['collision right hip: ',num2str(180/pi*x(1))])
end
% ankle
if x(2)<-10*pi/180 || x(2)>10*pi/180
    f = -K*x(2)-D*x(17);
    fex{1} = [0;0;-f;0;0;0]+fex{1};
    fex{2} = [0;0; f;0;0;0]+fex{2};
    % disp(['collision right knee: ',num2str(180/pi*x(3))])
end
% ankle pronation
if x(3)<-20*pi/180 || x(3)>30*pi/180
    f = -K*x(3)-D*x(18);
    fex{2} = [-f;0;0;0;0;0]+fex{2};
    fex{3} = [ f;0;0;0;0;0]+fex{3};
    % disp(['collision right knee: ',num2str(180/pi*x(3))])
end
 % ankle steering
if x(4)<-10*pi/180 || x(4)>20*pi/180
    f = -K*x(4)-D*x(19);
    fex{3} = [0;-f;0;0;0;0]+fex{3};
    fex{4} = [0; f;0;0;0;0]+fex{4};
    % disp(['collision left knee: ',num2str(180/pi*x(3))])
end
% knee flexion-extension
if x(5)<-90*pi/180 || x(5)>15*pi/180
    f = -K*x(5)-D*x(20);
    fex{4} = [0;-f;0;0;0;0]+fex{4};
    fex{5} = [0; f;0;0;0;0]+fex{5};
    % disp(['collision left knee: ',num2str(180/pi*x(3))])
end
% hip flexion-extension
if x(6)<-110*pi/180 || x(6)>30*pi/180
    f = -K*x(5)-D*x(20);
    fex{4} = [0;-f;0;0;0;0]+fex{4};
    fex{5} = [0; f;0;0;0;0]+fex{5};
    % disp(['collision left knee: ',num2str(180/pi*x(3))])
end

end
