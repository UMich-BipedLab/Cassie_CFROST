function [ step_length_fun ] = step_length( nlp )
%STEP_LENGTH constraint for step length
%   Creates SymFunction for a step_length constraint
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
        error('Cannot create step_length constraint. Unknown domain type')
end

% Step length is defined as the y-distance of frame2 wrt frame1
% (measured in frame1)
H_12 = H_W1 \ H_W2;
p_12 = H_12(1:3,end);
expr = p_12(2);
step_length_fun = SymFunction(['step_length_', nlp.Plant.Name], expr, {nlp.Plant.States.x});
        
end

