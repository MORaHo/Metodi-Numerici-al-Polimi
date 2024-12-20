% Metodo punto fisso abaco di Moody
clear all; close all;

%Re = 1e5;
N = 30;
Res = logspace(4,8,N);
rDs = [1e-6,1e-5,1e-4,5e-4,1e-3,5e-3,1e-2];
M = length(rDs);
phi =@(lamb,Re,rD) (-2*log10(2.51/(Re*sqrt(lamb)) + rD/3.71))^(-2);

LAMS = zeros(N,M);
for k=1:M
    rD = rDs(k);
    lam0 = (-2*log10(rD/3.71))^(-2);
    for j=1:N
        Re = Res(j);
        diff = 1;
        lam_old = lam0;
        while diff>1e-8
            lam = phi(lam_old,Re,rD);
            diff = abs(lam-lam_old);
            lam_old = lam;
            lam;
        end
        LAMS(j,k)=lam;
    end
end
loglog(Res,LAMS)
grid on
