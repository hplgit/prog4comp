function [u, t] = osc_2nd_order(U_0, omega, dt, T)
    % Solve u'' + omega**2*u = 0 for t in (0,T], u(0)=U_0 
    % and u'(0)=0, by a central finite difference method with 
    % time step dt.
    N_t = floor(round(T/dt));
    u = zeros(N_t+1, 1);
    t = linspace(0, N_t*dt, N_t+1);

    u(1) = U_0;
    u(2) = u(1) - 0.5*dt^2*omega^2*u(1);
    for n = 2:N_t
        u(n+1) = 2*u(n) - u(n-1) - dt^2*omega^2*u(n);
    end
end
