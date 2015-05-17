filename = 'tmp.dat';
infileID = fopen(filename, 'r');   % Open file for reading
fgetl(infileID);                   % Read and skip first line

% First read file to count number of lines with data
no_of_lines = 0;
while ~feof(infileID)
    no_of_lines = no_of_lines + 1;
    fgetl(infileID); 
end
fclose(infileID);

% Can now define arrays x and y of known length
x = zeros(no_of_lines, 1);
y = zeros(no_of_lines, 1);

% Re-open the file for reading
infileID = fopen(filename, 'r');   % Open file for reading
fgetl(infileID);                   % Read and skip first line

% Read x and y coordinates from the file and store in arrays
i = 1;
while i <= no_of_lines
    x(i) = fscanf(infileID, '%f', 1);
    y(i) = fscanf(infileID, '%f', 1);    
    i = i + 1;
end
fclose(infileID);

% Next, we treat the y-coordinates and write to file

F = @(y) log(y);
y = F(y);    % Overwrite y with new values

filename = 'tmp_out.dat';
outfileID = fopen(filename, 'w');   % Open file for writing
i = 1;
while i <= no_of_lines
    fprintf(outfileID, '%10.5f %10.5f', x(i), y(i));
    i = i + 1;
end
fclose(outfileID);
