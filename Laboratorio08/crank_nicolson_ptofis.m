function [t_h,u_h,iter_ptofis] = crank_nicolson_ptofis(f,t_max,y_0,h)
    
    t_h = 0:h:t_max;
    u_h = zeros(length(t_h),1);
    u_h(1) = y_0;
    iter_ptofis = zeros(length(t_h),1);

    nmax = 100;
    toll = 1e-12;

    for ii = 2:length(t_h)
        
        told = t_h(ii-1);
        tnew = t_h(ii);
        uold = u_h(ii-1);

        phi = @(X) uold + (h/2)*(f(told,uold)+f(tnew,X));
        x0 = uold;
        
        [xvect,it] = ptofis(x0,phi,nmax,toll);

        iter_ptofis(ii) = it;
        unew = xvect(end);
        u_h(ii) = unew; 

    end
end