function [ torque_fun ] = torque( nlp )
%torque cost for torque
%   Creates SymFunction for a torque cost
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Compute function for torque cost
u = nlp.Plant.Inputs.Control.u;
cost = sum((u).^2);
torque_fun = SymFunction('torque', cost, {u});

end

