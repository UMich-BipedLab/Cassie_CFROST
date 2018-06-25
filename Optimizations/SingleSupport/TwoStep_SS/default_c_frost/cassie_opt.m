%% Setup
restoredefaultpath; matlabrc; clear; clc;
root = fileparts(fileparts(fileparts(fileparts(pwd))));
addpath(root);
PATHS = cassie.utils.getPaths(root);
frost_addpath;

% Settings
LOAD = false;
COMPILE = false;
SAVE = false;
GENERATE_C = true;
GENERATE_C_COMPILE = true;

% Load hybrid system
robot = Cassie([PATHS.MODEL,'\urdf\cassie_with_sensors.urdf']);
if LOAD
    robot.loadDynamics(PATHS.MODEL_LOAD, true);
    [sys, domains, guards] = cassie.load_behavior(robot, PATHS.OPT_LOAD);
else
    robot.configureDynamics('DelayCoriolisSet',true,'OmitCoriolisSet',true);
    [sys, domains, guards] = cassie.load_behavior(robot, '');
end

%% Create optimization problem
num_grid.RightStance = 10;
num_grid.LeftStance = 10;
nlp = HybridTrajectoryOptimization('Cassie_TwoStep_SS',sys,num_grid,[],'EqualityConstraintBoundary',1e-4);
nlp.update;

% Add domain specific constraints
nlp.Phase(1).Plant.UserNlpConstraint = @TwoStep_SS_default_c_frost.opt.right_stance;
nlp.Phase(2).Plant.UserNlpConstraint = @TwoStep_SS_default_c_frost.opt.left_impact;
nlp.Phase(3).Plant.UserNlpConstraint = @TwoStep_SS_default_c_frost.opt.left_stance;
nlp.Phase(4).Plant.UserNlpConstraint = @TwoStep_SS_default_c_frost.opt.right_impact;
nlp.update;

% Configure bounds and update
bounds = TwoStep_SS_default_c_frost.utils.getBounds(robot);
if LOAD
    nlp.configure(bounds, PATHS.OPT_LOAD);
else
    nlp.configure(bounds);
end

% Add Multi-domain constraints
% nlp = TwoStep_SS_default_c_frost.opt.multi_domain_constraints(nlp);
% nlp.update;


%% Compile and Save
if COMPILE
    compileObjective(nlp,[],[],PATHS.OPT_EXPORT);
%     compileConstraint(nlp,[],[],PATHS.OPT_EXPORT);
    compileConstraint(nlp,[],[],PATHS.OPT_EXPORT,'dynamics_equation');
%     nlp.Phase(3).ConstrTable.dynamics_equation(1).SummandFunctions(end).SymFun.export(PATHS.OPT_EXPORT, 'ForceExport',true)
%     nlp.Phase(3).ConstrTable.dynamics_equation(1).SummandFunctions(end).SymFun.exportJacobian(PATHS.OPT_EXPORT, 'ForceExport',true)
end

% Save
if SAVE
    sys.saveExpression(PATHS.OPT_LOAD);
end

% Compile Single Constraint
% compileConstraint(nlp.Phase(1),'swingFootClearance_RightStance',PATHS.OPT_EXPORT);

% Remove Single Constraint
% removeConstraint(nlp.Phase(1),'dynamics_equation');
% removeConstraint(nlp.Phase(3),'dynamics_equation');
% removeConstraint(nlp.Phase(1),'BezierSymmetry');


%% Solve Optimization Problem 

% -------- Velocity ---------
velocity = [1;0.3];
nlp.Phase(1).updateConstrProp('average_velocity_RightStance', 'last', 'lb', velocity, 'ub', velocity);
nlp.Phase(3).updateConstrProp('average_velocity_LeftStance', 'last', 'lb', velocity, 'ub', velocity);

% ------- Step Height ---------
step_height = 0.2;
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



%% Create Optimization Problem 

% Create Ipopt solver
ipopt_options.max_iter         = 3000;
ipopt_options.tol              = 1e-2;
ipopt_options.dual_inf_tol           = 0e0;
ipopt_options.constr_viol_tol        = 1e-4;
ipopt_options.compl_inf_tol          = 1e0;
    
