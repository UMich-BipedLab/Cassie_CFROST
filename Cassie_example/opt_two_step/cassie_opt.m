%% Setup
clear; clc; restoredefaultpath; matlabrc; if(exist('startup.m', 'file')); startup; end

root = get_root_path();
addpath(fullfile(root, 'Cassie_example'));
addpath(fullfile(root, 'submodules','Cassie_Model'));
addpath(fullfile(root, 'submodules','frost-dev'));
addpath(fullfile(root, 'submodules','C-Frost','Matlab'));
addpath(fullfile(root, 'Cassie_example', 'cassie_dynamics_library', 'mex'));
frost_addpath;
if ~exist('gen/opt','dir')
    mkdir('gen','opt');
end
addpath('gen/opt');

%% Settings
LOAD = false;  % load symbolic expressions instead of direct evaluation to save time, must save the symbolic expresssion first 
COMPILE = true; % compile MEX binaries
SAVE = true;    % save symbolic expressions for load directly
GENERATE_C = true; % generate files for C-FROST
GENERATE_C_COMPILE = true; % generate C++ source and header files for C-FROST
OMIT_CORIOLIS = true; % drop velocity terms
RUN_MATLAB_OPT = false; % run the optimization in MATLAB
%% Load hybrid system
robot = Cassie(fullfile(root, 'submodules','Cassie_Model','urdf','cassie.urdf'));
if LOAD
    robot.loadDynamics('gen/sym', OMIT_CORIOLIS);
    [sys, domains, guards] = cassie.load_behavior(robot, 'gen/sym');
else
    robot.configureDynamics('DelayCoriolisSet',OMIT_CORIOLIS,'OmitCoriolisSet',OMIT_CORIOLIS);
    [sys, domains, guards] = cassie.load_behavior(robot, '');
end

%% Create optimization problem
num_grid.RightStance = 10;
num_grid.LeftStance = 10;
nlp = HybridTrajectoryOptimization('two_step',sys,num_grid,[],'EqualityConstraintBoundary',1e-4);
nlp.update;

% Add domain specific constraints
nlp.Phase(1).Plant.UserNlpConstraint = @two_step.opt.right_stance;
nlp.Phase(2).Plant.UserNlpConstraint = @two_step.opt.left_impact;
nlp.Phase(3).Plant.UserNlpConstraint = @two_step.opt.left_stance;
nlp.Phase(4).Plant.UserNlpConstraint = @two_step.opt.right_impact;
nlp.update;

% Configure bounds and update
bounds = two_step.utils.getBounds(robot, 0, 0, 0);
if LOAD
    nlp.configure(bounds, 'gen/sym');
else
    nlp.configure(bounds);
end

% Add Multi-domain constraints
nlp = two_step.opt.multi_domain_constraints(nlp);
nlp.update;


%% Compile and Save
if COMPILE
    compileObjective(nlp, [], [], fullfile('gen', 'opt'));
    compileConstraint(nlp, [], [], fullfile('gen', 'opt'), 'dynamics_equation');
end

% Save
if SAVE
    if ~exist('gen/sym','dir')
        mkdir('gen','sym');
    end
    sys.saveExpression('gen/sym');
end

% Compile Single Constraint
% compileConstraint(nlp.Phase(1),'swingFootClearance_RightStance',PATHS.OPT_EXPORT);

% Remove Single Constraint
% removeConstraint(nlp.Phase(1),'dynamics_equation');
% removeConstraint(nlp.Phase(3),'dynamics_equation');
% removeConstraint(nlp.Phase(1),'BezierSymmetry');


%% Update bounds

% -------- Velocity ---------
velocity = [0.0;0.0];
nlp.Phase(1).updateConstrProp('average_velocity_RightStance', 'last', 'lb', velocity, 'ub', velocity);
nlp.Phase(3).updateConstrProp('average_velocity_LeftStance', 'last', 'lb', velocity, 'ub', velocity);

% ------- Step Height ---------
step_height = 0.0;
% Right Stance Guard
for k = 1:length(nlp.Phase(1).ConstrTable.u_leftToeHeight_cassie)-1
    nlp.Phase(1).ConstrTable.u_leftToeHeight_cassie(k).updateProp('lb', -Inf, 'ub', Inf);
end
nlp.Phase(1).ConstrTable.u_leftToeHeight_cassie(end).updateProp('lb', step_height, 'ub', step_height);
% Left Stance Guard
for k = 1:length(nlp.Phase(3).ConstrTable.u_rightToeHeight_cassie)-1
    nlp.Phase(3).ConstrTable.u_rightToeHeight_cassie(k).updateProp('lb', -Inf, 'ub', Inf);
end
nlp.Phase(3).ConstrTable.u_rightToeHeight_cassie(end).updateProp('lb', 2*step_height, 'ub', 2*step_height);
% ----------------------------



