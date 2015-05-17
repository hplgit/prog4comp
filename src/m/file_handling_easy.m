filename = 'tmp.dat';
data = load(filename);
x = data(:,1);
y = data(:,2);
data(:,2) = log(y); % insert transformed y back in array
filename = 'tmp_out.dat';
outfile = fopen(filename, 'w'); % open file for writing
fprintf(outfile, '%% x and y coordinates\n');
fprintf(outfile, '%10.5f %10.5f\n', data);
fclose(outfile);