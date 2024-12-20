% Esercizio 1
clc
clear all
close all



% TO DO LIST:
% 01) Definire dimensione del sistema
N = 50;
% 02) Assemblare matrice A
A = eye(N,N)*3;

v1 = ones(49,1)*-1;
A1 = diag(v1,-1);

v3 = ones(48,1)*-0.5;
A3 = diag(v3,2);
A(1,1) = 0.01;

A = A+A1+A3;

% 03) Assemblare vettore b
x = ones(N,1);
b = A*x;
% 04) Verifica condizioni sufficienti per LU
not_passed = 0;
for n = 1:N-1
    if det(A(1:n,1:n)) == 0
        not_passed = 1;
        break
    end
end

if not_passed == 1
    error("Not satisfying necessary and sufficient conditions")
else
    disp("Passed")
end
% 05) Verifica condizione necessaria e sufficiente per LU
% 06) Calcolo fattorizzazione
[L,U,P] = lu(A);
% 07) Controllo pivoting
I = eye(N,N);
if isequal(P,I)
    disp("No pivoting")
    %possiamo usare spy(P) per vedere la forma della matrice P, se non e`
    %tutta su una diagonale allora c'e` stato pivoting, da anche il numero
    %di non-zeri per determinare se la matrice e` sparsa.
else
    disp("Pivoted")
end
% 08) Implementazione su function (ALTRO FILE) di sostituzioni in avanti
% 09) Implementazione su function (ALTRO FILE) di sostituzioni all'indietro
% 10) Calcolo soluzione x
y_LU = fwsub_tocomplete(L,P*b); %visto che c'e` stato pivoting dobbiamo considerare il pivoting
x_LU = bksub_tocomplete(U,y_LU);
% 11) Calcolo errori
error = x-x_LU;

