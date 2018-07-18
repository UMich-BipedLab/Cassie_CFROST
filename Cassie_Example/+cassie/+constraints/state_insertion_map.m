function [ state_fun ] = state_insertion_map( nlp, phi, M)
%state constraint 
%   Creates SymFunction for a insertion map state constraint
%
%   Author: Ross Hartley
%     Date: 2018-06-20

% Create function for external state
selected = SymVariable('s',[2*nlp.Plant.numState,1]);
X  = SymVariable('x',[nlp.Plant.numState,1]);
dX  = SymVariable('dx',[nlp.Plant.numState,1]);

t = SymVariable('t');
alpha = SymVariable('a',[2*nlp.Plant.numState,M+1]);   
state_des = eval_math_fun('DesiredFunction',{str2mathstr('Bezier'), 2*nlp.Plant.numState, alpha, M});
state_des = subs(state_des, t, phi);
alpha = SymVariable(alpha(:));

constraint = selected.*([X;dX]-state_des);
state_fun = SymFunction('state_insertion_map', constraint, {X,dX}, {selected,alpha});

end

