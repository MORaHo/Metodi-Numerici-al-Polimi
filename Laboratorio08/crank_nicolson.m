function [t_h,u_h,iter_nwt] = crank_nicolson(f,df,t_max,y_0,h)

    t_h = 0:h:t_max;
    u_h = zeros(length(t_h),1);
    u_h(1) = y_0;
    iter_nwt = zeros(length(t_h),1);

    nmax = 100;
    toll = 1e-12;

    for ii = 2:length(t_h)
        
        told = t_h(ii-1);
        tnew = t_h(ii);
        uold = u_h(ii-1);

        g = @(X) X - uold - (h/2)*(f(told,uold)+f(tnew,X));
        dg = @(X) 1 - (h/2)*(df(told,uold)+df(tnew,X));
        x0 = uold;
        
        [xvect,it] = newton(x0,nmax,toll,g,dg,1);

        iter_nwt(ii) = it;
        unew = xvect(end);
        u_h(ii) = unew; 

    end
end
