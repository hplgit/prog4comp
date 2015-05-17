function [u, v, t] = osc_Heun(X_0, omega, dt, T)
    N_t = floor(T/dt);
    u = zeros(N_t+1, 1);
    v = zeros(N_t+1, 1);
    t = linspace(0, N_t*dt, N_t+1);

    % Initial condition
    u(1) = X_0;
    v(1) = 0;

    % Step equations forward in time
    for n = 1:N_t
        u_star = u(n) + dt*v(n);
        v_star = v(n) - dt*omega^2*u(n);
        u(n+1) = u(n) + 0.5*dt*(v(n) + v_star);
        v(n+1) = v(n) - 0.5*dt*omega^2*(u(n) + u_star);
    end
end
