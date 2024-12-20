function [I] = simpcomp(a,b,N,fun)
    h = abs((b-a)/N);
    xpari = a+h:h:b-h;
    xdisp = a+h/2:h:b-h/2;
    I  = h/6 * (fun(a) + 2*sum(fun(xpari))+4*sum(fun(xdisp))+fun(b));
end