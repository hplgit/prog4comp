function [res1, res2] = bisection_solver(f, x_L, x_R, eps, return_x_list)
    f_L = f(x_L)
    if f_L*f(x_R) > 0
        fprintf('Error! Function does not have opposite\n');
        fprintf('signs at interval endpoints!')
        exit(1)
    end
    x_M = (x_L + x_R)/2.0;
    f_M = f(x_M);
    iteration_counter = 1;
    if return_x_list
        x_list = [];
    end
    
    while abs(f_M) > eps
        if f_L*f_M > 0   % i.e., same sign
            x_L = x_M;
            f_L = f_M;
        else
            x_R = x_M;
        end
        x_M = (x_L + x_R)/2.0;
        f_M = f(x_M);
        iteration_counter = iteration_counter + 1;
        if return_x_list
            x_list = [x_list x_M];
        end
    end
    
    if return_x_list
        res1 = x_list;
        res2 = iteration_counter;    
    else
        res1 = x_M;
        res2 = iteration_counter;
    end
end
