function [ left_toe_height_fun ] = left_toe_height( nlp )
%left_toe_height constraint
%   Creates SymFunction for a left_toe_height constraint
%
%   Author: Ross Hartley
%     Date: 2018-03-22

H_WL = nlp.Plant.ContactPoints.LeftToeBottom.computeForwardKinematics;
p_WL = H_WL(1:3,end);
expr = p_WL(3);
left_toe_height_fun = SymFunction('left_toe_height', expr, {nlp.Plant.States.x});
    
end

