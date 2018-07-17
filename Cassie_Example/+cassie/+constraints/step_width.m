function [ step_width_fun ] = step_width( nlp )
%STEP_width constraint for step width
%   Creates SymFunction for a step_width constraint
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Choose frames
switch nlp.Plant.Name
    case 'RightStance'
        H_W1 = nlp.Plant.ContactPoints.RightToeBottom.computeForwardKinematics;
        H_W2 = nlp.Plant.ContactPoints.LeftToeBottom.computeForwardKinematics;
        
    case 'LeftStance'
        H_W1 = nlp.Plant.ContactPoints.LeftToeBottom.computeForwardKinematics;
        H_W2 = nlp.Plant.ContactPoints.RightToeBottom.computeForwardKinematics;
        
    otherwise
        error('Cannot create step_width constraint. Unknown domain type')
end

% Step width is defined as the z-distance of frame2 wrt frame1
% (measured in frame1)
H_12 = H_W1 \ H_W2;
p_12 = H_12(1:3,end);
expr = p_12(1);
step_width_fun = SymFunction(['step_width_', nlp.Plant.Name], expr, {nlp.Plant.States.x});
    
end

