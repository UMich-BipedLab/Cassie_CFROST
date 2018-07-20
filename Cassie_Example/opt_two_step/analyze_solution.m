%% Load c_frost results
%sol = loadjson(fullfile(local_output_path,'output.json'));
file_name = fullfile(local_output_path,'sol.json');
[gait, sol, info] = load_result(nlp, file_name);
% checkConstraints(nlp, sol, 1e-4, 'log.txt')

%% Animate 
% set 'SkipExporting' option to false for the first time to allow
mkdir('gen','anim');
conGUI = cassie.load_animation(robot, gait, [], ...
    'SkipExporting', false, ... % set 'SkipExporting' option to false for the first time to allow the code to generate functions used for animation
    'ExportPath','gen/anim');   % the directory to export functions