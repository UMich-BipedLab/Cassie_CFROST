function [ hip_rotation_fun ] = hip_rotation( nlp )
%hip_rotation cost for hip_rotation
%   Creates SymFunction for a hip_rotation cost
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Compute function for hip_rotation cost
w = 100;
q_hip_rotation = nlp.Plant.States.x([8,15]);
cost = {sum((w.*q_hip_rotation).^2)};
hip_rotation_fun = SymFunction('hip_rotation', cost, {nlp.Plant.States.x});

end

