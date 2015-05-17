v = @(t) 3*(t^2)*exp(t^3);

a = 0.0;  b = 1.0;
n = input('n: ')
dt = (b-a)/n;

% Integral by the trapezoidal method
numerical = 0.5*v(a) + 0.5*v(b);
for i = 1:(n-1)
    numerical = numerical + v(a + i*dt);
end
numerical = numerical*dt;

F = @(t) exp(t^3);
exact_value = F(b) - F(a);
error = exact_value - numerical;
fprintf('n=%d: %.16f, error: %g', n, numerical, error);

