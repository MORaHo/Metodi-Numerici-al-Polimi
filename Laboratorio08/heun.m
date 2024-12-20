function [t_h,u_h] = heun(f,t_max,y_0,h)

t_h = 0:h:t_max;
u_h = zeros(length(t_h),1);
u_h(1) = y_0;

for ii = 2:length(t_h)

    told = t_h(ii-1);
    uold = u_h(ii-1);
    tnew = t_h(ii);

    ustellato = uold + h*f(told,uold);

    unew = uold + (h/2)*(f(told,uold)+f(tnew,ustellato));

    u_h(ii) = unew;


end


    

end