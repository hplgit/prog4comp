function beam_vib()

    plot_f()

    f_handle = @f;
    % Set up suitable intervals
    intervals = [1 3; 4 6; 7 9];
    betas = [];  % roots
    for i = 1:length(intervals) 
        beta_L = intervals(i, 1);  beta_R = intervals(i, 2);
        [beta, it] = bisection(f_handle, beta_L, beta_R, eps=1E-6);
        betas = [betas beta];
        f(beta)   
    end
    betas

    % Find corresponding frequencies

    function value = omega(beta, rho, A, E, I)
        value = sqrt(beta^4/(rho*A/(E*I)));
    end

    rho = 7850;  % kg/m^3
    E = 1.0E+11; % Pa
    b = 0.025;   % m
    h = 0.008;   % m
    A = b*h;
    I = b*h^3/12;

    for i = 1:length(betas)
        omega(betas(i), rho, A, E, I)
    end

end

function value = f(beta)
    value = cosh(beta).*cos(beta) + 1;
end

function value = damped(beta)
    % Damp the amplitude of f. It grows like cosh, i.e. exp.
    value = exp(-beta).*f(beta);
end

function plot_f()
    beta = linspace(0, 20, 501);
    %y = f(x)
    y = damped(beta);
    plot(beta, y, 'r', [beta(1), beta(length(beta))], [1, 1], 'b--')
    grid('on');
    xlabel('beta');
    ylabel('exp(-beta) (cosh(beta) cos(beta) +1)')
    savefig('tmp1.png'); savefig('tmp1.pdf')
end

