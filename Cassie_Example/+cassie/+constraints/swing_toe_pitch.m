function [ swing_toe_pitch_fun ] = swing_toe_pitch( nlp )
%swing_toe_pitch constraint for swing_toe_pitch
%   Creates SymFunction for a swing_toe_pitch constraint
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
        error('Cannot create swing_toe_pitch constraint. Unknown domain type')
end

% Compute function for swing_toe_pitch constraint
euler_angles = swing_toe.computeEulerAngle();
swing_toe_pitch_fun = SymFunction(['swing_toe_pitch_',nlp.Plant.Name], euler_angles(2), {nlp.Plant.States.x});

end

