function [K,f,xn] = diffusione_Dirichlet(L,h,mu,fun)
    N = L/h - 1;
    K = diag(-mu/h*ones(N-1,1),-1) + diag(2*mu/h*ones(N,1)) + diag(-mu/h*ones(N-1,1),1);
    f = [];
    x = h:h:L-h;
    for x_i = x
        f = [f;h*fun(x_i)];
    end
    xn = linspace(0,L,N+2);
end