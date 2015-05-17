g = 9.81;
v0 = 5;
t = linspace(0, 1, 1000);
y = v0*t - 0.5*g*t.^2;

% At this point, the array y with all the heights is ready.
% Now we need to find the largest value within y.

largest_height = y(1);   % Preliminary value
for i = 2:1000
   if y(i) > largest_height
       largest_height = y(i);
   end
end

fprintf('The largest height achieved was %f m \n',largest_height);

% We might also like to plot the path again just to compare
plot(t,y);
xlabel('Time (s)');
ylabel('Height (m)')
