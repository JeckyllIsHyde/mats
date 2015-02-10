function u = carPendulumSSC(x,params)

M = params.M;
m = params.m;
l = params.l;

g=9.81;

% x = [px;vx;th;w]
A = [0, 1,         0, 0;
     0, 0,     g*m/M, 0;
     0, 0,         0, 1;
     0, 0, g*(M+m)/M/l, 0];
 
B = [0;1/M;0;1/M/l];

M_ = [B A*B A^2*B A^3*B];
a = poly(A);
W = [a(4:-1:1);
     a(3:-1:1),0;
     a(2:-1:1),0,0;
     a(1:-1:1),0,0,0];

alfa = poly([-2-2*sqrt(3)*j,-2+2*sqrt(3)*j,-10,-10]);

K = ((M_*W)'\[alfa(end:-1:2)-a(end:-1:2)]')'
