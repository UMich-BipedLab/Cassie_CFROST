function [ stair_fun ] = stair_clearance( nlp )
%periodicity constraint for periodicity
%   Creates SymFunction for a periodicity constraint
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Choose frames
switch nlp.Plant.Name
    case 'RightStance'
        H = nlp.Plant.ContactPoints.LeftToeBottom.computeForwardKinematics;
        
    case 'LeftStance'
        H = nlp.Plant.ContactPoints.RightToeBottom.computeForwardKinematics;
        
    otherwise
        error('Cannot create step_height constraint. Unknown domain type')
end

% Planar version
p = H(1:3,end);
alpha = SymVariable('a',[1,4]);
expr = p(3) - (alpha(1) + alpha(2)*p(1) + alpha(3)*p(1)*p(1) + alpha(4)*p(1)*p(1)*p(1));
stair_fun = SymFunction(['stair_clearance_', nlp.Plant.Name], expr, {nlp.Plant.States.x}, {alpha});
    
end

