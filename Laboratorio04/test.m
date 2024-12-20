f = @(x) cos(x/5).*log(x-3.5);

a = 4 ;
b = 7;
max_iter = 200;

[x,i] = bisection(f,a,b,max_iter,1e-6);
i
