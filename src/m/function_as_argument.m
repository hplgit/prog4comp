function function_as_argument()
    x = 2;
    y = 3;
    
    % Create handles to the functions defined below
    sum_xy_handle = @sum_xy;
    prod_xy_handle = @prod_xy;
    
    sum = treat_xy(sum_xy_handle, x, y);
    fprintf('%f \n', sum);
    prod = treat_xy(prod_xy_handle, x, y);
    fprintf('%f \n', prod);
end

function result = treat_xy(f, x, y)
    result = f(x, y);
end

function result = sum_xy(x, y)
    result = x + y;
end

function result = prod_xy(x, y)
    result = x*y;
end
