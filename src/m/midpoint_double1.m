function result = midpoint_double1(f, a, b, c, d, nx, ny)
    hx = (b - a)/nx;
    hy = (d - c)/ny;
    I = 0;
    for i = 0:(nx-1)
        for j = 0:(ny-1)
            xi = a + hx/2 + i*hx;
            yj = c + hy/2 + j*hy;
            I = I + hx*hy*f(xi, yj);
        end
    end
    result = I;
end