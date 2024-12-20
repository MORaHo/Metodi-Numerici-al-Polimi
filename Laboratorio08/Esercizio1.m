clear all
clc

y = @(t) 1/2*asin((exp(4*t)-1)./(exp(4*t)+1));
f = @(t,y) cos(2*y);
df = @(t,y) -2*sin(2*y);
y0 = 0;
a = 0;
b = 6;
t = linspace(a,b,1000);
plot(t,y(t))


%% 2
% Fatto

%% 3
h = 0.5;
[~,u_h_a] = eulero_avanti(f,b,y0,h);
[~,u_h_i,~] = eulero_indietro(f,df,b,y0,h);
[~,u_h_cn,~] = crank_nicolson(f,df,b,y0,h);
[t_h,u_h_h] = heun(f,b,y0,h);
[~,ip,~] = eulero_indietro_ptofis(f,b,y0,h);
[~,cnp,~] = crank_nicolson_ptofis(f,b,y0,h);


hold on

plot(t_h,u_h_a);
plot(t_h,u_h_i);
plot(t_h,u_h_cn);
plot(t_h,u_h_h);
plot(t_h,ip);
plot(t_h,cnp);

legend("Actual","Avanti","Indietro","Crank","Heun","Indietro_P","Crank_P")

hs = [0.4,0.2,0.1,0.05,0.025,0.0125];

avanti = [];
indietro = [];
crank = [];
heun_err = [];
indietro_ptfis = [];
crank_ptfis = [];
rk23 = [];
for ht = hs
    [~,a] = eulero_avanti(f,b,y0,ht);
    [~,i,~] = eulero_indietro(f,df,b,y0,ht);
    [~,cn,~] = crank_nicolson(f,df,b,y0,ht);
    [t_h,h] = heun(f,b,y0,ht);
    [~,ip,~] = eulero_indietro_ptofis(f,b,y0,ht);
    [~,cnp,~] = crank_nicolson_ptofis(f,b,y0,ht);
    [~,rk,~] = ode23(f,[0,6],y0);
    y_th = y(t_h)';
    avanti = [avanti,max(abs(y_th-a))];
    indietro = [indietro,max(abs(y_th-i))];
    crank = [crank,max(abs(y_th-cn))];
    heun_err = [heun_err,max(abs(y_th-h))];
    indietro_ptfis = [indietro_ptfis,max(abs(y_th-ip))];
    crank_ptfis = [crank_ptfis,max(abs(y_th-cnp))];
    rk23 = [rk23,max(y_th(end)-rk(end))];
end
figure();
loglog(hs,avanti)
hold on
loglog(hs,indietro)
loglog(hs,crank)
loglog(hs,heun_err);
loglog(hs,indietro_ptfis);
loglog(hs,crank_ptfis);
loglog(hs,rk23);
loglog(hs,hs);
loglog(hs,hs.^2);
legend("Avanti","Indietro","Crank-Nicolson","Heun","Ptofis-Indietro","Crank-Ptofis","Ordine 1","Ordine 2")









