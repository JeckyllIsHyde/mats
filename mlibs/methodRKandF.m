function x = methodRKandF(fun,F,params,t,x,h)
k1 = h*fun(t,x,F,params);
k2 = h*fun(t+h/2,x+1/2*k1,F,params);
k3 = h*fun(t+h/2,x+1/2*k2,F,params);
k4 = h*fun(t+h,x+k3,F,params);
x = x+1/6*(k1+2*k2+2*k3+k4);
