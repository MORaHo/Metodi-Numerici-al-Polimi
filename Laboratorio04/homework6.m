%% 1

F = @(x) [ -1/81*cos(x(1)) - x(1) + 1/9*x(2)^2 + 1/3*sin(x(3)) ; 1/3*sin(x(1)) - x(2) + 1/3*cos(x(3)) ; -1/9*cos(x(1)) + 1/3*x(2) + 1/6*sin(x(3)) - x(3) ];
JF  = @( x ) [((1/81)*sin(x(1)) - 1) , (2/9)*x(2) , (1/3)*cos(x(3)) ; (1/3)*cos(x(1)) , -1 , -(1/3)*sin(x(3)) ; (1/9)*sin(x(1)) , 1/3 , ((1/6)*cos(x(3)) -1)];
   
[x,R,iter] = newtonsys(F,JF,[1;1;1],1e-10,10)