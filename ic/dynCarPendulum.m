function xp = dynCarPendulum(varargin)
% DYNCARPENDULUM Dynamics of Car Pendulum
%
%   Examples
%       xp = dynCarPendulum(x,params);
%   or
%       xp = dynCarPendulum(t,x,fun,params);
%

if nargin == 2
    x = varargin{1};
    params = varargin{2};
elseif nargin == 4
    t = varargin{1};
    x = varargin{2};
    fun = varargin{3};
    params = varargin{4};
else
    error('bad number of input arguments')
end

M = params.M;
m = params.m;
l = params.l;

xx = x(1);
vx  = x(2);
th = x(3);
w  = x(4);

g = 9.81;

% D(q)*qpp+V(qp,q)+G(q)=u(t)

% Masses and inertias
D = [M+m,-l*m*cos(th);-l*m*cos(th),m*l^2];

% Centripetal and coriolis
V = [m*l*w^2*sin(th);0];
 
% Gravitational
G = -[0;m*l*g*sin(th)];

if nargin == 2
    tau = [0;0];
elseif nargin == 4
    tau = fun(t);
end

% qpp = D\(tau-V-G)
wp = D\(tau-V-G);

xp = [x(2);% velocidad 1
      wp(1);% aceleracion 1
      x(4);% velocidad
      wp(2);% aceleracion
      ];
