f = @(x) 1./(1 + x.^2);

a = -5;
b = 5;

ns = [5 10];

xx = linspace(a,b,1000);
plot(xx,f(xx));
title("Interpolazione lagrange, nodi equispaziati")

for n = ns
    x_nodes = linspace(a,b,n+1);
    y_nodes = f(x_nodes);
    x_eval = linspace(a,b,1000);
    C = polyfit(x_nodes,y_nodes,n);
    y_eval = polyval(C,x_eval);
    hold on
    plot(x_eval,y_eval)
end

% si vede che on piu` gradi la interpolazione al centro e` migliora ma ai
% lati inzia ad oscillare.

figure();
title("Errore di interpolazione lagrange, nodi equispaziati")
for n = ns
    x_nodes = linspace(a,b,n+1);
    y_nodes = f(x_nodes);
    x_eval = linspace(a,b,1000);
    C = polyfit(x_nodes,y_nodes,n);
    y_eval = polyval(C,x_eval);
    hold on
    error = abs(f(x_eval)-y_eval);
    plot(x_eval,error)
end

%% 2 Chebyshev + error

figure();
xx = linspace(a,b,1000);
plot(xx,f(xx));
title("Interpolazione lagrange, con nodi di Chebyshev")

for n = ns
    ii = 0:n; %gia` n+1 perche' c'e` gia lo 0.
    xi = -cos((pi*ii)/n);
    x_cheb = (b+a)/2 + ((b-a)/2) .* xi;
    %x_nodes = linspace(a,b,n+1);
    y_cheb = f(x_cheb);
    x_eval = linspace(a,b,1000);
    C = polyfit(x_cheb,y_cheb,n);
    y_eval = polyval(C,x_eval);
    hold on
    plot(x_eval,y_eval);
end

figure();
title("Errore Interpolazione Lagrange, con nodi di Chebyshev")
for n = ns
  ii = 0:n; %n+1 nodi
  xi = -cos((pi*ii)/n);
  x_cheb = (b+a)/2 + ((b-a)/2) .* xi;
  y_cheb = f(x_cheb);
  x_eval = linspace(a,b,1000);

  C = polyfit(x_cheb,y_cheb,n);
  y_eval = polyval(C,x_eval);
  err = abs(f(x_eval) - y_eval);
  hold on
  plot(x_eval,err);
  
end


for n = ns
  figure();
  ii = 0:n;
  x_nodes = linspace(a,b,n+1);
  y_nodes = f(x_nodes);
  x_eval = linspace(a,b,1000);
  C = polyfit(x_nodes,y_nodes,n);
  y_eval = polyval(C,x_eval);
  plot(x_eval,y_eval);
  hold on
  err = abs(f(x_eval)-y_eval);
  plot(x_eval,err)
  title("n="+n+", nodi equispaziati, interpolazione ed errore")
  figure();
  ii = 0:n;
  xi = -cos((pi*ii)/n);
  x_cheb = (b+a)/2 + ((b-a)/2) .* xi;
  y_cheb = f(x_cheb);
  x_eval = linspace(a,b,1000);

  C = polyfit(x_cheb,y_cheb,n);
  y_eval = polyval(C,x_eval);
  err = abs(f(x_eval) - y_eval);
  plot(x_eval,y_eval);
  hold on
  plot(x_eval,err);
  title("n="+n+", nodi di Chebyshev, interpolazione ed errore")

end









