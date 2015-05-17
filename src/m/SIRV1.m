% As SIR2.py, but including constant vaccination

% Time unit: 1 h
beta = 10/(40*8*24);
beta = beta/4;                % Reduce beta compared to SIR1.py
fprintf('beta: %g\n', beta);
gamma = 3/(15*24);
dt = 0.1;                      % 6 min
D = 300;                       % Simulate for D days
N_t = floor(D*24/dt);          % Corresponding no of hours
nu = 1/(24*50);                % Average loss of immunity: 50 days
p = 0.0001;

t = linspace(0, N_t*dt, N_t+1);
S = zeros(N_t+1, 1);
I = zeros(N_t+1, 1);
R = zeros(N_t+1, 1);
V = zeros(N_t+1, 1);

% Initial condition
S(1) = 50;
I(1) = 1;
R(1) = 0;
V(1) = 0;

% Step equations forward in time
for n = 1:N_t
    S(n+1) = S(n) - dt*beta*S(n)*I(n) + dt*nu*R(n) - dt*p*S(n);
    V(n+1) = V(n) + dt*p*S(n);
    I(n+1) = I(n) + dt*beta*S(n)*I(n) - dt*gamma*I(n);
    R(n+1) = R(n) + dt*gamma*I(n) - dt*nu*R(n);
    loss = floor(V(n+1) + S(n+1) + R(n+1) + I(n+1)) -...
                         floor(V(1) + S(1) + R(1) + I(1));
    if loss > 0
        fprintf('loss: %d\n', loss);
    end
end

plot(t, S, t, I, t, R, t, V);
legend('S', 'I', 'R', 'V', 'Location', 'northwest');
xlabel('hours');
