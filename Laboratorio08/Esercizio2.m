y0 = 1;
f = @(t,y) -2*y;
df = @(t,y) -2;
t_max = 10;

y = y0*exp(-2*linspace(0,t_max,1000));
plot(linspace(0,t_max,1000),y)

h = 0.1;

[~,a] = eulero_avanti(f,t_max,y0,h);
[t_h,i] = eulero_indietro(f,df,t_max,y0,h);
hold on
plot(t_h,a,t_h,i);

legend("Exact","Avanti","Indietro")

h = 0.9;

figure();
[~,a] = eulero_avanti(f,t_max,y0,h);
[t_h,i] = eulero_indietro(f,df,t_max,y0,h);
hold on
plot(linspace(0,t_max,1000),y,t_h,a,t_h,i);
title("h=0.9")
legend("Exact","Avanti","Indietro")

h = 1.1;

figure();
[~,a] = eulero_avanti(f,t_max,y0,h);
[t_h,i] = eulero_indietro(f,df,t_max,y0,h);
hold on
plot(linspace(0,t_max,1000),y,t_h,a,t_h,i);
title("h=1.1")
legend("Exact","Avanti","Indietro")

% ha senso perche' eulero in avanti e` condizionalmente assolutamente
% convergente, invece eulero all'indietro e` incondizionatamente
% assolutamente convergente. La condizione su eulero avanti e` sulla
% dimensione del salto temporale, vediamo infatti che se e` troppo grande
% non converge assolutamente.