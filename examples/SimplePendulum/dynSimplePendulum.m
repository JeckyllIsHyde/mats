function xp = dynSimplePendulum(varargin)
% DYNSIMPLEPENDULUM Dynamics of a Simple Pendulum
%
%   Examples
%       xp = dynSimplePendulum(x,params);
%   or
%       xp = dynSimplePendulum(t,x,fun,params);
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

k = params.k;
m = params.m;
l = params.l;

th = x(1);
w  = x(2);

g = 9.81;

if nargin == 2
    tau = [0;0];
elseif nargin == 4
    tau = fun(t);
end

% modelo dinamico
xp = [x(2);% velocidad 1
      -g*sin(x(1))/l-k/m*x(2)+tau/(m*l^2);% aceleracion 1
      ];
