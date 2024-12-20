function [I] = pmedcomp(a,b,N,fun)

    h = (b-a)/N;
    xx = [(a+h/2) : h : (b-h/2)];
    I = h * sum(fun(xx));
end