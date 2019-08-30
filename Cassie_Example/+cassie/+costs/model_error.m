function [ func ] = model_error( nlp )
%torque cost for torque
%   Creates SymFunction for a torque cost
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Compute function for torque cost
q = nlp.Plant.States.x;
dq = nlp.Plant.States.dx;
k = SymVariable('k');
T  = SymVariable('t',[2,1]);
t = (k - 1) / (nlp.NumNode - 1) * (T(2) - T(1)) + T(1);

cost = q(1) - exp(3*t)+exp(5*t);
func = SymFunction('modelerror', cost, {q, T}, {k});

end

