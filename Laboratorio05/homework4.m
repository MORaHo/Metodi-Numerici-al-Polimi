f = @(x) (9-(x-3).^2).*cos(4*x);

a = 2;
b = 4;
xx= linspace(a,b,1000);
plot(xx,f(xx));
n = 10;

x_nodes = linspace(a,b,n+1);
y_nodes = f(x_nodes);
C = polyfit(x_nodes,y_nodes);
y_eval  = polyval(C,xx);
hold on
plot(xx,y_eval);



