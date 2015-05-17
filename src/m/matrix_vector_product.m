x = zeros(2, 1);
x(1) = 3;  x(2) = 2;  % Insert some values

A = zeros(2, 2);
A(1,1) = 1;  A(1,2) = 0;
A(2,1) = 0;  A(2,2) = 1;

y = A*x   % Computes and prints
