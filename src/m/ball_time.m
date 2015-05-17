g = 9.81;
v0 = 4.5;                  % Initial velocity
t = linspace(0, 1, 1000);  % Acceleration of gravity
y = v0*t - 0.5*g*t.^2;     % Generate all heights

% At this point, the array y with all heights is ready

i = 1;
while y(i) >= 0
   i = i + 1; 
end

% Having the index, we may look up the time in the array t
fprintf('The time (switch from positive to negative): %f\n', t(i));

% We plot the path again just for comparison
plot(t, y);
xlabel('Time (s)');
ylabel('Height (m)');
