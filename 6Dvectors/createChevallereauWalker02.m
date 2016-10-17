function model = createChevallereauWalker02(g)
% DH joint parameters
d([1,4,5,8,11,12,15],1) = [0.185;0.392;0.392;0.190;0.392;0.392;0.185];
% foot dimensions
Lp = 0.207;lp = 0.08;
l1 = 0.05925;
% centers of masses
% c.rfoot = [-0.1035;0;0.0341];
% c.rtibia = [0.1686;0;0];
% c.rfemur = [0.1686;0;0];
% c.torso = [0.0963;0.0019;0.2813];
% c.lfemur = [0.2234;0;0];
% c.ltibia = [0.2234;0;0];
% c.lfoot = [-0.0216;0;0.0252];
% masses
m.foot = 0.678;
m.tibia = 2.188;
m.femur = 5.025;
m.torso = 24.97;
% intertias
ltorso = 0.3;
I.torso = m.torso * ltorso^2 * diag([0.0025,1.015/12,1.015/12]);
I.femur = m.femur * d(5)^2 * diag([0.0025,1.015/12,1.015/12]);
I.tibia = m.tibia * d(5)^2 * diag([0.0025,1.015/12,1.015/12]);
I.foot = m.foot * Lp^2 * diag([1.015/12,1.015/12,0.0025]);
% model structure
model.NB = 15;
% joint type
model.jtype = {...
               'Ry',... torso
               'Rx','Rz','Ry',... right hip
               'Ry', ... right knee
               'Ry','Rz','Rx', ... right ankle 
               'Rx','Rz','Ry',... left hip
               'Ry', ... left knee
               'Ry','Rz','Rx', ... left ankle                
               };
% spatial inertias
miniI = 0*eye(6)*1e-4;
model.I = {...
           mcI(m.torso,[ltorso/2;0;0],I.torso),... torso
           miniI,miniI,...
           mcI(m.femur,[d(5)/2;0;0],I.femur),... right femur
           mcI(m.tibia,[d(4)/2;0;0],I.tibia),... right tibia
           miniI,miniI,...
           mcI(m.foot,[lp;0;Lp/2],I.foot),... right foot
           miniI,miniI,...
           mcI(m.femur,[d(5)/2;0;0],I.femur),... left femur
           mcI(m.tibia,[d(4)/2;0;0],I.tibia),... left tibia
           miniI,miniI,...
           mcI(m.foot,[lp;0;Lp/2],I.foot),... left foot
          };
% topology
model.parent = [0,1,2,3,4,5,6,7,1,9,10,11,12,13,14];
% geometry and appereance
model.Xtree{1} = eye(6);
% torso
model.appearance.body{1} = ...
    { 'colour', [0.0,1.0,1.0],...
      'sphere',[0.0,0.0,0.0],0.025, ...
      'cyl',[0.0,0.0,0.0;ltorso,0.0,0.0;],0.01, ...
      'cyl',[ltorso,-d(8)/2,0.0;ltorso,d(8)/2,0.0;],0.01, ...
    };
% right leg - hip
model.Xtree{2} = xlt([ltorso;-d(8)/2;0]);
model.Xtree{3} = xlt([0;0;0]);
model.Xtree{4} = eye(6);
model.appearance.body{2} = ...
    { 'colour', [1.0,0.0,0.0],...
      'cyl',[-0.02,0.0,0.0;0.02,0,0;],0.01, ...
    };
model.appearance.body{3} = ...
    { 'colour', [0.0,0.0,1.0],...
      'cyl',[0.0,0.0,-0.02;0.0,0.0,0.02;],0.01, ...
    };
model.appearance.body{4} = ...
    { 'colour', [0.0,1.0,0.0],...
      'cyl',[0.0,-0.02,0.0;0.0,0.02,0.0;],0.01, ...
      'colour', [1.0,0.0,1.0],...
      'cyl',[0.0,0.0,0.0;d(5),0.0,0.0;],0.01, ...
    };
