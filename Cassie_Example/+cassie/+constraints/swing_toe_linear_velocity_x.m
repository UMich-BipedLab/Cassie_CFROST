function [ swing_toe_linear_velocity_x_fun ] = swing_toe_linear_velocity_x( nlp )
%swing_toe_linear_velocity_x constraint for swing_toe_linear_velocity_x
%   Creates SymFunction for a swing_toe_linear_velocity_x constraint
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
        error('Cannot create swing_toe_linear_velocity_x constraint. Unknown domain type')
end

% Compute function for swing_toe_linear_velocity_x constraint
J_swToe = swing_toe.computeBodyJacobian(nlp.Plant.numState);
v_swToe = J_swToe * nlp.Plant.States.dx;
swing_toe_linear_velocity_x_fun = SymFunction(['swing_toe_linear_velocity_x_',nlp.Plant.Name], v_swToe(1), {nlp.Plant.States.x, nlp.Plant.States.dx});

end

