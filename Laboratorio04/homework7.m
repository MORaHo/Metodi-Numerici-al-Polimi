f = @(x) x.^3 - 2*x.^2 + exp(x) - 5;
df = @(x) 3*x.^2 - 4*x + exp(x);
I = linspace(0,3,1000);
x0 = 2.75;
toll = 1e-6;
nmax = 200;

plot(I,f(I));
hold on
plot(I,df(I))

[xvect,it] = newton_tocomplete(x0,nmax,toll,f,df,1);

% La risposta e` la seconda, la molteplcita` della radice e` 1 e abbiamo
% converge in 6 iterazioni.