% left knee
model.Xtree{5} = xlt([d(5);0;0]);
model.appearance.body{5} = ...
    { 'colour', [0.0,1.0,0.0],...
      'cyl',[0.0,-0.02,0.0;0.0,0.02,0.0;],0.01, ...
      'colour', [1.0,0.0,1.0],...
      'cyl',[0.0,0.0,0.0;d(4),0.0,0.0;],0.01, ...
    };
% left ankle
model.Xtree{6} = xlt([d(5);0;0]);
model.Xtree{7} = xlt([0;0;0]);
model.Xtree{8} = xlt([0;0;0]);
model.appearance.body{6} = ...
    { 'colour', [0.0,1.0,0.0],...
      'cyl',[0.0,-0.02,0.0;0.0,0.02,0.0;],0.01, ...
    };
model.appearance.body{7} = ...
    { 'colour', [0.0,0.0,1.0],...
      'cyl',[0.0,0.0,-0.02;0.0,0.0,0.02;],0.01, ...
    };
model.appearance.body{8} = ...
    { 'colour', [1.0,0.0,0.0],...
      'cyl',[-0.02,0.0,0.0;0.02,0.0,0.0;],0.01, ...
      'colour', [1.0,1.0,0.0],...
      'box',[l1,-lp/2,d(1)-Lp;l1+0.005,lp/2,d(1);], ...
    };
% left hip
model.Xtree{9} = xlt([ltorso;d(8)/2;0]);
model.Xtree{10} = xlt([0;0;0]);
model.Xtree{11} = eye(6);
model.appearance.body{9} = ...
    { 'colour', [1.0,0.0,0.0],...
      'cyl',[-0.02,0.0,0.0;0.02,0,0;],0.01, ...
    };
model.appearance.body{10} = ...
    { 'colour', [0.0,0.0,1.0],...
      'cyl',[0.0,0.0,-0.02;0.0,0.0,0.02;],0.01, ...
    };
model.appearance.body{11} = ...
    { 'colour', [0.0,1.0,0.0],...
      'cyl',[0.0,-0.02,0.0;0.0,0.02,0.0;],0.01, ...
      'colour', [1.0,0.0,1.0],...
      'cyl',[0.0,0.0,0.0;d(5),0.0,0.0;],0.01, ...
    };
% left knee
model.Xtree{12} = xlt([d(5);0;0]);
model.appearance.body{12} = ...
    { 'colour', [0.0,1.0,0.0],...
      'cyl',[0.0,-0.02,0.0;0.0,0.02,0.0;],0.01, ...
      'colour', [1.0,0.0,1.0],...
      'cyl',[0.0,0.0,0.0;d(4),0.0,0.0;],0.01, ...
    };
% left ankle
model.Xtree{13} = xlt([d(5);0;0]);
model.Xtree{14} = xlt([0;0;0]);
model.Xtree{15} = xlt([0;0;0]);
model.appearance.body{13} = ...
    { 'colour', [0.0,1.0,0.0],...
      'cyl',[0.0,-0.02,0.0;0.0,0.02,0.0;],0.01, ...
    };
model.appearance.body{14} = ...
    { 'colour', [0.0,0.0,1.0],...
      'cyl',[0.0,0.0,-0.02;0.0,0.0,0.02;],0.01, ...
    };
model.appearance.body{15} = ...
    { 'colour', [1.0,0.0,0.0],...
      'cyl',[-0.02,0.0,0.0;0.02,0.0,0.0;],0.01, ...
      'colour', [1.0,1.0,0.0],...
      'box',[l1,-lp/2,d(1)-Lp;l1+0.005,lp/2,d(1);], ...
    };

% base
model.appearance.base = ...
    { 'sphere',[0.0,0.0,0.0],0.025, ...
      'colour',[0.2,1.0,0.2],...
      'box',[-0.5,-0.5,-1*0.85;0.5,0.5,-1*0.85-0.001], ...
    };
% gravity
model.gravity = g;

