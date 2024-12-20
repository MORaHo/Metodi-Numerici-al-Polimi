% Esercizio 1
clc
clear all
close all

% TO DO LIST:
% 01) Definire dimensione del sistema
N = 50;
% 02) Assemblare matrice A
A = diag(4*ones(50,1)) - diag(ones(49,1),1) - diag(ones(48,1),2) - diag(ones(49,1),-1) - diag(ones(48,1),-2);
% 03) Assemblare vettore b e guess iniziale x0
b = ones(50,1)*0.2;
x0 = zeros(50,1);
% 04) Verifica che A sia simmetrica e che sia definita positiva, calcolo K2
disp(isequal(A',A)) %simmetrica
disp(isequal(abs(eig(A)),eig(A))); %definita positiva
k2 = cond(A);
% 05) Implementazione su function (ALTRO FILE) di metodo di Richardson
%penso di averlo implementato bene
% 06) Verifica teorica della convergenza del metodo con raggio spettrale
P = eye(50);
%alpha = 2/(max(eig(A))+min(eig(A)));
alpha = 0.2;
B = eye(50) - alpha*A;
rho_B = max(eig(B));
disp(rho_B <1)
nmax = 10000;
tol = 1e-6;
% 07) Risoluzione del sistema con parametri dati (utilizzo funzione
% Richardson)
%%%%%%Ottimale
[x,k] = richardson_tocomplete(A,b,P,x0,tol,nmax,alpha);
% 08) Verifica teorica della convergenza del metodo con raggio spettrale
D = diag(diag(A));
B_J = eye(50) - D\A; %%%%%%% vedi dopo come fare questo senza fare inv.
disp(max(eig(B_J)))
% 09) Risoluzione del sistema con parametri di Jacobi (utilizzo funzione
% Richardson)
alpha_J = 1;
[x_J,k_J] = richardson_tocomplete(A,b,D,x0,tol,nmax,alpha_J);
% 10) Verifica teorica della convergenza del metodo con raggio spettrale
E = -tril(A)+D;
B_GS = eye(50) - (tril(A)\A);
% 11) Risoluzione del sistema con parametri di Gauss-Seidel (utilizzo funzione
% Richardson)
alpha_GS = 1;
[x_GS,k_GS] = richardson_tocomplete(A,b,tril(A),x0,tol,nmax,alpha_GS);

% 12) Verifica teorica della convergenza del metodo con raggio spettrale
P = diag(ones(50,1)*2) - diag(ones(49,1),-1) - diag(ones(49,1),1);
disp(isequal(abs(eig(P)),eig(P)))
alpha_opt = 2/(max(eig(P\A))+min(eig(P\A)));
B_P = eye(50) - alpha*(P\A); %%%% sempre B = I - alpha * P^-1 * A, che in matlab sara` B = I - alpha*(P\A)
eig_B = max(abs(eig(B_P)));
% 13) Risoluzione del sistema con parametri dati e precondizionatore (utilizzo funzione
% Richardson)
[x_B,k_B] = richardson_tocomplete(A,b,P,x0,tol,nmax,alpha_opt);



%%% controlla valori di abbattimento





%%%%%%%%%%%% Esercizio 2

n = 120;
d0 = 5*ones(n,1);
d1 = -2*ones(n-2,1);
A = diag(d0)+ diag(d1,2) + diag(d1,-2);

xex = ones(n,1);
b = A*xex;
x0 = zeros(n,1);
nmax = 300;
tol = 1e-4;

D = diag(diag(A));
B_J2 = eye(n) - D\A;
disp(max(eig(B_J2)));
[x_J2,k_J2] = richardson_tocomplete(A,b,D,x0,tol,nmax,alpha_J);


%% sdfs




%%
