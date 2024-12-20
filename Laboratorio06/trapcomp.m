function [I] = trapcomp(a,b,N,fun)

h = abs((b-a)/N);

xx = [a+h:h:b-h];

I = h * (0.5*fun(a)+sum(fun(xx))+0.5*fun(b));

end