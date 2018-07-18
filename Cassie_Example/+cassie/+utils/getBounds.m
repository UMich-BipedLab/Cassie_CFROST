function bounds = getBounds(robot, varargin)

% Parse inputs
p = inputParser; 
p.addOptional('use_bezier_symmetry', false);
p.addOptional('use_average_velocity', false);
p.addOptional('use_step_length', false);
p.parse(varargin{:});
parser_results = p.Results;

% Get Bounds
model_bounds = robot.getLimits();
bounds = struct();

model_bounds.states.x.lb(1:3) = [-10,-10,-10];
model_bounds.states.x.ub(1:3) = [10,10,10];

model_bounds.states.x.lb(4:6) = deg2rad(-5);
model_bounds.states.x.ub(4:6) = deg2rad(5);

% model_bounds.states.x.lb([7,8,14,15]) = deg2rad(-5);
% model_bounds.states.x.ub([7,8,14,15]) = deg2rad(5);

model_bounds.states.x.lb([7,14]) = deg2rad(-0);
model_bounds.states.x.ub([7,14]) = deg2rad(0);
model_bounds.states.x.lb([8,15]) = deg2rad(-0);
model_bounds.states.x.ub([8,15]) = deg2rad(0);

model_bounds.use_bezier_symmetry = parser_results.use_bezier_symmetry;
model_bounds.use_average_velocity = parser_results.use_average_velocity;
model_bounds.use_step_length = parser_results.use_step_length;

% model_bounds.inputs.Control.u.lb([2,7]) = -0.5;
% model_bounds.inputs.Control.u.ub([2,7]) = 0.5;
model_bounds.inputs.Control.u.lb([5,10]) = -0.01;
model_bounds.inputs.Control.u.ub([5,10]) = 0.01;

model_bounds.average_velocity.lb = [0.0,0.0];
model_bounds.average_velocity.ub = [0.0,0.0];

model_bounds.average_roll.lb = deg2rad(0);
model_bounds.average_roll.ub = deg2rad(0);
model_bounds.average_pitch.lb = deg2rad(0);
model_bounds.average_pitch.ub = deg2rad(0);
model_bounds.average_yaw.lb = deg2rad(0);
model_bounds.average_yaw.ub = deg2rad(0);
model_bounds.average_hip_abduction.lb = deg2rad(0);
model_bounds.average_hip_abduction.ub = deg2rad(0);
model_bounds.average_hip_rotation.lb = deg2rad(0);
model_bounds.average_hip_rotation.ub = deg2rad(0);

model_bounds.step_length.lb = [0.0,0.0];
model_bounds.step_length.ub = [0.0,0.0];

model_bounds.foot_clearance.lb = 0.15;
model_bounds.foot_clearance.ub = 0.3;

model_bounds.body_to_to_length.lb = 0.3;
model_bounds.body_to_to_length.ub = 1.0;

model_bounds.toe_to_toe_width.lb = 0.10; % 0.27 nominal width
model_bounds.toe_to_toe_width.ub = 0.40;

%% Right Stance
bounds.RightStance = model_bounds;

bounds.RightStance.time.t0.lb = 0;
bounds.RightStance.time.t0.ub = 0;
bounds.RightStance.time.t0.x0 = 0;

bounds.RightStance.time.tf.lb = 0.4;
bounds.RightStance.time.tf.ub = 0.4;
bounds.RightStance.time.tf.x0 = 0.4;

bounds.RightStance.time.duration.lb = 0.4;
bounds.RightStance.time.duration.ub = 0.4;
bounds.RightStance.time.duration.x0 = 0.4;

bounds.RightStance.inputs.ConstraintWrench.fRightToeBottom.lb = -10000;
bounds.RightStance.inputs.ConstraintWrench.fRightToeBottom.ub = 10000;
bounds.RightStance.inputs.ConstraintWrench.fRightToeBottom.x0 = 100;

bounds.RightStance.inputs.ConstraintWrench.ffixedKneeSpring.lb = -10000;
bounds.RightStance.inputs.ConstraintWrench.ffixedKneeSpring.ub = 10000;
bounds.RightStance.inputs.ConstraintWrench.ffixedKneeSpring.x0 = 100;

bounds.RightStance.inputs.ConstraintWrench.ffourBar.lb = -10000;
bounds.RightStance.inputs.ConstraintWrench.ffourBar.ub = 10000;
bounds.RightStance.inputs.ConstraintWrench.ffourBar.x0 = 100;

bounds.RightStance.params.pfixedKneeSpring.lb = -0*ones(2,1);
bounds.RightStance.params.pfixedKneeSpring.ub = 0*ones(2,1);
bounds.RightStance.params.pfixedKneeSpring.x0 = zeros(2,1);

