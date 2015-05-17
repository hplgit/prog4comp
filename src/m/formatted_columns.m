n = 6;
t0 = 2;
dt = 0.55;
% Unformatted print
for i = 1:n
  t = t0 + i*dt;
  g = t*sin(t);
  fprintf('%f %f\n', t, g);
end

fprintf('Formatting via printf syntax\n');
for i = 1:n
  t = t0 + i*dt;
  g = t*sin(t);
  fprintf('%6.2f  %8.3f\n', t, g);
end
