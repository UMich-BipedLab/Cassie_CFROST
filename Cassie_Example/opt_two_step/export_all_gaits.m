Vx_range = linspace(-0.5, 0.5, 11);
Vy_range = linspace(0, 0, 1);
H_range = linspace(-0.15, 0.15, 11);

counter = 1;

mkdir(fullfile(local_path, 'mat_output'));

gait_library = [];

GaitLibrary = {};

for vx = Vx_range
    for vy = Vy_range
        for h = H_range
            velocity = [vx; vy];
            step_height = h;

            %% Load c_frost results
            file_name = fullfile(local_output_lib_path, sprintf('output_%d.json', counter));
            [gait, sol, info] = load_result(nlp, file_name);

            %% Extract optimization results
            
            
            save(fullfile(local_path, 'mat_output', sprintf('gait_%d', counter)), 'gait','sol','info');
            
            if h == 0 && vy == 0
                GaitLibrary = [GaitLibrary, gait]; %#ok<AGROW>
            end
            
            counter = counter + 1;
        end
    end
end

save(fullfile(local_path, 'GaitLibrary.mat'), 'GaitLibrary');