bounds.RightStance.params.pfourBar.lb = -0*ones(2,1);
bounds.RightStance.params.pfourBar.ub = 0*ones(2,1);
bounds.RightStance.params.pfourBar.x0 = zeros(2,1);

bounds.RightStance.params.pRightToeBottom.lb = [0;0;0;0;-pi/2];
bounds.RightStance.params.pRightToeBottom.ub = [0;0;0;0;-pi/2];
bounds.RightStance.params.pRightToeBottom.x0 = [0;0;0;0;-pi/2];

bounds.RightStance.params.atime.lb = -10*ones(6*10,1);
bounds.RightStance.params.atime.ub = 10*ones(6*10,1);
bounds.RightStance.params.atime.x0 = zeros(6*10,1);

bounds.RightStance.params.ptime.lb = [bounds.RightStance.time.tf.lb, bounds.RightStance.time.t0.lb];
bounds.RightStance.params.ptime.ub = [bounds.RightStance.time.tf.ub, bounds.RightStance.time.t0.ub];
bounds.RightStance.params.ptime.x0 = [bounds.RightStance.time.t0.x0, bounds.RightStance.time.tf.x0];

bounds.RightStance.time.kp = 100;
bounds.RightStance.time.kd = 20;



%% Left Stance
bounds.LeftStance = model_bounds;

bounds.LeftStance.time.t0.lb = 0;
bounds.LeftStance.time.t0.ub = 0;
bounds.LeftStance.time.t0.x0 = 0;

bounds.LeftStance.time.tf.lb = 0.4;
bounds.LeftStance.time.tf.ub = 0.4;
bounds.LeftStance.time.tf.x0 = 0.4;

bounds.LeftStance.time.duration.lb = 0.4;
bounds.LeftStance.time.duration.ub = 0.4;
bounds.LeftStance.time.duration.x0 = 0.4;

bounds.LeftStance.inputs.ConstraintWrench.fLeftToeBottom.lb = -10000;
bounds.LeftStance.inputs.ConstraintWrench.fLeftToeBottom.ub = 10000;
bounds.LeftStance.inputs.ConstraintWrench.fLeftToeBottom.x0 = 100;

bounds.LeftStance.inputs.ConstraintWrench.ffixedKneeSpring.lb = -10000;
bounds.LeftStance.inputs.ConstraintWrench.ffixedKneeSpring.ub = 10000;
bounds.LeftStance.inputs.ConstraintWrench.ffixedKneeSpring.x0 = 100;

bounds.LeftStance.inputs.ConstraintWrench.ffourBar.lb = -10000;
bounds.LeftStance.inputs.ConstraintWrench.ffourBar.ub = 10000;
bounds.LeftStance.inputs.ConstraintWrench.ffourBar.x0 = 100;

bounds.LeftStance.params.pfixedKneeSpring.lb = -0*ones(2,1);
bounds.LeftStance.params.pfixedKneeSpring.ub = 0*ones(2,1);
bounds.LeftStance.params.pfixedKneeSpring.x0 = zeros(2,1);

bounds.LeftStance.params.pfourBar.lb = -0*ones(2,1);
bounds.LeftStance.params.pfourBar.ub = 0*ones(2,1);
bounds.LeftStance.params.pfourBar.x0 = zeros(2,1);

bounds.LeftStance.params.pLeftToeBottom.lb = [-10;-10;-10;0;-pi/2];
bounds.LeftStance.params.pLeftToeBottom.ub = [10;10;10;0;-pi/2];
bounds.LeftStance.params.pLeftToeBottom.x0 = [0;0;0;0;-pi/2];

bounds.LeftStance.params.atime.lb = -10*ones(6*10,1);
bounds.LeftStance.params.atime.ub = 10*ones(6*10,1);
bounds.LeftStance.params.atime.x0 = zeros(6*10,1);

bounds.LeftStance.params.ptime.lb = [bounds.RightStance.time.tf.lb, bounds.RightStance.time.t0.lb];
bounds.LeftStance.params.ptime.ub = [bounds.RightStance.time.tf.ub, bounds.RightStance.time.t0.ub];
bounds.LeftStance.params.ptime.x0 = [bounds.RightStance.time.t0.x0, bounds.RightStance.time.tf.x0];

bounds.LeftStance.time.kp = 100;
bounds.LeftStance.time.kd = 20;

%% Impacts

% Right Impact
bounds.RightImpact = model_bounds;
% Left Impact
bounds.LeftImpact = model_bounds;
% Left Impact Relabel
bounds.LeftImpactRelabel = model_bounds;

end
