function [ roll_fun ] = roll( nlp )
%roll cost for roll
%   Creates SymFunction for a roll cost
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Compute function for roll cost
w = 100;
q_torso = nlp.Plant.States.x(6);
cost = {sum((w.*q_torso).^2)};
roll_fun = SymFunction('roll', cost, {nlp.Plant.States.x});

end

