function [t_h,u_h] = eulero_avanti(f,t_max,y_0,h)
    
    t_h = 0:h:t_max;
    u_h = zeros(length(t_h),1);
    u_h(1) = y_0;
    
    for ii = 2:length(t_h)
        uold = u_h(ii-1);
        t_old = t_h(ii-1);
        unew = uold + h*f(t_old,uold);
        u_h(ii) = unew; 
    end

end