% ground contact
model.gc.body = [1,4,5,9,10,8,8,8,8,15,15,15,15];
model.gc.point = [[0;0;0],...
                  [0;0;0],[0;0;0],[0;0;0],[0;0;0],...
                  [l1;-lp/2;d(1)-Lp],[l1; lp/2;d(1)],...
                  [l1; lp/2;d(1)-Lp],[l1;-lp/2;d(1)],...
                  [l1;-lp/2;d(1)-Lp],[l1; lp/2;d(1)],...
                  [l1; lp/2;d(1)-Lp],[l1;-lp/2;d(1)]];

% some functions
model.viscosuousFrictionFcn = @viscosuousFrictionFcn;
model.limitJointForcesFcn = @limitJointForcesFcn;
model.musclesForcesFcn = @musclesForcesFcn;
model.footContactFcn = @footContactFcn;
end

function fex = viscosuousFrictionFcn(model,x,b)

% ONE LEG FROM TORSO TO FOOT
% 'Ry',... torso
% 'Rx','Rz','Ry',... right hip
% 'Ry', ... right knee
% 'Ry','Rz','Rx', ... right ankle 

for i = 1:model.NB
    [ XJ, S{i} ] = jcalc( model.jtype{i}, x(i) );
    Xup{i} = XJ * model.Xtree{i};
    vJ{i} = S{i}*x(i+model.NB);
    if model.parent(i) == 0
        Xa{i} = Xup{i};
    else
        Xa{i} = Xup{i} * Xa{model.parent(i)};
    end
end

if model.NB==15
    ost = 0; % offset
    v01 = Xa{1+ost}\vJ{1+ost};
else
    ost= 5;
end

v13 = (Xa{2+ost}\vJ{2+ost}+Xa{3+ost}\vJ{3+ost}+Xa{4+ost}\vJ{4+ost});
v34 = Xa{5+ost}\vJ{5+ost};
v47 = (Xa{6+ost}\vJ{6+ost}+Xa{7+ost}\vJ{7+ost}+Xa{8+ost}\vJ{8+ost});
v911 = (Xa{9+ost}\vJ{9+ost}+Xa{10+ost}\vJ{10+ost}+Xa{11+ost}\vJ{11+ost});
v1112 = Xa{12+ost}\vJ{12+ost};
v1215 = (Xa{13+ost}\vJ{13+ost}+Xa{14+ost}\vJ{14+ost}+Xa{15+ost}\vJ{15+ost});

fex = {+b*v13+b*v911,... torso
       zeros(6,1),zeros(6,1),-b*v13+b*v34,... right femur
       -b*v34+b*v47,... right tibia
       zeros(6,1),zeros(6,1),-b*v47,... right foot
       zeros(6,1),zeros(6,1),-b*v911+b*v1112,... left femur
       -b*v1112+b*v1215,...
       zeros(6,1),zeros(6,1),-b*v1215,...
       };

if model.NB~=15
    fex = [repmat({zeros(6,1)},1,5),fex];
else
    fex{1} = fex{1}-b*v01;
end

end

function fex = limitJointForcesFcn(model,x,f_extFcn)

% ONE LEG FROM TORSO TO FOOT
% 'Ry',... torso
% 'Rx','Rz','Ry',... right hip
% 'Ry', ... right knee
% 'Ry','Rz','Rx', ... right ankle 

for i = 1:model.NB
    [ XJ, S{i} ] = jcalc( model.jtype{i}, x(i) );
    Xup{i} = XJ * model.Xtree{i};
    vJ{i} = S{i}*x(i+model.NB);
    if model.parent(i) == 0
        Xa{i} = Xup{i};
    else
        Xa{i} = Xup{i} * Xa{model.parent(i)};
    end
end

if model.NB==15
    ost = 0; % offset
else
    ost= 5;
