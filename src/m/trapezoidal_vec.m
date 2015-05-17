function result_integration = trapezoidal_vec(f, a, b, n)
    h = (b-a)/n;
    x = linspace(a, b, n+1);
    result_integration = h*(sum(f(x)) - 0.5*f(a) - 0.5*f(b))
end
