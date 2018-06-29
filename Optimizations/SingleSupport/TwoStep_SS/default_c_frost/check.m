Vx_range = linspace(-1, 1, 11);
Vy_range = linspace(-0.3, 0.3, 11);
H_range = linspace(-0.2, 0.2, 11);

counter = 1;

for vx = Vx_range
    for vy = Vy_range
        for h = H_range
            
            fid = fopen(fullfile('periodic', 'local', 'log', sprintf('log_%d.txt', counter)));
            tline = fgetl(fid);
            while ischar(tline)
                actual_line = tline;
                tline = fgetl(fid);
            end
            if strcmp(actual_line, '*** The problem FAILED!')
                fprintf('%d (%.3f, %.3f, %.3f): %s\n', counter, vx, vy, h, actual_line);
            end
            fclose(fid);
            
            counter = counter + 1;
        end
    end
end
