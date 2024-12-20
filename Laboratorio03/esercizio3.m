n=80;
d0 = 2*ones(n,1);
d1 = -1*ones(n-1,1);
A = diag(d0)+diag(d1,-1) + diag(d1,1);

xex = ones(n,1);
b = A*xex;
P = eye(n,n);
x0 = zeros(n,1);
[x,k] = gradiente_tocomplete(A,b,P,x0,1e-5,150);
x = pcg(A,b,1e-6,10000,P);

% 1 non saprei perche' no, e` una matrice simmetrica definita positiva, in
% metodo del gradiente richiede una matrice sdp per trovare l'alfa_k

% 2, 4 e 5, possiamo vedere dall'applicazione che sono veri

% 3 e` l'unico vero.