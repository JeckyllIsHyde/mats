function xp = dynBlock(varargin)
% DYNBLOCK Dynamics of Car Pendulum
%
%   Examples
%       xp = dynBlock(x,params);
%   or
%       xp = dynBlock(t,x,fun,params);
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

% xx = x(1);
% vx  = x(2);

A = [0,1;0,-1/M];
B = [0;1/M];
 
% Gravitational

if nargin == 2
    tau = 0;
elseif nargin == 4
    tau = fun(t);
end

% qpp = D\(tau-V-G)
xp = A*x+B*tau;

