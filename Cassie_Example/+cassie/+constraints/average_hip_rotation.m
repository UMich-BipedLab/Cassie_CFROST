function [ average_hip_rotation_fun ] = average_hip_rotation( nlp )
%average_hip_rotation constraint for average_hip_rotation
%   Creates SymFunction for a average_hip_rotation constraint
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Compute function for average_hip_rotation constraint
X = cell(1,nlp.NumNode);
for i = 1:nlp.NumNode
    X{i}  = SymVariable(['x',num2str(i)],[nlp.Plant.numState,1]);
    if i == 1
        average_hip_rotation = X{i}([8,15]);
    else
        average_hip_rotation = average_hip_rotation + X{i}([8,15]);
    end
end
average_hip_rotation = average_hip_rotation/nlp.NumNode;
average_hip_rotation_fun = SymFunction(['average_hip_rotation_', nlp.Plant.Name], average_hip_rotation, X);

end

