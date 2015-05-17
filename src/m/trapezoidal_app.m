function application()
  v = @(t) 3*(t**2)*exp(t**3);
  n = input('n: ')
  numerical = trapezoidal(v, 0, 1, n);

  % Compare with exact result
  V = @(t) exp(t**3);
  exact = V(1) - V(0);
  error = exact - numerical;
  fprintf("n=%d: %.16f, error: %g", n, numerical, error)
end

application()
