% Esercizio 2

clc
clear all
close all

% TO DO LIST:
% 01) Implementazione su function (ALTRO FILE) di algoritmo di Thomas
% 02) Definire dimensione del sistema
N = 1000;
% 03) Assemblare matrice A
A1 = diag(ones(N-1,1),1);
A3 = diag(ones(N-1,1),-1);
v2 = ones(N,1)*2;
A = diag(v2) - A1 - A3;

% 04) Assemblare vettore b
b = ones(N,1);
% 05) Calcolo soluzione x
[L,U,x] = thomas_tocomplete(A,b);
