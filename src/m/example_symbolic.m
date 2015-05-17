syms x y

2*x + 3*x - y    % Algebraic computation

f = x^2;
diff(f, x)       % Differentiate x^2 wrt x

f = cos(x);
int(f, x)        % Integrate cos(x) wrt x

f = (x^2 + x^3)/x^2;
simplify(f)      % Simplify f

f = sin(x)/x
limit(f, x, 0)   % Find limit of f as x -> 0

f = 15*x - 15;
solve(f, x)       % Solve 15*x - 15 = 0 wrt x
