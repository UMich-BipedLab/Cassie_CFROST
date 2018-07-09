Vx_range = linspace(-1, 1, 9);
Vy_range = 0;linspace(-0.3, 0.3, 11);
H_range = 0;linspace(-0.15, 0.15, 11);

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
            sol = loadjson(fullfile(local_output_lib_path, sprintf('output_%d.json', counter)));

            %% Extract optimization results
            [tspan, states, inputs, params] = exportSolution(nlp, sol);
            solution = struct();
            solution.x = sol;
            solution.tspan = tspan;
            solution.states = states;
            solution.inputs = inputs;
            solution.params = params;
            
            gait = struct();
            gait.opt = solution;
            gait.velocity = velocity;
            gait.step_height = step_height;
            
            save(fullfile(local_path, 'mat_output', sprintf('gait_%d', counter)), 'solution');
            
            if h == 0 && vy == 0
                GaitLibrary = [GaitLibrary, gait];
            end
            
            counter = counter + 1;
        end
    end
end

save(fullfile(local_path, 'GaitLibrary.mat'), 'GaitLibrary');
