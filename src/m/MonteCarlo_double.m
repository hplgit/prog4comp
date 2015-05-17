function result = MonteCarlo_double(f, g, x0, x1, y0, y1, n)
    %
    % Monte Carlo integration of f over a domain g>=0, embedded
    % in a rectangle [x0,x1]x[y0,y1]. n^2 is the number of
    % random points.
    
    % Draw n^2 random points in the rectangle
    x = x0 + (x1 - x0)*rand(n,1);
    y = y0 + (y1 - y0)*rand(n,1);
    % Compute sum of f values inside the integration domain
    f_mean = 0;
    num_inside = 0;   % number of x,y points inside domain (g>=0)
    for i = 1:length(x)
        for j = 1:length(y)
            if g(x(i), y(j)) >= 0
                num_inside = num_inside + 1;
                f_mean = f_mean + f(x(i), y(j));
            end
        end
    end
    f_mean = f_mean/num_inside;
    area = num_inside/(n^2)*(x1 - x0)*(y1 - y0);
    result = area*f_mean;
end
