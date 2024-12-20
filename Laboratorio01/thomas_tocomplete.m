function [L, U, x] = thomas_tocomplete(A, b)
    % [L, U, x] = thomas (A, b)
    % 
    % Calcola la fattorizzazione di Thomas della matrice A e risolve il sistema
    % Ax = b
    % 
    % Parametri in ingresso:
    %   - A: matrice tridiagonale quadrata
    %   - b: vettore dei termini noti
    % 
    % Parametri in uscita:
    %   - L: la matrice triangolare inferiore della fattorizzazione LU di A
    %   - U: la matrice triangolare superiore della fattorizzazione LU di A
    %   - x: la soluzione del sistema Ax = b 

    % INIZIALIZZAZIONE
    n = length(b);
    alpha = zeros(n, 1);
    delta = zeros(n - 1, 1);
      
    % Estrazione diagonali
    a = diag(A);
    c = diag(A,1);
    e = diag(A,-1);
    
    % Calcolo coefficienti di Thoma
    alpha(1) = a(1);
    for ii = 2:n
        delta(ii - 1) = e(ii-1)/alpha(ii-1);
        alpha(ii) = a(ii) - delta(ii-1)*c(ii-1);
    end

    % Ricostruzione matrici L e U
     L = eye(n) + diag(delta,-1);
     U = diag(alpha) + diag(c,1);
    
    % SOLUZIONE DEL SISTEMA

    % Sostituzioni in avanti
    y = zeros(n, 1);
    y(1) = b(1);
    for ii = 2:n
        y(ii) = b(ii)-delta(ii-1)*y(ii-1);
    end
    
    % Sostituzioni all'indietro
    x = zeros(n, 1);
    x(n) = y(n)/alpha(n);
    for ii = n-1:-1:1
        x(ii) = (y(ii)-c(ii)*x(ii+1))/alpha(ii);
    end
    
end