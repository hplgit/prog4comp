function demo_population_growth()
    % Test case: u' = r*u, u(0)=100
    function r = f(u, t)
        r = 0.1*u;
    end
    [u, t] = ode_FE(@f, 100, 0.5, 20);
    plot(t, u, t, 100*exp(0.1*t));
end
