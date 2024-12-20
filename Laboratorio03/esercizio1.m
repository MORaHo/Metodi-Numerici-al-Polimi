%% Sistema, 1 e 2
n = 50;
A = diag(4*ones(n,1))-diag(ones(n-1,1),-1)-diag(ones(n-2,1),-2) - diag(ones(n-1,1),1) - diag(ones(n-2,1),2);
x0 = zeros(n,1);
tol = 1e-5;
nmax = 1e5;
P = diag(ones(n,1));
b = 0.2*ones(n,1);

[x,k_lim] = gradiente_tocomplete(A,b,P,x0,tol,nmax);
xex = A\b;

e = zeros(nmax,1);
e_GC = zeros(nmax,1);
r = zeros(nmax,1);
r_GC = zeros(nmax,1);
for ii = 1:k_lim
    [x,k] = gradiente_tocomplete(A,b,P,x0,tol,ii);
    e(ii) = norm(xex-x)/norm(xex);
    r(ii) = norm(b-A*x)/norm(b);
end

semilogy(e)
hold on
semilogy(r)
hold off

%%%% comment a piu` iterazione, giustamente l'errore e il residuo stanno diminuendo. Visto che sono lineari, possiamo confonderli e il residuo pero ` puo esser trattato come l'errore, e` la ragione per cui lo usiamo come stimatore.


%% 3
for ii = 1:18
    x_pcg = pcg(A,b,tol,ii,P);
    e_GC(ii) = norm(xex-x_pcg)/norm(xex);
    r_GC(ii) = norm(b-A*x_pcg)/norm(b);
end

semilogy(e_GC)
hold on
semilogy(r_GC)
%%$$$$ commento, si arriva in convergenza molto prima, il residuo sta sopra
%%l'errore. Confonendo l'errore e il residuo non si fa tanto errore.


%% 4

iter = [16,32,64,128,256];
ks = [];
k_pcg = [];
for jj = iter
    n = jj;
    A = diag(4*ones(n,1))-diag(ones(n-1,1),-1)-diag(ones(n-2,1),-2) - diag(ones(n-1,1),1) - diag(ones(n-2,1),2);
    x0 = zeros(n,1);
    tol = 1e-5;
    nmax = 1e6;
    P = diag(ones(n,1));
    b = 0.2*ones(n,1);
    [~,k] = gradiente_tocomplete(A,b,P,x0,tol,nmax);
    ks = [ks,k];
    [x,~,~,k] = pcg(A,b,tol,nmax,P);
    k_pcg = [k_pcg,k];
end

loglog(iter,ks)
figure();
loglog(iter,k_pcg)

%%%% all aumentare la dimensione del sistema, aumenta il numero di
%%%% iterazioni, fa senso. Il generale non condizionato aumenta piu`
%%%% velocemente perche` ha piu` difficolta` ad adattarsi. Questo ci
%%%% testimonia la relazione tra il gradiente e il condizionamente e il
%%%% gradiente coniugato e la radice del numero di condizionamento.

%%%% Tutto quello che e` exponenziale e` lineare in log log, se vediamo due
%%%% rette lineari allora, avranno relazione tra loro.
%% 5
n = 50;
A = diag(4*ones(n,1))-diag(ones(n-1,1),-1)-diag(ones(n-2,1),-2) - diag(ones(n-1,1),1) - diag(ones(n-2,1),2);
x0 = zeros(n,1);
tol = 1e-5;
nmax = 1e5;
P = diag(2*ones(n,1))- diag(ones(n-1,1),-1)-diag(ones(n-1,1),1);
b = 0.2*ones(n,1);

[x,k_lim] = gradiente_tocomplete(A,b,P,x0,tol,nmax);
xex = A\b;

e = zeros(nmax,1);
e_GC = zeros(nmax,1);
r = zeros(nmax,1);
r_GC = zeros(nmax,1);
for ii = 1:k_lim
    [x,k] = gradiente_tocomplete(A,b,P,x0,tol,ii);
    e(ii) = norm(xex-x)/norm(xex);
    r(ii) = norm(b-A*x)/norm(b);
end

semilogy(e)
hold on
semilogy(r)
hold off

%%%% comment a piu` iterazione, giustamente l'errore e il residuo stanno diminuendo. Visto che sono lineari, possiamo confonderli e il residuo pero ` puo esser trattato come l'errore, e` la ragione per cui lo usiamo come stimatore.

for ii = 1:18
    x_pcg = pcg(A,b,tol,ii,P);
    e_GC(ii) = norm(xex-x_pcg)/norm(xex);
    r_GC(ii) = norm(b-A*x_pcg)/norm(b);
end

figure();
semilogy(e_GC)
hold on
semilogy(r_GC)
%%$$$$ commento, si arriva in convergenza molto prima, il residuo sta sopra
%%l'errore. Confonendo l'errore e il residuo non si fa tanto errore.


iter = [16,32,64,128,256];
ks = [];
k_pcg = [];
for jj = iter
    n = jj;
    A = diag(4*ones(n,1))-diag(ones(n-1,1),-1)-diag(ones(n-2,1),-2) - diag(ones(n-1,1),1) - diag(ones(n-2,1),2);
    x0 = zeros(n,1);
    tol = 1e-5;
    nmax = 1e6;
    P = diag(ones(n,1));
    b = 0.2*ones(n,1);
    [~,k] = gradiente_tocomplete(A,b,P,x0,tol,nmax);
    ks = [ks,k];
    [x,~,~,k] = pcg(A,b,tol,nmax,P);
    k_pcg = [k_pcg,k];
end

figure();
loglog(iter,ks)
hold on
loglog(iter,k_pcg)

%%%%% le iterazioni diminuiscono drasticamente per il non coniugato, il
%%%%% coniugato diminuisce di meno. Il condizionatore abbatte di piu` la
%%%%% convergenza che e` quello che ci aspettavamo.