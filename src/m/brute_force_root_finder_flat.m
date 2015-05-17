f = @(x) exp(-x.^2).*cos(4*x);

x = linspace(0, 4, 10001);
y = f(x);

root = NaN;  % Initialization
for i = 1:(length(x)-1) 
    if y(i)*y(i+1) < 0
         root = x(i) - (x(i+1) - x(i))/(y(i+1) - y(i))*y(i);
         break;  % Jump out of loop
    end
end
if isnan(root)
    fprintf('Could not find any root in [%g, %g]\n', x(0), x(-1));
else
    fprintf('Find (the first) root as x=%g\n', root);
end