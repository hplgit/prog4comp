omega = 2;
P = 2*pi/omega;
dt = P/20;
T = 40*P;
N_t = floor(round(T/dt));
t = linspace(0, N_t*dt, N_t+1);
fprintf('N_t: %d\n', N_t);

u = zeros(N_t+1, 1);
v = zeros(N_t+1, 1);

% Initial condition
X_0 = 2;
u(1) = X_0;
v(1) = 0;

% Step equations forward in time
for n = 1:N_t
    v(n+1) = v(n) - dt*omega^2*u(n);
    u(n+1) = u(n) + dt*v(n+1);
end
% Plot the last four periods to illustrate the accuracy
% in long time simulations
N4l = floor(round(4*P/dt)); % No of intervals to be plotted
true_sol = X_0*cos(omega*t);
plot(t(length(t)-N4l:end), u(length(u)-N4l:end), 'b-',...
       t(length(t)-N4l:end), true_sol(length(true_sol)-N4l:end), 'r--');
legend('numerical', 'exact', 'Location','northwest');
xlabel('t');
fprintf('%.16f %.16f', u(end), v(end));
