function [t_h,u_h,iter_ptofis] = eulero_indietro_ptofis(f,t_max,y_0,h)
    
    t_h = 0:h:t_max;
    u_h = zeros(length(t_h),1);
    u_h(1) = y_0;
    iter_ptofis(1) = 0;
    
    nmax = 100;
    toll = 1e-12;
    
        for ii = 2:length(t_h)
        
            tnew = t_h(ii);
            uold = u_h(ii-1);
        
            phi = @(X) X - (X - uold - h*f(tnew,X));
            x0 = uold;
        
            [xvect,it] = ptofis(x0,phi,nmax,toll);
        
            u_h(ii) = xvect(end);
            iter_ptofis(ii) = it;
        
        end
    
end