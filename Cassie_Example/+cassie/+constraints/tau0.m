function [ tau0_fun ] = tau0( nlp )
%tau0 constraint for tau0
%   Creates SymFunction for a tau0 constraint
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Compute function for tau0 constraint
T  = SymVariable('t',[2,1]);
p = {SymVariable(tomatrix(nlp.Plant.VirtualConstraints.time.PhaseParams(:)))};
tau0_fun = SymFunction(['tau0_',nlp.Plant.Name], T(1) - p{1}(2), [{T},p]);

end

