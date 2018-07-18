function [ average_hip_abduction_fun ] = average_hip_abduction( nlp )
%average_hip_abduction constraint for average_hip_abduction
%   Creates SymFunction for a average_hip_abduction constraint
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Compute function for average_hip_abduction constraint
X = cell(1,nlp.NumNode);
for i = 1:nlp.NumNode
    X{i}  = SymVariable(['x',num2str(i)],[nlp.Plant.numState,1]);
    if i == 1
        average_hip_abduction = X{i}([7,14]);
    else
        average_hip_abduction = average_hip_abduction + X{i}([7,14]);
    end
end
average_hip_abduction = average_hip_abduction/nlp.NumNode;
average_hip_abduction_fun = SymFunction(['average_hip_abduction_', nlp.Plant.Name], average_hip_abduction, X);

end

