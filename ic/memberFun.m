function mu = memberFun( x,params )
% MEMBERFUN

a=params.a;
b=params.b;
c=params.c;
d=params.d;

if x<a || x>d
    mu=0;
elseif x>=a && x<b
    mu = (x-a)/(b-a);
elseif a==b && x==a
    mu = 1;
elseif x>=b && x<c
    mu = 1;
elseif x>=c && x<d
    mu = (d-x)/(d-c);
elseif c==d && x==c
    mu = 1;
elseif d==x
    mu = 0;
else
    disp('invalid x for mu');
    mu = -1;
end