end
K = 1*1e2; D = 1*2e0;
fex = f_extFcn(x);
% right hip internal-external rotation
qmin = -40*pi/180;qmax = 45*pi/180;
if (x(2+ost)<qmin)
    f = Xa{2+ost}\([0;D*x(2+ost+model.NB)+K*(x(2+ost)-qmin);0;0;0;0]);
    fex{1+ost} = fex{1+ost}+f;fex{4+ost} = fex{4+ost}-f;
elseif (x(2+ost)>qmax)
    f = Xa{2+ost}\([0;D*x(2+ost+model.NB)+K*(x(2+ost)-qmax);0;0;0;0]);
    fex{1+ost} = fex{1+ost}+f;fex{4+ost} = fex{4+ost}-f;
end
% right hip adduntion-abduction
qmin = -50*pi/180;qmax = 30*pi/180;
if (x(3+ost)<qmin)
    f = Xa{3+ost}\([0;D*x(3+ost+model.NB)+K*(x(3+ost)-qmin);0;0;0;0]);
    fex{1+ost} = fex{1+ost}+f;fex{4+ost} = fex{4+ost}-f;
elseif (x(2+ost)>qmax)
    f = Xa{3+ost}\([0;D*x(3+ost+model.NB)+K*(x(3+ost)-qmax);0;0;0;0]);
    fex{1+ost} = fex{1+ost}+f;fex{4+ost} = fex{4+ost}-f;
end
% right hip flexion-extension
qmin = -30*pi/180;qmax = 110*pi/180;
if (x(4+ost)<qmin)
    f = Xa{4+ost}\([0;D*x(4+ost+model.NB)+K*(x(4+ost)-qmin);0;0;0;0]);
    fex{1+ost} = fex{1+ost}+f;fex{4+ost} = fex{4+ost}-f;
elseif (x(2+ost)>qmax)
    f = Xa{4+ost}\([0;D*x(4+ost+model.NB)+K*(x(4+ost)-qmax);0;0;0;0]);
    fex{1+ost} = fex{1+ost}+f;fex{4+ost} = fex{4+ost}-f;
end
% right knee flexion-extension
qmin = -15*pi/180;qmax = 110*pi/180;
if (x(5+ost)<qmin)
    f = Xa{5+ost}\([0;D*x(5+ost+model.NB)+K*(x(5+ost)-qmin);0;0;0;0]);
    fex{4+ost} = fex{4+ost}+f;fex{5+ost} = fex{5+ost}-f;
elseif (x(5+ost)>qmax)
    f = Xa{5+ost}\([0;D*x(5+ost+model.NB)+K*(x(5+ost)-qmax);0;0;0;0]);
    fex{4+ost} = fex{4+ost}+f;fex{5+ost} = fex{5+ost}-f;
end
% right foot flexion-extension
qmin = -45*pi/180;qmax = 30*pi/180;
if (x(6+ost)<qmin)
    f = Xa{6+ost}\([0;D*x(6+ost+model.NB)+K*(x(6+ost)-qmin);0;0;0;0]);
    fex{5+ost} = fex{5+ost}+f;fex{6+ost} = fex{6+ost}-f;
elseif (x(6+ost)>qmax)
    f = Xa{6+ost}\([0;D*x(6+ost+model.NB)+K*(x(6+ost)-qmax);0;0;0;0]);
    fex{5+ost} = fex{5+ost}+f;fex{8+ost} = fex{8+ost}-f;
end
% right foot pronation-supination
qmin = -20*pi/180;qmax = 30*pi/180;
if (x(7+ost)<qmin)
    f = Xa{7+ost}\([0;D*x(7+ost+model.NB)+K*(x(7+ost)-qmin);0;0;0;0]);
    fex{5+ost} = fex{5+ost}+f;fex{8+ost} = fex{8+ost}-f;
elseif (x(7+ost)>qmax)
    f = Xa{7+ost}\([0;D*x(7+ost+model.NB)+K*(x(7+ost)-qmax);0;0;0;0]);
    fex{5+ost} = fex{5+ost}+f;fex{8+ost} = fex{8+ost}-f;
