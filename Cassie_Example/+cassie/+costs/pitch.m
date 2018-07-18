function [ pitch_fun ] = pitch( nlp )
%pitch cost for pitch
%   Creates SymFunction for a pitch cost
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Compute function for pitch cost
w = 100;
q_torso = nlp.Plant.States.x(5);
cost = {sum((w.*q_torso).^2)};
pitch_fun = SymFunction('pitch', cost, {nlp.Plant.States.x});

end

