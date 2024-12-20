f = @(t,y) 7*(y).^2 .* t.^3;
df = @(t,y) 14*
y0 = 1;
y_exp = @(x) -4./(7*(x.^4) -4);


h = 4/256;

figure();
t = linspace(0,0.5,1000);
plot(t,y_exp(t));

[t_h,cn,iters] = crank_nicolson(f,)




h = 4/64;

figure();
t = linspace(0,0.5,1000);
plot(t,y_exp(t));