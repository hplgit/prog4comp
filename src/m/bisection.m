function [result1, result2] = bisection(f, x_L, x_R, eps)
    f_L = f(x_L);
    if f_L*f(x_R) > 0
        fprintf('Error! Function does not have opposite\n');
        fprintf('signs at interval endpoints!')
        exit(1)
    end
    x_M = (x_L + x_R)/2;
    f_M = f(x_M);
    iteration_counter = 1;

    while abs(f_M) > eps
        if f_L*f_M > 0   % i.e., same sign
            x_L = x_M;
            f_L = f_M;
        else
            x_R = x_M;
        end
        x_M = (x_L + x_R)/2;
        f_M = f(x_M);
        iteration_counter = iteration_counter + 1;
    end
    result1 = x_M;
    result2 = iteration_counter;
end
