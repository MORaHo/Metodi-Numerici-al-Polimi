L = 1;
mu = 1;
f = @(x) -(pi^2)*sin(pi*x);

h = 1/4;

[A,f_n,x_n] = diffusione_Dirichlet(L,h,mu,f);

u = A\f_n;
u_h = [0;u;0];

u_ex = @(x) -sin(pi*x);

figure();
plot(x_n,u_h)
hold on
u_n = u_ex(x_n);
plot(x_n,u_n)

figure();

q = 20:10:100;
H = 1./q;

n = [];
for h = H
    [A,f_n,x_n] = diffusione_Dirichlet(L,h,mu,f);
    u = A\f_n;
    u_n = [0;u;0];
    err = @(x) (u_ex(x) - interp1(x_n,u_n,x)).^2;
    norm = sqrt(simpcomp(0,L,1000,err));
    n = [n;norm];
end

loglog(H,n)
hold on
loglog(H,H.^2)



