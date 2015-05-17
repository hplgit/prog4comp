function test_trapezoidal_one_exact_result
  % Compare one hand-computed result
  v = @(t) 3*(t^2)*exp(t^3);
  n = 2;
  numerical = trapezoidal(v, 0, 1, n);
  exact = 2.463642041244344;
  err = abs(exact - numerical);
  tol = 1E-14;
  assert(err < tol, 'error=%g > tol=%g', err, tol);
end

function test_trapezoidal_linear
  % Check that linear functions are integrated exactly
  f = @(x) 6*x - 4;
  F = @(x) 3*x**2 - 4*x;  % Anti-derivative
  a = 1.2; b = 4.4;
  exact = F(b) - F(a);
  tol = 1E-14;
  for n = [2 20 21]
    numerical = trapezoidal(f, a, b, n);
    err = abs(exact - numerical);
    assert(err < tol, 'n=%d, err=%g', n, err);
  end
end

function r = convergence_rates(f, F, a, b, num_experiments)
  n = zeros(num_experiments, 1);
  E = zeros(num_experiments, 1);
  r = zeros(num_experiments-1, 1);
  exact = F(b) - F(a);

  for i = 1:num_experiments
    n(i) = 2^i;
    numerical = trapezoidal(f, a, b, n(i));
    err = abs(exact - numerical);
    E(i) = err;
    if (i > 1)
      r(i-1) = log(E(i-1)/E(i))/log(n(i-1)/n(i));
      r(i-1) = round(r(i-1)*100)/100;  % Truncate, two decimals
   end
  end
end

function test_trapezoidal_conv_rate
  % Check empirical convergence rates against the expected -2.
  v = @(t) 3*(t^2)*exp(t^3);
  V = @(t) exp(t^3);
  a = 1.1; b = 1.9;
  num_experiments = 14;
  r = convergence_rates(v, V, a, b, num_experiments)
  tol = 0.01;
  assert(abs(r(num_experiments-1)) - 2 < tol, '%f, %f, %f, %f, %f',...
                   r((num_experiments-1)-4:num_experiments-1));
end

test_trapezoidal_one_exact_result()
test_trapezoidal_linear()
test_trapezoidal_conv_rate()
