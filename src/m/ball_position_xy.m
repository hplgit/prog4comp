function ball_position_xy()
    initial_velocity_x = 2.0;
    initial_velocity_y = 5.0;

    time = 0.6;  % Just pick one point in time
    x_pos = x(initial_velocity_x, time);
    y_pos = y(initial_velocity_y, time);
    fprintf('%f %f \n', x_pos, y_pos)
    
    time = 0.9;  % Pick another point in time
    x_pos = x(initial_velocity_x, time);
    y_pos = y(initial_velocity_y, time);
    fprintf('%f %f \n', x_pos, y_pos)
end

function result = y(v0y, t)
    g = 9.81;      % Acceleration of gravity
    result = v0y*t - 0.5*g*t^2;
end

function result = x(v0x, t)
    result = v0x*t;
end


