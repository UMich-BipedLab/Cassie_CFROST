function [ tauF_fun ] = tauF( nlp )
%tauF constraint for tauF
%   Creates SymFunction for a tauF constraint
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Compute function for tauF constraint
T  = SymVariable('t',[2,1]);
p = {SymVariable(tomatrix(nlp.Plant.VirtualConstraints.time.PhaseParams(:)))};
tauF_fun = SymFunction(['tauF_',nlp.Plant.Name], T(2) - p{1}(1), [{T},p]);

end

