function demo_brute_force_optimizer
    [xy_minima, xy_maxima] = brute_force_optimizer(
        @(x) exp(-x.^2).*cos(4*x), 0, 4, 1001);
    xy_minima
    xy_maxima
end