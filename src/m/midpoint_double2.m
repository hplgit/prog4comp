function I = midpoint_double2(f, a, b, c, d, nx, ny)
    function result = g(x)
        result = midpoint(@(y) f(x, y), c, d, ny);
    end
    g_handle = @g;
    I = midpoint(g_handle, a, b, nx);
end
