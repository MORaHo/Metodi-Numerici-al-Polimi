%%% Homework 3

%% 1

F = @(x) [x(1)^2 + x(2)^2 - 1; sin(x(1)*pi/2)+x(2)^3];

JF = @(x) [2*x(1), 2*x(2); cos(x(1)*pi/2)*pi/2 ,3*x(2)^2];

%% 2 

x0 = [1;1];
tol = 1e-5;
nmax = 10;

[x,R,iter] = newtonsys(F,JF,x0,tol,nmax);

