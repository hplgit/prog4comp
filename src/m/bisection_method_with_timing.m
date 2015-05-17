function bisection_method_with_timing()
    f = @(x) x^2 - 9;
    eps = 1e-6;
    a = 0;   b = 1000;
    tic
    for i = 1:100000
        solution = bisection(f, a, b, eps);
    end
    toc
    if solution <= b   % Solution found
        fprintf('A solution is: %f\n', solution)
    else
        fprintf('Abort execution.\n')
    end
end
