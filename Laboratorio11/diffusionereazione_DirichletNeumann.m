function [K,M,f,xn] = diffusionereazione_DirichletNeumann(L,h,mu,sigma,fun)
    N = L/h;
    K = diag(-mu/h*ones(N-1,1),-1) + diag(2*mu/h*ones(N,1)) + diag(-mu/h*ones(N-1,1),1);
    K(N,N) = mu/h;
    M = diag(sigma*h/6*ones(N-1,1),-1)+ diag(2*sigma*h/3*ones(N,1)) + diag(sigma*h/6*ones(N-1,1),1);
    M(N,N) = sigma*h/6;
    f = [];
    x = h:h:L;
    for x_i = x
        f = [f;h*fun(x_i)];
    end
    f(N) = f(N)/2;
    xn = linspace(0,L,N+1);
end