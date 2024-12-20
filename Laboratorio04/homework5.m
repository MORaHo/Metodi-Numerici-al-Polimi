f = @(x) atan(7*(x-pi/2)) + sin((x-pi/2).^3);
df = @(x) (7./(1+(7*(x-pi/2)).^2))+cos((x-pi/2).^3).*3.*(x-pi/2).^2;
x = -1:0.01:6;

grid on
plot(x,f(x))
hold on
plot(x,df(x))
hold on


%% base
toll = 1e-10;
alfa_ex = pi/2;

%% x = 1.5
x0 = 1.5;
[xvect,it] = newton_tocomplete(x0,nmax,toll,f,df,1);
err = norm(alfa_ex-xvect(end));

%l'errore e` quasi nullo, avendo iniziato vicino al punto fisso, quindi
%sappiamo che se la funzione phi e` favorevole convergenera`, e infatti
%lo fa.

[p,c] = stimap(xvect);  % ordine di convergenza e` 3, siamo sicuri che sia almeno > 1
% perche' la derivata di primo ordine e` nulla ad alfa, se cercassimo la
% seconda e terza derivata troveremmo che la seconda si annullerebbe anche
% lei e la terza sarebbe non nulla.

%% x = 4
x0 = 4;
[xvect,it] = newton_tocomplete(x0,nmax,toll,f,df,1);
err = norm(alfa_ex-xvect(end));

% ho deciso non fare la stime della convergenza visto che sarebbe inutile
% dato che questo guess iniziale non porta alla convergenza al punto fisso.

% in questo caso l'errore e` molto perche' per quanto la funzione phi sia
% favorevole e ci permette di trovare il punto fisso, la convergenza al
% punto fisso e un fenomeno locale, x = 4 non e vicino a x0 quindi non e
% garantito che converga e infatti non converge.
