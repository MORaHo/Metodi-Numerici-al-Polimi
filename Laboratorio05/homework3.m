eps = [0.00 0.06 0.14 0.25 0.31 0.47 0.60 0.70];
sigma = [0.00 0.08 0.14 0.20 0.23 0.25 0.28 0.29];

np1 = length(sigma);
n = np1-1;
%% Lagrange ordinario
C = polyfit(eps,sigma,n);
xx = linspace(0.00,0.75,1000);
y_eval = polyval(C,xx);
y = polyval(C,0.70)
plot(xx,y_eval);

hold on

y_interp = interp1(eps,sigma,xx);
y_interp070 = interp1(eps,sigma,0.70)
plot(xx,y_interp);

figure();
ns = [1 2 4];

for n = ns
  C = polyfit(eps,sigma,n);
  y_approx = polyval(C,xx);
  y = polyval(C,0.70)
  hold on
  plot(xx,y_approx);
end
