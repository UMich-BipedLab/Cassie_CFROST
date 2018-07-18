function [ perodicity_fun ] = periodicity( nlp )
%periodicity constraint for periodicity
%   Creates SymFunction for a periodicity constraint
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Create function for periodicity constraint
selected = SymVariable('s',[2*nlp.Plant.numState,1]);
X1  = SymVariable('xc',[nlp.Plant.numState,1]);
X2  = SymVariable('x',[nlp.Plant.numState,1]);
dX1  = SymVariable('dxc',[nlp.Plant.numState,1]);
dX2  = SymVariable('dx',[nlp.Plant.numState,1]);
constraint = selected.*([X2-X1; dX2-dX1]);
perodicity_fun = SymFunction('perodicity_constraint', constraint, {X1,dX1,X2,dX2}, {selected});

end

