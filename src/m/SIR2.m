% Time unit: 1 h
beta = 10./(40*8*24);
beta /= 4;           	% Reduce beta compared to SIR1.py
gamma = 3./(15*24);
dt = 0.1;            	% 6 min
D = 300;             	% Simulate for D days
N_t = floor(D*24/dt);   % Corresponding no of hours
nu = 1./(24*90);     	% Average loss of immunity: 50 days

t = linspace(0, N_t*dt, N_t+1);
S = zeros(N_t+1, 1);
I = zeros(N_t+1, 1);
R = zeros(N_t+1, 1);

% Initial condition
S(1) = 50;
I(1) = 1;
R(1) = 0;

% Step equations forward in time
for n = 1:N_t
    S(n+1) = S(n) - dt*beta*S(n)*I(n) + dt*nu*R(n);
    I(n+1) = I(n) + dt*beta*S(n)*I(n) - dt*gamma*I(n);
    R(n+1) = R(n) + dt*gamma*I(n) - dt*nu*R(n);
end

plot(t, S, t, I, t, R);
legend('S', 'I', 'R', 'Location','northwest');
xlabel('hours');
print('tmp', '-dpdf');  print('tmp', '-dpng');

