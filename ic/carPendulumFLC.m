function u = carPendulumFLC(th,w)

% member functions
paramsNG = struct('a',-100,'b',-100,'c',-50,'d',-25); 
funNG = @(x) (memberFun(x,paramsNG));
paramsNP = struct('a',-50,'b',-25,'c',-25,'d',0); 
funNP = @(x) (memberFun(x,paramsNP));
paramsZ = struct('a',-25,'b',0,'c',0,'d',25); 
funZ = @(x) (memberFun(x,paramsZ));
paramsPP = struct('a',0,'b',25,'c',25,'d',50); 
funPP = @(x) (memberFun(x,paramsPP));
paramsPG = struct('a',25,'b',50,'c',100,'d',100); 
funPG = @(x) (memberFun(x,paramsPG));

% width for member function
cntr = [-75,-25,-25,-25,-25;
        -25,  0, 25,-25,  0;
        -25, 25,  0, 75, 25;
          0, 25, 25,  0, 25;
         25, 25, 25, 25, 75];

% 
muth = [funNG(th);funNP(th);funZ(th);funPP(th);funPG(th)];
muw = [funNG(w);funNP(w);funZ(w);funPP(w);funPG(w)];
infe = min(repmat(muw,1,5),repmat(muth',5,1));
u = sum(sum(infe.*cntr))/sum(sum(infe));
