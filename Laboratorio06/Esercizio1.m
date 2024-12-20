% Esercizio 1

Iex = pi*((sinh(1)+sinh(0.6))/4+0.4);

%% 1
a = 0;
b = 0.8;


f= @(x) cosh(x-0.5);
func = @(x) pi.*f(x).^2;
xx = linspace(0,0.8,1001);
plot(xx,f(xx))

%% 2
I_pm = [];
for N = 1:20
    I_pm = [I_pm;pmedcomp(a,b,N,func)];
end

%% 3
I_T = [];
for N = 1:20
    I_T = [I_T;trapcomp(a,b,N,func)];
end

%% 4 
I_S = [];
for N = 1:20
    I_S = [I_S;simpcomp(a,b,N,func)];
end
%% 5

plot(I_pm);
hold on
plot(I_T);
hold on
plot(I_S);

%% 6 

EN_pm = abs(Iex-I_pm)
EN_T = abs(Iex - I_T)
EN_S = abs(Iex-I_S)
N = 1:20;
H = (b-a)./N;
figure();
loglog(H,EN_pm);
hold on
loglog(H,EN_T);
hold on
loglog(H,EN_S);
hold on
loglog(H,H.^4)
