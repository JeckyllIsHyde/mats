clear,clc
%% 3D Vectors, Spatial Vectors and Transforms
%% 3D vectors
% /--
%   /3D--
%       /rq.m
%       /rqd.m
%       /rv.m
%       /rx.m
%       /ry.m
%       /rz.m
%       /skew.m
%% cross product vx = SKEW(v) OR v = SKEW(vx)
i = [1;0;0];j = [0;1;0];k = [0;0;1];
ix = skew(i)
jx = skew(j)
kx = skew(k)
%%
clc
v = 3*i+2*j+4*k
vx = skew(v)
skew(vx)
%% rotation matrices R_x = rx(th), R_y = ry(th), R_z = rz(th)
% R^i_l(i) := how see P son i if parent l(i) see P^l(i)
clc
th = 30*pi/180;
R_x = rx(th)
R_y = ry(th)
R_z = rz(th)
%% R_v = RV(v) OR v = RV(R_v): with th = norm(v)
clc
norm(v)
R_v = rv(v)
v_ = rv(R_v) % magnitud between [0,pi]
norm(v_)
2*pi-norm(v)
%% from quaternions: R_q = rq(q) OR q = rq(R_q)
clc
q = [cos(norm(v)/2);sin(norm(v)/2)*v/norm(v)]
R_q = rq(q)
q_ = rq(R_q)
%% derivative of a unit quaternion: qd = rqd(wA,q) OR qd = rqd(q,wB)
% 1) q represent a matrix RAB Frame B relative to Frame A
%
% wA = [1;0;0]
% qd = rqd(wA,q)
