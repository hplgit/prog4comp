function demo_osc_Heun()
    omega = 2;
    P = 2*pi/omega;
    dt = P/20;
    T = 10*P;
    X_0 = 2;
    [u, v, t] = osc_Heun(X_0, omega, dt, T);

    plot(t, u, 'b-', t, X_0*cos(omega*t), 'r--');
    legend('numerical', 'exact','location','northwest');
    xlabel('t');
end
