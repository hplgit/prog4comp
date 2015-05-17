function system_nonlin_eqns_Newton()
    f = @(x,y) [y - x^2, y - 2 + x^4]';
    J = @(x) [-2*x, 1; 4*x^3, 1];  % Note: depends only on x
    
    x = [2.0, 2.0]';   % Starting values
    f_eval = f(x(1), x(2));
    error_limit = 0.001;
    no_iterations = 0;
    it_limit = 100;
    
    while sqrt(f_eval(1)^2 + f_eval(2)^2) > error_limit &&...
                                          no_iterations < it_limit
        try
            x = x - inv(J(x(1)))*f(x(1), x(2))  % Computes and prints
            f_eval = f(x(1), x(2));
            no_iterations = no_iterations + 1;
        catch
            fprintf('Error! - Jacobian not invertible for x = %f\n',x);
            fprintf('Abort.\n');
            no_iterations = it_limit  % Just to stop while loop
        end
    end
    
end
