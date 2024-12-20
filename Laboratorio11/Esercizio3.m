L = 1;
mu = 1;
sigma = 1;
f = @(x) ((pi^2+4)/4) * sin((pi/2)*x);
u_ex = @(x) sin(pi*x/2);
h = 1/4;
[K,M,f_n,x_n] = diffusionereazione_DirichletNeumann(L,h,mu,sigma,f);
u = (K+M)\f_n; %se abbiamo il solo termine di diffusione e non quello di reazione possiamo usare lo stesso metodo solo usando K e ignorando M, questo vale se le condizioni al bordo rimangono miste come in questo problema.
u_n = [0;u];

figure();
plot(x_n,u_n);
hold on
plot(x_n,u_ex(x_n))
