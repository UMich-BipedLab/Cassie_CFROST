function [ state_fun ] = state_external( nlp )
%state constraint 
%   Creates SymFunction for a external state constraint
%
%   Author: Ross Hartley
%     Date: 2018-04-27

% Create function for external state
selected = SymVariable('s',[2*nlp.Plant.numState,1]);
X1  = SymVariable('xc',[nlp.Plant.numState,1]);
X2  = SymVariable('x',[nlp.Plant.numState,1]);
dX1  = SymVariable('dxc',[nlp.Plant.numState,1]);
dX2  = SymVariable('dx',[nlp.Plant.numState,1]);
constraint = selected.*([X2-X1; dX2-dX1]);
state_fun = SymFunction('state_external_constraint', constraint, {X1,dX1}, {selected,X2,dX2});

end