%% Run Optimization in Matlab
if RUN_MATLAB_OPT
    x0 = loadjson(fullfile('res', 'init.json'));
    x0 = x0';
    [gait, sol, info, total_time] = two_step.utils.solve(nlp, x0);
end
%% Create c-frost problem
if GENERATE_C
    CFROST_OPT_PATH = 'periodic';
    c_code_path = fullfile(CFROST_OPT_PATH, 'c_code');
    src_path = fullfile(CFROST_OPT_PATH, 'c_code', 'src');
    src_gen_path = fullfile(CFROST_OPT_PATH, 'c_code', 'src', 'gen');
    include_dir = fullfile(CFROST_OPT_PATH, 'c_code', 'include');
    data_path = fullfile(CFROST_OPT_PATH, 'c_code', 'res');
    data_path_lib = fullfile(CFROST_OPT_PATH, 'c_code', 'res_lib');
    local_path = fullfile(CFROST_OPT_PATH, 'local');
    local_res_path = fullfile(CFROST_OPT_PATH, 'local', 'res');
    local_output_path = fullfile(CFROST_OPT_PATH, 'local', 'output');
    local_output_lib_path = fullfile(CFROST_OPT_PATH, 'local', 'output_lib');
    local_log_path = fullfile(CFROST_OPT_PATH, 'local', 'log');

    
    if ~exist(c_code_path, 'dir')
        mkdir(c_code_path);
    end
    if ~exist(src_path, 'dir')
        mkdir(src_path);
    end
    if ~exist(src_gen_path, 'dir')
        mkdir(src_gen_path);
    end
    if ~exist(include_dir, 'dir')
        mkdir(include_dir);
    end
    if ~exist(data_path, 'dir')
        mkdir(data_path);
    end
    if ~exist(local_path, 'dir')
        mkdir(local_path);
    end
    if ~exist(local_res_path, 'dir')
        mkdir(local_res_path);
    end
    if ~exist(local_output_path, 'dir')
        mkdir(local_output_path);
    end
    if ~exist(local_log_path, 'dir')
        mkdir(local_log_path);
    end
    
    solver = IpoptApplication(nlp);
    
    if GENERATE_C_COMPILE
        [funcs, map] = frost_c.getAllFuncs(solver);
        frost_c.createFunctionListHeader(funcs, src_path, include_dir);
        frost_c.createIncludeHeader(funcs, include_dir);
        save(fullfile(local_res_path, 'funcs'), 'funcs');
        
        frost_c.createConstraints(nlp,[],[],src_gen_path, include_dir,{'dynamics_equation'})
        frost_c.createObjectives(nlp,[],[],src_gen_path, include_dir);
    end
    load(fullfile(local_res_path, 'funcs'))
    
    
    frost_c.createDataFile(solver, funcs, data_path, 'data');
    frost_c.createBoundsFile(solver, funcs, data_path, 'bounds');
    % frost_c.createInitialGuess(solver, data_path);
    copyfile(fullfile('res', 'init.json'), fullfile(data_path, 'init.json'));
    
    if ~exist(fullfile(c_code_path, 'CMakeLists.txt'), 'file')
        if ispc 
            root_path_str = strrep(strrep(strrep(root,'\','/'),'D:','/mnt/d'),'C:','/mnt/c');
        elseif isunix
            root_path_str = root;
        end
        
        fid = fopen('res/CMakeLists_sample.txt');
        F = fread(fid, '*char')';
        fclose(fid);
        F=strrep(F, 'ROOT_PATH', root_path_str);
        fid = fopen(fullfile(c_code_path, 'CMakeLists.txt'), 'w');
        fwrite(fid, F);
        fclose(fid);
        %         copyfile(fullfile('res', 'CMakeLists_sample.txt'), fullfile(c_code_path, 'CMakeLists.txt'));
    end
    if ~exist(fullfile(CFROST_OPT_PATH, 'ipopt.opt'), 'file')
        copyfile(fullfile('res', 'ipopt.opt'), fullfile(CFROST_OPT_PATH, 'ipopt.opt'));
    end
    copyfile(fullfile('res', 'run_all.sh'), fullfile(c_code_path, 'run_all.sh'));
end

% Example commands
% frost_c.createConstraints(nlp, 11, 'average_velocity_RightStance', src_gen_path, include_dir,'dynamics_equation')
% frost_c.createConstraints(nlp, 11, 'StartingStatedX_RightStanceDown1', src_gen_path, include_dir,'dynamics_equation')
% ./program --initial 'res/init.json' --options '../ipopt.opt' --data 'res/data.json' --bounds 'res/bounds.json' --output '../local/output/output.json'

% frost_c.createConstraints(nlp, 1, 'dynamics_equation', 'cassie_dynamics/src/gen/', 'cassie_dynamics/include',[])
% frost_c.createConstraints(nlp, 3, 'dynamics_equation', 'cassie_dynamics/src/gen/', 'cassie_dynamics/include',[])


