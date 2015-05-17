function test_MonteCarlo_double_rectangle_area()
    % Check the area of a rectangle.
    g = @(x, y) -1 + 2*(0 <= x && x <= 2 && 3 <= y && y <= 4.5);

    x0 = 0;  x1 = 3;  y0 = 2;  y1 = 5;  % embedded rectangle
    n = 1000;
    rand("seed", 8);         % must fix the seed!
    I_expected = 3.117285;  % computed with this seed
    I_computed = MonteCarlo_double(@(x,y) 1, g, x0, x1, y0, y1, n);
    assert(abs(I_expected - I_computed) < 1E-14);
end
