% Finds the derivatives (Vel and Acc) at one point in time 
function vel_and_acc = derivatives(t, h, flag, H, k, c, L, M)
    g = 9.81;    % i.e., m/s^2 
    Vel = h(2);
    % Note that H - h(1) will be the distance from bridge to mass
    if (H - h(1)) >= L    % Then the elastic rope is acting
       ForceRope = k * ((H - h(1)) - L) - c*h(2);
    else
       ForceRope = 0;
    end
    Acc = (ForceRope - M*g)/M;  % ForceRope = 0 implies Acc = g
    vel_and_acc = [Vel,Acc]';     
end
