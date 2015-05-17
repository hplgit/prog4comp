function answer = ode_H(f0, dfdt, a, b, N)
    dt = (b-a)/N;
    result = zeros(N+1, length(f0));
    result(1,:) = f0;      % Initial values
    derivatives = zeros(1, length(f0));
    prediction  = zeros(1, length(f0));
    time = a;
    for i = 2:(N+1)
       derivatives(1,:) = dfdt(result(i-1,:), time);
       prediction(1,:)  = result(i-1,:) + dt*derivatives(1,:);
       result(i,:)  = result(i-1,:) +...
            (dt/2)*(derivatives(1,:) + dfdt(prediction(1,:),time));
       time = time + dt;
    end
    answer = result;
end




