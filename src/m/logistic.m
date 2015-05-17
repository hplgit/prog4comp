f = @(u, t) 0.1*(1 - u/500)*u;
U_0 = 100;  

dt = 0.5;  T = 60;
[u, t] = ode_FE(f, U_0, dt, T);
plot(t, u, 'b-');
xlabel('t');  ylabel('N(t)');
filestem = strcat('tmp_',num2str(dt));
% Note: this print statement gets a problem with the decimal point
%print(filestem,'-dpng');  print(filestem,'-dpdf');  
% so we rather do it like this:
filename = strcat(filestem, '.png'); print(filename);
filename = strcat(filestem, '.pdf'); print(filename);

dt = 20;  T = 100;
[u, t] = ode_FE(f, U_0, dt, T);
plot(t, u, 'b-');
xlabel('t');  ylabel('N(t)');
filestem = strcat('tmp_',num2str(dt));
print(filestem, '-dpng');  print(filestem, '-dpdf');
