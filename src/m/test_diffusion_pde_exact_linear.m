%% Verify the implementation of the diffusion equation.

function test_diffusion_pde_exact_linear()

    global beta; global dx;   % needed in rhs
    global L; global x;    

    function value = u_exact(x, t)
        value = (3*t + 2)*(x - L);
    end    
    function value = s(t)
        value = u_exact(0, t);
    end

    L = 1.5;
    beta = 0.5;
    N = 4;
    x = linspace(0, L, N+1);
    dx = x(2) - x(1);
    u = zeros(1, N+1);

    U_0 = zeros(1, N+1);
    U_0(1) = s(0);
    U_0(2:length(U_0)) = u_exact(x(2:length(x)), 0);
    dt = 0.1
    T = 1.2; 
    rhs_handle = @rhs;

    [u, t] = ode_FE(rhs_handle, U_0, dt, T);

    tol = 1E-12;
    for i = 1:length(u(:,1))
        diff = max(abs(u_exact(x, t(i)) - u(i,:)));
        assert(diff < tol, 'diff=%.16g', diff);
        fprintf('diff=%g at t=%g\n', diff, t(i));
    end
end

function right_hand_side = rhs(u, t)
    global beta; global dx;   
    global L; global x;    
    
    dudx = @(t) (3*t + 2);
    dsdt = @(t) 3*(-L);
    f    = @(x, t) 3*(x-L);

    N = length(u) - 1;
    rhs = zeros(1, N+1);
    rhs(1) = dsdt(t);
    for i = 2:N 
        rhs(i) = (beta/dx^2)*(u(i+1) - 2*u(i) + u(i-1)) +...
                 f(x(i), t);
    end
    rhs(N+1) = (beta/dx^2)*(2*u(N) + 2*dx*dudx(t) -...
                           2*u(N+1)) + f(x(N+1), t);
    right_hand_side = rhs;
end
