function [xy_minima, xy_maxima] = brute_force_optimizer(f, a, b, n)
    x = linspace(a, b, n);
    y = f(x);
    % Let maxima and minima hold the indices corresponding
    % to (local) maxima and minima points    
    minima = [];
    maxima = [];
    for i = 2:(n-1)
        if y(i-1) < y(i) && y(i) > y(i+1)
            maxima = [maxima; i];
        end
        if y(i-1) > y(i) && y(i) < y(i+1)
            minima = [minima; i];
        end
    end

    % What about the end points?
    y_min_inner = y(minima(1));   % Initialize
    for i = 1:length(minima)
        if y(minima(i)) < y_min_inner
            y_min_inner = y(minima(i));
        end        
    end
    y_max_inner = y(maxima(1));   % Initialize
    for i = 1:length(maxima)
        if y(maxima(i)) > y_max_inner
            y_max_inner = y(maxima(i));
        end
    end
    
    if y(1) > y_max_inner
        maxima = [maxima; 1];
    end
    if y(length(x)) > y_max_inner
       maxima = [maxima; length(x)];
    end
    if y(1) < y_min_inner
        minima = [minima; 1];
    end
    if y(length(x)) < y_min_inner
        minima = [minima; length(x)];
    end
    
    % Compose return values
    xy_minima = [];
    for i = 1:length(minima)
        xy_minima = [xy_minima; [x(minima(i)) y(minima(i))]];
    end 
    xy_maxima = [];
    for i = 1:length(maxima)
        xy_maxima = [xy_maxima; [x(maxima(i)) y(maxima(i))]];
    end 
end
 