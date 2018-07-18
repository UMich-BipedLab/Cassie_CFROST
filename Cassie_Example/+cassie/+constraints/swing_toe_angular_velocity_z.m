function [ swing_toe_angular_velocity_z_fun ] = swing_toe_angular_velocity_z( nlp )
%swing_toe_angular_velocity_z constraint for swing_toe_angular_velocity_z
%   Creates SymFunction for a swing_toe_angular_velocity_z constraint
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
        error('Cannot create swing_toe_angular_velocity_z constraint. Unknown domain type')
end

% Compute function for swing_toe_angular_velocity_z constraint
J_swToe = swing_toe.computeBodyJacobian(nlp.Plant.numState);
v_swToe = J_swToe * nlp.Plant.States.dx;
swing_toe_angular_velocity_z_fun = SymFunction(['swing_toe_angular_velocity_z_',nlp.Plant.Name], v_swToe(6), {nlp.Plant.States.x, nlp.Plant.States.dx});

end

