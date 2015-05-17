function ball_function()
    % This is the main program
    time = 0.6;                     % Just pick some time
    vertical_position = y(time);    
    fprintf('%f \n',vertical_position)
    time = 0.9;                     % Pick another time
    vertical_position = y(time);   
    fprintf('%f \n',vertical_position)
end

% The function 'y' is a _local_ function in this file
function result = y(t)
    g = 9.81;      % Acceleration of gravity
    v0 = 5;        % Initial velocity
    result = v0*t - 0.5*g*t^2;
end



