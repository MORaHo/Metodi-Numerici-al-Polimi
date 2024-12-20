n = 10:10:100;
k_NP = zeros(10,1);
k_P = zeros(10,1);
iter = 1;
for ii = n
    A = gallery('wathen',ii,ii);
    size_A = size(A);
    b = ones(max(size_A),1);
    %disp("Non precondizionato")
    [x,~,~,k] = pcg(A,b,1e-6,1e6);
    k_NP(iter) = k;
    P = diag(diag(A));
    %disp("Jacobi:")
    [x,~,~,k] = pcg(A,b,1e-6,1e6,P);
    k_P(iter) = k;
    iter = iter + 1;
end

plot(k_NP)
%%%% per n che aumenta il numero di iterazioni aumenta con se
hold on
k_P;
plot(k_P)
%%%% usando il precodizionatore ci permette di migliora il numero di
%%%% iterazoni. E` costante anche quando aumenta la dimensione del sistema,
%%%% e` un puo` precondizionatore.


%%%% commentare se si puo` usare il gradiente se e` sdp, che dobbiamo
%%%% commentare, non lo abbiamo fatto oggi
%%%%% commentare il codice aiuta