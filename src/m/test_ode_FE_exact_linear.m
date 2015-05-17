function test_ode_FE_exact_linear()
    % Test if a linear function u(t) = a*x + b is exactly reproduced.

    a = 4;  b = -1;  m = 6;

    exact_solution = @(t) (a*t + b)';
    f = @(u, t) a + (u - exact_solution(t))^m;

    dt = 0.5;       T = 20.0;

    [u, t] = ode_FE(f, exact_solution(0), dt, T);
    diff = max(abs(exact_solution(t) - u));
    tol = 1E-15;           % Tolerance for float comparison
    assert(diff < tol);
end
