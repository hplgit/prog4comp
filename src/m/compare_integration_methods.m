g = @(y) exp(-y**2);
a = 0;
b = 2;
fprintf('    n        midpoint          trapezoidal\n');
for i = 1:20
    n = 2^i;
    m = midpoint(g, a, b, n);
    t = trapezoidal(g, a, b, n);
    fprintf('%7d %.16f %.16f\n', n, m, t);
end
