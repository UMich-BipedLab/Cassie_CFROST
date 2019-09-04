%% Load c_frost results
%sol = loadjson(fullfile(local_output_path,'output.json'));
file_name = fullfile(local_output_path,'sol.json');
[gait, sol, info] = load_result(nlp, file_name);
% checkConstraints(nlp, sol, 1e-4, 'log.txt')

%% Animate 
% set 'SkipExporting' option to false for the first time to allow
mkdir('gen','anim');
conGUI = cassie.load_animation(robot, gait, [], ...
    'SkipExporting', true, ... % set 'SkipExporting' option to false for the first time to allow the code to generate functions used for animation
    'ExportPath','gen/anim');   % the directory to export functions

%%

tSol = [gait(1).tspan,gait(3).tspan];
xSol = [gait(1).states.x,gait(3).states.x];


%
close all
figure(1)
grid on; box on; hold on;

plot(tSol, xSol(1,:)+(double(xSol_num(0))-xSol(1)))
fplot(xSol_num, [0 double(Ts)])

xlim([0 double(Ts)])
xlabel('Time (s)')
ylabel('horizontal position (m)')
legend('Cassie FROST','LIP')