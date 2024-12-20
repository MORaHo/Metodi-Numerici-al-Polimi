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