solver = IpoptApplication(nlp, ipopt_options);
% solver = IpoptApplication(nlp);
old = load('x0');


%% Create c-frost problem
ROOT_PATH = 'periodic';
c_code_path = fullfile(ROOT_PATH, 'c_code');
src_path = fullfile(ROOT_PATH, 'c_code', 'src');
src_gen_path = fullfile(ROOT_PATH, 'c_code', 'src', 'gen');
include_dir = fullfile(ROOT_PATH, 'c_code', 'include');
data_path = fullfile(ROOT_PATH, 'c_code', 'res');
local_path = fullfile(ROOT_PATH, 'local');
local_res_path = fullfile(ROOT_PATH, 'local', 'res');
local_output_path = fullfile(ROOT_PATH, 'local', 'output');
local_log_path = fullfile(ROOT_PATH, 'local', 'log');

if GENERATE_C
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
    
    if GENERATE_C_COMPILE
        [funcs, map] = frost_c.getAllFuncs(solver);
        frost_c.createFunctionListHeader(funcs, src_path, include_dir);
        frost_c.createIncludeHeader(funcs, include_dir);
        save(fullfile(local_res_path, 'funcs'), 'funcs');
%         frost_c.createConstraints(nlp,[],[],src_gen_path, include_dir,{'dynamics_equation','dxDiscreteMapLeftImpact','dxDiscreteMapRightImpact'})
        frost_c.createConstraints(nlp,[],[],src_gen_path, include_dir,{'dynamics_equation'})
        frost_c.createObjectives(nlp,[],[],src_gen_path, include_dir);
    end
    load(fullfile(local_res_path, 'funcs'))
    frost_c.createDataFile(solver, funcs, data_path, 'data');
    frost_c.createBoundsFile(solver, funcs, data_path, 'bounds');
    frost_c.createInitialGuess(solver, data_path, old.solution.x);
    
    if ~exist(fullfile(c_code_path, 'CMakeLists.txt'), 'file')
        copyfile(fullfile(PATHS.RES, 'CMakeLists_sample.txt'), fullfile(c_code_path, 'CMakeLists.txt'));
    end
    if ~exist(fullfile(ROOT_PATH, 'ipopt.opt'), 'file')
        copyfile(fullfile(PATHS.RES, 'ipopt.opt'), fullfile(ROOT_PATH, 'ipopt.opt'));
    end
    if ~exist(fullfile(ROOT_PATH, 'run_all.sh'), 'file')
        copyfile(fullfile(PATHS.RES, 'run_all.sh'), fullfile(ROOT_PATH, 'run_all.sh'));
    end    
end

% Example commands
% frost_c.createConstraints(nlp, 11, 'average_velocity_RightStance', src_gen_path, include_dir,'dynamics_equation')
% frost_c.createConstraints(nlp, 11, 'StartingStatedX_RightStanceDown1', src_gen_path, include_dir,'dynamics_equation')
% ./program --initial 'res/init.json' --options '../ipopt.opt' --data 'res/data.json' --bounds 'res/bounds.json' --output '../local/output/output.json'

% frost_c.createConstraints(nlp, 1, 'dynamics_equation', 'cassie_dynamics/src/gen/', 'cassie_dynamics/include',[])
% frost_c.createConstraints(nlp, 3, 'dynamics_equation', 'cassie_dynamics/src/gen/', 'cassie_dynamics/include',[])

%% Load c_frost results
sol = loadjson('periodic/local/output/output.json');

%% Extract optimization results
[tspan, states, inputs, params] = exportSolution(nlp, sol);
solution.x = sol;
solution.tspan = tspan;
solution.states = states;
solution.inputs = inputs;
solution.params = params;
 
% checkConstraints(nlp, sol, 1e-4, 'log.txt')

%% Animate 
q_log = [solution.states{1}.x, solution.states{3}.x]; 
t_log = [solution.tspan{1}, solution.tspan{1}(end) + solution.tspan{3}];
conGUI = cassie.load_animation(robot, t_log, q_log)';


