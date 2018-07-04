Vx_range = linspace(-1, 1, 11);
Vy_range = linspace(-0.3, 0.3, 11);
H_range = linspace(-0.15, 0.15, 11);

counter = 1;

num_of_iterations = zeros(1331, 1);
status = zeros(1331, 1);

lines = cell(67, 1);
index = 1;

for vx = Vx_range
    for vy = Vy_range
        for h = H_range
            
            fid = fopen(fullfile('periodic', 'local', 'log', sprintf('log_%d.txt', counter)));
            tline = fgetl(fid);
            while ischar(tline)
                lines{index} = tline;
                index = mod(index, 67) + 1;
                actual_line = tline;
                tline = fgetl(fid);
            end
            
            num_of_iterations(counter, 1) = sscanf(lines{index}, 'Number of Iterations....: %d');
            if strcmp(actual_line, '*** The problem FAILED!')
                status(counter) = -1;
                fprintf('%d (%.3f, %.3f, %.3f): %s\n', counter, vx, vy, h, actual_line);
            else
                status(counter) = 1;
            end
            fclose(fid);
            
            counter = counter + 1;
        end
    end
end
