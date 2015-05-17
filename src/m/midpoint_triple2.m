function I = midpoint_triple2(g, a, b, c, d, e, f, nx, ny, nz)
    function result = p(x, y)
        result = midpoint(@(z) g(x, y, z), e, f, nz);
    end

    function result = q(x)
        result = midpoint(@(y) p(x, y), c, d, ny);
    end

    q_handle = @q;
    I = midpoint(q_handle, a, b, nx);
end
