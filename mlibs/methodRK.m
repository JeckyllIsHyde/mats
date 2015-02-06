function x = methodRK(fun,x,h)
k1 = h*fun(x);
k2 = h*fun(x+1/2*k1);
k3 = h*fun(x+1/2*k2);
k4 = h*fun(x+k3);
x = x+1/6*(k1+2*k2+2*k3+k4);
