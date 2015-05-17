function result = midpoint_triple1(g, a, b, c, d, e, f, nx, ny, nz)
    hx = (b - a)/nx;
    hy = (d - c)/ny;
    hz = (f - e)/nz;
    I = 0;
    for i = 0:(nx-1) 
        for j = 0:(ny-1)
            for k = 0:(nz-1)
                xi = a + hx/2 + i*hx;
                yj = c + hy/2 + j*hy;
                zk = e + hz/2 + k*hz;
                I = I + hx*hy*hz*g(xi, yj, zk);
            end
        end
    end
    result = I;
end