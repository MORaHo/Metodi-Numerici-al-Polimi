 f = @(x) x.*cos(x)/2;
 d2f = @(x) -x.*cos(x)/2-sin(x)/2;

 a = -2;
 b = 6;

 xx = linspace(a,b,1000);

 plot(xx,f(xx));

 %% 2
 ns = [2,4,6];

 for n = ns
     x_nodes = linspace(a,b,n+1);
     y_nodes = f(x_nodes);
     C = polyfit(x_nodes,y_nodes,n);
     x_interp = linspace(a,b,100);
     y_interp = polyval(C,x_interp);
    
     hold on
     plot(x_interp,y_interp);
 end

% Con grado maggiore di interpolazione la interpolazione diventa sempre
% piu` affidabile per interpretare la funzione originale come inteso.

 %% 3 Errore 

figure();
title("Errore")
for n = ns
   x_nodes = linspace(a,b,n+1);
   y_nodes = f(x_nodes);
   C = polyfit(x_nodes,y_nodes,n);
   x_interp = linspace(a,b,100);
   y_interp = polyval(C,x_interp);
    
   hold on
   interp_error = abs(f(x_interp) - y_interp);
   plot(x_interp,interp_error);
   disp(max(abs(interp_error)));
end

% conferma che aumentando il grado l'errore tende a 0, vediamo che stiamo
% anche interpolando perche' l'errore ai nodi e` 0 come vediamo.

%% 4 Interpolazione a tratti ed errore 5
figure();
ns = [4,8,16,32,64];
Hs = [];
eps= [];
for n = ns
    H = (b-a)/n;
    Hs = [Hs,H];
    x_nodes = linspace(a,b,n+1);
    y_nodes = f(x_nodes);
    x_evals = linspace(a,b,100);
    Vq = interp1(x_nodes,y_nodes,x_evals);
    hold on
    plot(x_evals,f(x_evals));
    hold on
    plot(x_evals,Vq);
    epsilon = max(abs(f(x_evals) - Vq));
    eps = [eps,epsilon];
end

figure();
loglog(Hs,eps);

hold on
loglog(Hs,Hs);
loglog(Hs,Hs.*Hs)

% aumentando il numero di sottointervallo che usiamo per fare la
% interpolazione lineare aumenta la affidabilita` come inteso. Possiamo
% vedere che anche l'errore diminuisce. n=64 e` talmente fitto che e'
% confondibilie.

%vediamo che l'errore si abbatte con la 
%% 6) n=4

%