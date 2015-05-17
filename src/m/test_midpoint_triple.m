function test_midpoint_triple()
    % Test that a linear function is integrated exactly.
    g = @(x, y, z) 2*x + y - 4*z;

    a = 0;  b = 2;  c = 2;  d = 3;  e = -1;  f = 2;
    syms x y z;
    I_expected = int(int(int(f, y, c, d), x, a, b), z, e, f);
    nx = 3;  ny = 5;  nz = 2;
    for i = 0:2
        nx = nx + 1; ny = ny - 1; nz = nz + 2;
        I_computed1 = midpoint_triple1(...
            g, a, b, c, d, e, f, nx, ny, nz)
        I_computed2 = midpoint_triple2(...
            g, a, b, c, d, e, f, nx, ny, nz)
        tol = 1E-14;
        fprintf('...
          I_expected = %g, I_computed1 = %g, I_computed2 = %g\n',...
          I_expected, I_computed1, I_computed2);
	assert(abs(I_computed1 - I_expected) < tol);
	assert(abs(I_computed2 - I_expected) < tol);
    end
end
