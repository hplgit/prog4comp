function test_midpoint_double()
    % Test that a linear function is integrated exactly.
    f = @(x, y) 2*x + y;

    a = 0;  b = 2;  c = 2;  d = 3;
    syms x y;
    I_expected = int(int(f, y, c, d), x, a, b);
    % Test three cases: nx < ny, nx = ny, nx > ny
    nx = 3;  ny = 5;
    for i = (0:2)
        nx = nx + 1;  ny = ny - 1;
        I_computed1 = midpoint_double1(f, a, b, c, d, nx, ny);
        I_computed2 = midpoint_double2(f, a, b, c, d, nx, ny);
        tol = 1E-14;
        %fprintf('...
        %  I_expected = %g, I_computed1 = %g, I_computed2 = %g\n',...
        %  I_expected, I_computed1, I_computed2);
	assert(abs(I_computed1 - I_expected) < tol);
	assert(abs(I_computed2 - I_expected) < tol);
    end
end
