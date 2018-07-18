function [ y2 ] = actuated_joints( robot, load_path )
% Virtual contraint consisting of all actuated joints

% phase variable: time
t = SymVariable('t');
p = SymVariable('p',[2,1]);
tau = (t-p(2))/(p(1)-p(2));

% relative degree two outputs:
y_hip_abduction_left = robot.States.x('hip_abduction_left');
y_hip_rotation_left = robot.States.x('hip_rotation_left');
y_hip_flexion_left = robot.States.x('hip_flexion_left');
y_knee_joint_left = robot.States.x('knee_joint_left');
y_toe_joint_left= robot.States.x('toe_joint_left');
y_hip_abduction_right = robot.States.x('hip_abduction_right');
y_hip_rotation_right = robot.States.x('hip_rotation_right');
y_hip_flexion_right = robot.States.x('hip_flexion_right');
y_knee_joint_right = robot.States.x('knee_joint_right');
y_toe_joint_right = robot.States.x('toe_joint_right');

ya_2 = [y_hip_abduction_left;
    y_hip_rotation_left;
    y_hip_flexion_left;
    y_knee_joint_left;
    y_toe_joint_left;
    y_hip_abduction_right;
    y_hip_rotation_right;
    y_hip_flexion_right;
    y_knee_joint_right;
    y_toe_joint_right];

y2_label = {'hip_abduction_left',...
    'hip_rotation_left',...
    'hip_flexion_left',...
    'knee_joint_left',...
    'toe_joint_left',...
    'hip_abduction_right',...
    'hip_rotation_right',...
    'hip_flexion_right',...
    'knee_joint_right',...
    'toe_joint_right'};

y2 = VirtualConstraint(robot,ya_2,'time','DesiredType','Bezier','PolyDegree',5,...
    'RelativeDegree',2,'OutputLabel',{y2_label},'PhaseType','TimeBased',...
    'PhaseVariable',tau,'PhaseParams',p,'Holonomic',true, 'LoadPath', load_path);

end

