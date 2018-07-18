function [ right_toe_height_fun ] = right_toe_height( nlp )
%right_toe_height constraint
%   Creates SymFunction for a right_toe_height constraint
%
%   Author: Ross Hartley
%     Date: 2018-03-22

H_WR = nlp.Plant.ContactPoints.RightToeBottom.computeForwardKinematics;
p_WR = H_WR(1:3,end);
expr = p_WR(3);
right_toe_height_fun = SymFunction('right_toe_height', expr, {nlp.Plant.States.x});
    
end

