function test_MonteCarlo_double_circle_r()
    % Check the integral of r over a circle with radius 2.
    function result = g(x, y)
        xc = 0; yc = 0;    % center
        R = 2;             % radius
        result =  R^2 - ((x-xc)^2 + (y-yc)^2);
    end
    g_handle = @g;
    
    % Exact: integral of r*r*dr over circle with radius R becomes
    % 2*pi*1/3*R**3
    syms r;
    I_exact = int(@(r) 2*pi*r*r, r, 0, 2);
    fprintf('Exact integral: %g\n', I_exact);
    x0 = -2;  x1 = 2;  y0 = -2;  y1 = 2;
    n = 1000;
    rand("seed", 6);                % must fix the seed!
    I_expected = 16.85949525320151  % Computed with this seed
    I_computed = MonteCarlo_double(...
               @(x, y) sqrt(x^2 + y^2), g_handle, x0, x1, y0, y1, n);
    fprintf('MC approximation (%d samples): %.16f', n^2, I_computed);
    assert(abs(I_computed - I_expected) < 1E-15);
end
