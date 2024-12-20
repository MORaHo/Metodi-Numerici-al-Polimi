% Esercizio 2

Iex = -1;

%% 1
f = @(x) (x/(2*pi)).*sin(x);
a = 0;
b = 2*pi;
xx = linspace(a,b,1000);
plot(xx,f(xx));

%% 2 
I_pm = [];
I_T = [];
I_S = [];
for N = 1:20
    I_pm = [I_pm;pmedcomp(a,b,N,f)];
    I_T = [I_T;trapcomp(a,b,N,f)];
    I_S = [I_S;simpcomp(a,b,N,f)];
end
plot(I_pm);
hold on
plot(I_T);
hold on
plot(I_S);

%% 3
figure();
N = 1:20;
H = (b-a)./N;
E_pm = abs(Iex-I_pm);
loglog(H,E_pm)
hold on
E_T = abs(Iex-I_T);
loglog(H,E_T);
hold on
E_S = abs(Iex-I_S);
loglog(H,E_S)
hold on
loglog(H,H.^2);
hold on
loglog(H,H.^4)