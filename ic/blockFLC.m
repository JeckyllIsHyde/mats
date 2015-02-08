function u = blockFLC(x,v)

xmax = 10;
x = min(xmax,x)/xmax*100;
vmax = 5;
v = min(vmax,v)/vmax*100; 

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

%               Position X
%           NG   NP    Z   PP   PG
%          ------------------------- 
%     NG || PG | PP | PP |  Z | NG |
%  V  NP || PG | PP | PP |  Z | NG |
%  e   Z || PG | PP |  Z | NP | NG |
%  l  PP || PG |  Z | NP | NP | NG |
%     PG || PG |  Z | NP | NP | NG |
%          -------------------------
% width for member function
cntr = [ 62.5,   25,   25,    0,-62.5;
         62.5,   25,   25,    0,-62.5;
         62.5,   25,    0,  -25,-62.5;
         62.5,    0,  -25,  -25,-62.5;
         62.5,    0,  -25,  -25,-62.5];

% 
mux = [funNG(x);funNP(x);funZ(x);funPP(x);funPG(x)];
muv = [funNG(v);funNP(v);funZ(v);funPP(v);funPG(v)];
infe = min(repmat(muv,1,5),repmat(mux',5,1));
u = sum(sum(infe.*cntr))/sum(sum(infe));
