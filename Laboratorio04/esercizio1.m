A = 0.1;
phi = @(x) x + A*(cos(2*x).^2-x.^2);
nmax = 200;
x0 = .1;
toll = 1e-10;
a = 0;
b = 1;

%% 3
[xvect_1,it]=ptofis(x0,phi,nmax,toll,a,b);

%% 4
max_iter = 6;
[xi,x_iter] = bisection(phi,a,b,max_iter);
[xvect_2,it] = ptofis(xi,phi,nmax,toll,a,b);

%% 5
df = @(x) -4*cos(2*x).*sin(2*x)-2*x;
dfa = df(xvect_1(end));
A_sup = -2/df(xvect_1(end));
A_var = 0.05:0.05:A_sup;
ps = [];
for A = A_var
    phi_p = @(x) x + A*(cos(2*x).^2-x.^2);
    [xvect,it] = ptofis(xi,phi_p,nmax,toll,a,b);
    [p,c]=stimap(xvect);
    ps = [ps,p];
end
figure();
plot(A_var,ps)

%% 6

% per avere convergenza p>1, serve che la prima servita di phi si annulli,
% percio' dobbiamo trovare il valore A per cui questo succede e applicarlo
A_opt = -1/dfa; %A che cancella phi
phi_p = @(x) x + A_opt*(cos(2*x).^2-x.^2);
[xvect,it] = ptofis(x0,phi_p,nmax,1e-10,a,b);
[p,c]=stimap(xvect);

%% 7
phi_N = @(x) x-(cos(2*x).^2-x.^2)./(-4*cos(2*x).*sin(2*x)-2*x);
x = 0:0.01:6;
figure();
plot(x,phi_N(x))
hold on
plot(x,x)
