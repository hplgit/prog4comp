function demo_SIR()
    % Test case using an SIR model
    
    dt = 0.1;               % 6 min
    D = 30;                 % Simulate for D days
    N_t = floor(D*24/dt);   % Corresponding no of time steps
    T = dt*N_t;             % End time
    U_0 = [50 1 0];
    
    f_handle = @f;
    
    [u, t] = ode_FE(f_handle, U_0, dt, T);
    
    S = u(:,1);
    I = u(:,2);
    R = u(:,3);
    plot(t, S, 'b-', t, I, 'r-', t, R, 'g-');
    legend('S', 'I', 'R');
    xlabel('hours');
    % Consistency check:
    N = S(1) + I(1) + R(1);
    eps = 1E-12;           % Tolerance for comparing real numbers
    for n = 1:length(S)
        err = abs(S(n) + I(n) + R(n) - N);
        if (err > eps)
            error('demo_SIR: error=%g', err);                        
        end
    end
end

function result = f(u,t)
    beta = 10/(40*8*24);   
    gamma = 3/(15*24);        

    S = u(1); I = u(2); R = u(3);
    result = [-beta*S*I beta*S*I - gamma*I gamma*I];
end

