f = @(x) x.^3 - (2+exp(1))*x.^2 + (2*exp(1)+1)*x + (1-exp(1)) - cosh(x-1);
df = @(x) 3*x.^2 - (4+2*exp(1))*x + (2*exp(1)+1) +sinh(1-x);
a = 0.5;
b = 6.5;
y = [];
dy = [];
for ii = a:0.1:b
    y = [y,f(ii)];
    dy = [dy,df(ii)];
end
x = 0.5:0.1:6.5;
plot(x,y)
hold on
plot(x,dy)
grid on

%% 2

d2f = @(x) 6*x + (4*2*exp(1)) - cosh(x-1);
alpha = 1;
if abs(df(alpha)) < 1e-8
    if abs(d2f(alpha)) > 1e-8
        disp("Molteplicita` 2")
    else
        disp("Molteplcita` > 2")

    end
else
    disp("Molteplcita` 1")
end

%% 4 & 5

%ho aggiunto la bisezione perche' pensavo servisse ma mi ha causato
%problemi quindi la ho tolta, riduce il calcolo con m=2 a 3 iter quindi non
%si poteva usare stimap.
%[x1,x_iter]=bisection(f,0.7,1.25,15);
%[x2,x_iter]=bisection(f,3.4,4,15);
%[x3,x_iter]=bisection(f,6,6.5,15);
x1 = 0.5;
x2 = 3;
x3 = 6;

[x_class1,it] = newton_tocomplete(x1,100,1e-6,f,df,1); % newton classico
[p,c] = stimap(x_class1)
[x_mod,it] = newton_tocomplete(x1,100,1e-6,f,df,2); % newton modificato, m=2
[p,c] = stimap(x_mod)
[xvect,it] = newton_tocomplete(x2,100,1e-6,f,df,1); % newton classico
[xvect,it] = newton_tocomplete(x3,100,1e-6,f,df,1); % newton classico
