function [ hip_abduction_fun ] = hip_abduction( nlp )
%hip_abduction cost for hip_abduction
%   Creates SymFunction for a hip_abduction cost
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Compute function for hip_abduction cost
w = 100;
q_hip_abduction = nlp.Plant.States.x([7,14]);
cost = {sum((w.*q_hip_abduction).^2)};
hip_abduction_fun = SymFunction('hip_abduction', cost, {nlp.Plant.States.x});

end

