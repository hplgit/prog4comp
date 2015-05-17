function [sol,no_it] = secant_solver(f, x0, x1, eps, return_x_list)
    f_x0 = f(x0);
    f_x1 = f(x1);
    iteration_counter = 0;
    if return_x_list
        x_list = [];
    end
    
    while abs(f_x1) > eps && iteration_counter < 100
        try
            denominator = (f_x1 - f_x0)/(x1 - x0);
            x = x1 - (f_x1)/denominator;
        catch
            fprintf('Error! - denominator zero for x = \n',x1)
            break
        end
        x0 = x1;
        x1 = x;
        f_x0 = f_x1;
        f_x1 = f(x1);
        iteration_counter = iteration_counter + 1;
        if return_x_list
            x_list = [x_list x];
        end        
    end
    % Here, either a solution is found, or too many iterations
    if abs(f_x1) > eps
        iteration_counter = -1;   % i.e., lack of convergence
    end
    
    if return_x_list
        sol = x_list;
        no_it = iteration_counter;
    else
        sol = x;
        no_it = iteration_counter;
    end
end
