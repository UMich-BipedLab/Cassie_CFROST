function [ distance_pelvis_to_stance_toe_fun ] = distance_pelvis_to_stance_toe( nlp )
%distance_pelvis_to_stance_toe constraint for distance_pelvis_to_stance_toe
%   Creates SymFunction for a distance_pelvis_to_stance_toe constraint
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Choose frames
switch nlp.Plant.Name
    case 'RightStance'
        p_toe = nlp.Plant.ContactPoints.RightToeBottom.computeCartesianPosition;
        
    case 'LeftStance'
        p_toe = nlp.Plant.ContactPoints.LeftToeBottom.computeCartesianPosition;

    otherwise
        error('Cannot create distance_pelvis_to_stance_toe constraint. Unknown domain type')
end

% distance_pelvis_to_stance_toe is defined as the Euclidean distance of 
% pelvis wrt stance toe
p_pelvis = nlp.Plant.States.x(1:3);
expr = sqrt((p_pelvis(1)-p_toe(1)).^2 + (p_pelvis(2)-p_toe(2)).^2 + (p_pelvis(3)-p_toe(3)).^2);
distance_pelvis_to_stance_toe_fun = SymFunction(['distance_pelvis_to_stance_toe_',nlp.Plant.Name], expr, {nlp.Plant.States.x});
    
end