end
% right foot internal-external rotation
qmin = -15*pi/180;qmax = 5*pi/180;
if (x(8+ost)<qmin)
    f = Xa{8+ost}\([0;D*x(8+ost+model.NB)+K*(x(8+ost)-qmin);0;0;0;0]);
    fex{5+ost} = fex{5+ost}+f;fex{8+ost} = fex{8+ost}-f;
elseif (x(8+ost)>qmax)
    f = Xa{8+ost}\([0;D*x(8+ost+model.NB)+K*(x(8+ost)-qmax);0;0;0;0]);
    fex{5+ost} = fex{5+ost}+f;fex{8+ost} = fex{8+ost}-f;
end

end

function fex = musclesForcesFcn(model,x,f_extFcn)

% ONE LEG FROM TORSO TO FOOT
% 'Ry',... torso
% 'Rx','Rz','Ry',... right hip
% 'Ry', ... right knee
% 'Ry','Rz','Rx', ... right ankle 

d([1,4,5,8,11,12,15],1) = [0.185;0.392;0.392;0.190;0.392;0.392;0.185];
ltorso = 0.3;
Lp = 0.207;
l1 = 0.05925;

for i = 1:model.NB
    [ XJ, S{i} ] = jcalc( model.jtype{i}, x(i) );
    Xup{i} = XJ * model.Xtree{i};
    vJ{i} = S{i}*x(i+model.NB);
    if model.parent(i) == 0
        Xa{i} = Xup{i};
    else
        Xa{i} = Xup{i} * Xa{model.parent(i)};
    end
end

if model.NB==15
    ost = 0; % offset
else
    ost= 5;
end
fex = f_extFcn(x);
% between femur and tibia
Ln = 0.2;
k = 2e3;
p1 = Xpt(inv(Xa{4+ost}),[d(4)/2;0;0;]);
p2 = Xpt(inv(Xa{5+ost}),[d(5)/2;0;0;]);
Lk = norm(p2-p1);
f = Fpt(k*(p2-p1)/Lk*max((Lk-Ln)*0,Lk-Ln),p1);
fex{4+ost} = fex{4+ost}+f;
fex{5+ost} = fex{5+ost}-f;
% between torso and femur
Ln = 0.2;
k = 2e3;
p1 = Xpt(inv(Xa{1+ost}),[ltorso-0.1;-d(8)/2;0.05;]);
p2 = Xpt(inv(Xa{4+ost}),[d(4)/2;0;0;]);
Lk = norm(p2-p1);
f = Fpt(k*(p2-p1)/Lk*max((Lk-Ln)*0,Lk-Ln),p1);
fex{1+ost} = fex{1+ost}+f;
fex{4+ost} = fex{4+ost}-f;
% between tibia and foot
Ln = d(5)/2;
k = 2e3;
p1 = Xpt(inv(Xa{5+ost}),[d(5)/2;0;0;]);
p2 = Xpt(inv(Xa{8+ost}),[l1;0;d(1)/2;]);
Lk = norm(p2-p1);
f = Fpt(k*(p2-p1)/Lk*max((Lk-Ln)*0,Lk-Ln),p1);
fex{5+ost} = fex{5+ost}+f;
fex{8+ost} = fex{8+ost}-f;

end

function fex = footContactFcn(model,x,gL,f_extFcn)

q = x(1:model.NB); 
qd = x(model.NB+1:2*model.NB); 

K = 1e4; D = 2000;

posvel = gcPosVel( model, q, qd );
%f = gcontact( K, D, 0, posvel(1:3,:), posvel(4:6,:), 0 );
p = posvel(1:3,:);pd = posvel(4:6,:);
z = p(end,:) - gL;
zd = pd(end,:);
zr = sqrt(max(0,-z));
fn = zr .* ((-K)*z - D*zd);
f = max( 0, fn );		% contact, so return the normal force now

fex = f_extFcn(x);

for i = 1:length( model.gc.body )
    n = model.gc.body(i);
    fex{n} = fex{n} + Fpt([0;0;f(i)],posvel(1:3,i));
end

end
