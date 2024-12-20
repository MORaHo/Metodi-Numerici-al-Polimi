function [x,R,iter]=newtonsys(F,JF,x0,tol,nmax)
%
% [xvect,it]=newton(x0,nmax,toll,fun,dfun,mol) 
%
% Metodo di Newton per la ricerca degli zeri della
% funzione fun. Test d'arresto basato sul controllo
% della differenza tra due iterate successive.
%
% Parametri di ingresso:
%
% x0         Punto di partenza
% nmax       Numero massimo di iterazioni
% tol       Tolleranza sul test d'arresto
% F JF   anonymous functions contenenti la funzione e la sua jacobiana
%
% Parametri di uscita:
%
% x      Vett. contenente tutte le iterate calcolate
%            (l'ultima componente e' la soluzione)
% iter         Iterazioni effettuate



err = tol + 1;
iter = 0;
x = x0;

while (iter<nmax && err>tol)
    jf = JF(x);
    f = F(x);
    delta = jf\f;
    x = x - delta;
    err = norm(delta);
    iter = iter+1;
end
R = norm(F(x));

if (iter < nmax)
    fprintf(' Convergenza al passo k : %d \n',iter);
else
    fprintf(' E` stato raggiunto il numero massimo di passi k : %d \n',iter);
end
