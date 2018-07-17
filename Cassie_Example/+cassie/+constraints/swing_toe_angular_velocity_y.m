function [ swing_toe_angular_velocity_y_fun ] = swing_toe_angular_velocity_y( nlp )
%swing_toe_angular_velocity_y constraint for swing_toe_angular_velocity_y
%   Creates SymFunction for a swing_toe_angular_velocity_y constraint
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Choose frames
switch nlp.Plant.Name
    case 'RightStance'
        swing_toe = nlp.Plant.ContactPoints.LeftToeBottom;
        
    case 'LeftStance'
        swing_toe = nlp.Plant.ContactPoints.RightToeBottom;
        
    otherwise
        error('Cannot create swing_toe_angular_velocity_y constraint. Unknown domain type')
end

% Compute function for swing_toe_angular_velocity_y constraint
J_swToe = swing_toe.computeBodyJacobian(nlp.Plant.numState);
v_swToe = J_swToe * nlp.Plant.States.dx;
swing_toe_angular_velocity_y_fun = SymFunction(['swing_toe_angular_velocity_y_',nlp.Plant.Name], v_swToe(5), {nlp.Plant.States.x, nlp.Plant.States.dx});

end

