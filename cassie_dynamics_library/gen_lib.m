%% Setup
restoredefaultpath; matlabrc; clear; clc;
root = fileparts(pwd);
addpath(root);
PATHS = cassie.utils.getPaths(root);
frost_addpath;

% Settings
OMIT_CORIOLIS = false;

% Load hybrid system
robot = Cassie([PATHS.MODEL,'\urdf\cassie_with_sensors.urdf']);
robot.configureDynamics('DelayCoriolisSet',false,'OmitCoriolisSet',OMIT_CORIOLIS);
[sys, domains, guards] = cassie.load_behavior(robot, '');

%% Create optimization problem
num_grid.RightStance = 10;
num_grid.LeftStance = 10;
nlp = HybridTrajectoryOptimization('Cassie_TwoStep_SS',sys,num_grid,[],'EqualityConstraintBoundary',1e-4);
nlp.update;
bounds = getBounds(robot);
nlp.configure(bounds);
solver = IpoptApplication(nlp);

%% Create Dynamics Constraints
frost_c.createConstraints(nlp, 1, 'dynamics_equation', 'src/gen/', 'include/',[])
frost_c.createConstraints(nlp, 3, 'dynamics_equation', 'src/gen/', 'include/',[])
