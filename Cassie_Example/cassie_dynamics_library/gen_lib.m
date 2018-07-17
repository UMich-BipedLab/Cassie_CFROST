%% Setup
restoredefaultpath; matlabrc; clear; clc;
root = fileparts(pwd);
addpath(root);
PATHS = cassie.utils.getPaths(root);
frost_addpath;

% Settings
OMIT_CORIOLIS = true;

% Load hybrid system
robot = Cassie([PATHS.MODEL,'\urdf\cassie_with_sensors.urdf']);
robot.configureDynamics('DelayCoriolisSet',false,'OmitCoriolisSet',OMIT_CORIOLIS);
[sys, domains, guards] = cassie.load_behavior(robot, '');

%% Create optimization problem
num_grid.RightStance = 10;
num_grid.LeftStance = 10;
nlp = HybridTrajectoryOptimization('Cassie_TwoStep_SS',sys,num_grid,[],'EqualityConstraintBoundary',1e-4);
bounds = getBounds(robot);
nlp.configure(bounds);
addRunningCost(nlp.Phase(1), cassie.costs.torque(nlp.Phase(1)), 'u');
nlp.update;

%% Create Dynamics Constraints
mkdir('mex');
compileConstraint(nlp, 1, 'dynamics_equation', 'mex');
compileConstraint(nlp, 3, 'dynamics_equation', 'mex');
frost_c.createConstraints(nlp, 1, 'dynamics_equation', 'src/gen/', 'include/',[])
frost_c.createConstraints(nlp, 3, 'dynamics_equation', 'src/gen/', 'include/',[])
