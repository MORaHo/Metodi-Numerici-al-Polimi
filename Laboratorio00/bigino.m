clear
clc

import lambda.*

text = "Questo e` un ripasso di Matlab"; %il ; significa che non stampa la cariabile nella command window

%doc e plot aiutano a trovare cosa fanno certe funzioni

% v1 = [] e` un vettore, aggiungendo ; muove alla prossima colonna, che possiamo usare per creare colonne. Length
% per trovare la sua dimensione del vettore

%[0:2:10] da un vettore con solo i numeri pari, la distanza tra iterazioni
%e` definita dal numero nel mezzo. Se non si mette cioe` [1:5], prende
%automaticamente 1

% l'oratore ' trasponde un vettore

%linspace prende l'inizio, la fine e mette quanti numeri vuoi tra i due, e
%non messo prende 1, prende sempre un passo lineare, prende
%(inizio-fine)/passi come passo, se vogliamo 100 intervalli dobbiamo
%mettere intervalli voluti+1

%norm prende la norma di un vettore

% per prende un elemento si usano () non []

%size ci sa il numero di rihe  colonne

%zeros(n,m) da una matrice con n righe e m colonne, idem per ones, eye per
%una matrice identita` (solo un parametro se quadrata)

%si puo` dire end, per prendere l'ultimo valore

%possiamo estrarre una parte della matrice facendo M(4:5,1:2), possiamo
%anche assegnargli un valore

%possiamo fare det per il determinante

%per fare la somma di tutti gli element si fa sum(sum(M))

%comando diag, estre la diagonale principale di una matrice quadrata,
%possiamo anche estrarre una qualsiasi in sopra o sotto con il parametro
%aggiuntivo, -3 per 3 sotto e 3 per 3 sopra.

%diag a cui passo un vettore, costruisce una matrice con il vettore sulla
%diagonale principale detta

% * da la moltiplicazione normale, invece .* da la moltiplicazione punto
% per punto

% mettendo . davanti ad un operatore permette di far l'operazione elemento
% per elemento, per esempio .^3 fa il cubo di ogni elemento

%tril estrae la triangolare inferiore, triu quella superiore, anche qui
%possiamo iniziare ad una certa diagonale se vogliamo.

% the funzioni elementari posso funzionar elemento per elementi in una
% matrice

%Handle function
f = @(t) 5*t.*atan(sin(t)) + 2*t;


%Grafici
xx = 0:0.001:pi;
yy = f(xx);

plot(xx,yy)
hold on %tienilo e fissalo

zz = pi:0.011:3*pi;
tt = 5*zz.*atan(sin(zz))+ 2 * zz;

plot(zz,tt,"r")


[one,two] = lambda(1,2,3);

%epsilon macchina e` il numero piu` piccolo che matlab riesce a
%considerare, la variabile e` eps(1), ogni valore minore verra riportato a
%0, per operazioni logiche questo agisce con uno 0.

%realmax e` il numero piu grande che matlab riesce a considerare

a = linspace(0,1,101);
h = 0.01;
b = 0:h:1;

length(a);
length(b);
max(a);
max(b);

plot(abs(a-b),a) %veidamo allora che vettori creati in metodi diversi posso fare valori diversi, minimamente

%usando numero molto piccoli, matlab fa approssimazioni, che poi usiamo per
%fare orazioni, le approssimazioni peggiorano, che ci causa di avere
%problemi.


