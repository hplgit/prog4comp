%% Temperature evolution in a rod, computed by a ForwardEuler method.

function rod_FE()
    global beta; global dx;   
    global L; global x;    

    s = @(t) 423;
    L = 1;
    beta = 1;
    N = 40;
    x = linspace(0, L, N+1);
    dx = x(2) - x(1);
    u = zeros(1, N+1);

    U_0 = zeros(1, N+1);
    U_0(1) = s(0);
    U_0(2:length(U_0)) = 283;
    dt = dx^2/(2*beta);
    fprintf('stability limit: %g\n', dt);
    %dt = 0.00034375
    T = 1.2;
    rhs_handle = @rhs;
    
    tic;
    [u, t] = ode_FE(rhs_handle, U_0, dt, T);
    cpu_time = toc;
    fprintf('CPU time: %.1fs\n', cpu_time);

    % Make movie
    delay = 0.001;
    h = plot(x, u(1,:));
    axis([x(1), x(length(x)), 273, 1.2*s(0)]);
    xlabel('x');  ylabel('u(x,t)');  
    set(h, 'xData', x);
    counter = 0;
    for i = 2:length(u(:,1))
        t(i)
        set(h, 'yData', u(i,:));
        legend(strcat('t=',num2str(t(i))), 'location', 'northeast');
        pause(delay); 
        if mod(i, 10) == 0
            filestem = sprintf('tmp_%04d', counter);
            print(filestem, '-dpng');
            counter = counter + 1;
        end
   end
end

function right_hand_side = rhs(u, t)
    global beta; global dx;   
    global L; global x;    
    
    dudx = @(t) 0;
    dsdt = @(t) 0;
    f    = @(x, t) 0;

    N = length(u) - 1;
    rhs = zeros(1, N+1);
    rhs(1) = dsdt(t);
    for i = 2:N 
        rhs(i) = (beta/dx^2)*(u(i+1) - 2*u(i) + u(i-1)) +...
                 f(x(i), t);
    end
    rhs(N+1) = (beta/dx^2)*(2*u(N) + 2*dx*dudx(t) -...
                           2*u(N+1)) + f(x(N+1), t);
    right_hand_side = rhs;
end