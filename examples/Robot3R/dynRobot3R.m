function xp = dynRobot3R(varargin)
% DYNROBOT3D Dynamics of 3D robot
%
%   Examples
%       xp = dynRobot3D(x,params);
%   or
%       xp = dynRobot3D(t,x,fun,params);
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

m1 = params.m1;
m2 = params.m2;
m3 = params.m3;
L1 = params.L1;
L2 = params.L2;
L3 = params.L3;
th1 = x(1);
w1  = x(2);
th2 = x(3);
w2  = x(4);
th3 = x(5);
w3  = x(6);
g = 9.81;

I1 = m1/12*L1^2;
I2 = m2/12*L2^2;
I3 = m3/12*L3^2;
Lc1 = L1/2;
Lc2 = L2/2;
Lc3 = L3/2;

s2 = sin(th2);s3 = sin(th3);
s23 = sin(th2+th3);
c1 = cos(th1);c2 = cos(th2);c3 = cos(th3);
c12 = cos(th1+th2);c23 = cos(th2+th3);
c123 = cos(th1+th2+th3);

% Masses and inertias
M = zeros(3,3);
M(1,1) = I1+I2+I3+L1^2*m2+L1^2*m3+L2^2*m3+Lc1^2*m1+Lc2^2*m2+Lc3^2*m3+L1*Lc3*m3*c23*2.0+L1*L2*m3*c2*2.0+L1*Lc2*m2*c2*2.0+L2*Lc3*m3*c3*2.0;
M(1,2) = I2+I3+L2^2*m3+Lc2^2*m2+Lc3^2*m3+L1*Lc3*m3*c23+L1*L2*m3*c2+L1*Lc2*m2*c2+L2*Lc3*m3*c3*2.0;
M(1,3) = I3+Lc3^2*m3+L1*Lc3*m3*c23+L2*Lc3*m3*c3;
M(2,1) = I2+I3+L2^2*m3+Lc2^2*m2+Lc3^2*m3+L1*Lc3*m3*c23+L1*L2*m3*c2+L1*Lc2*m2*c2+L2*Lc3*m3*c3*2.0;
M(2,2) = I2+I3+L2^2*m3+Lc2^2*m2+Lc3^2*m3+L2*Lc3*m3*c3*2.0;
M(2,3) = I3+Lc3^2*m3+L2*Lc3*m3*c3;
M(3,1) = I3+Lc3^2*m3+L1*Lc3*m3*c23+L2*Lc3*m3*c3;
M(3,2) = I3+Lc3^2*m3+L2*Lc3*m3*c3;
M(3,3) = I3+Lc3^2*m3;

% Centripetal and coriolis
V = zeros(3,1);
V(1,1) = -L1*w2^2*(L2*m3*s2+Lc2*m2*s2+Lc3*m3*s23)-Lc3*m3*w3^2*(L1*s23+L2*s3)-L1*w1*w2*(L2*m3*s2+Lc2*m2*s2+Lc3*m3*s23)*2.0-Lc3*m3*w1*w3*(L1*s23+L2*s3)*2.0-Lc3*m3*w2*w3*(L1*s23+L2*s3)*2.0;
V(2,1) = L1*L2*m3*w1^2*s2+L1*Lc2*m2*w1^2*s2-L2*Lc3*m3*w3^2*s3+L1*Lc3*m3*w1^2*s23-L2*Lc3*m3*w1*w3*s3*2.0-L2*Lc3*m3*w2*w3*s3*2.0;
V(3,1) = Lc3*m3*(L1*w1^2*s23+L2*w1^2*s3+L2*w2^2*s3+L2*w1*w2*s3*2.0);
 
% Gravitational
G = zeros(3,1);
G(1,1) = g*(Lc3*m3*c123+L2*m3*c12+Lc2*m2*c12+L1*m2*c1+L1*m3*c1+Lc1*m1*c1);
G(2,1) = g*(Lc3*m3*c123+L2*m3*c12+Lc2*m2*c12);
G(3,1) = Lc3*g*m3*c123;

if nargin == 2
    tau = [0;0;0];
elseif nargin == 4
    tau = fun(t);
end

% M*wp + V + G = tau
wp = M\(tau-V-G);

xp = [x(2);% velocidad 1
      wp(1);% aceleracion 1
      x(4);% velocidad
      wp(2);% aceleracion
      x(6);% velocidad
      wp(3);% aceleracion
      ];
