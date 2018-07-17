function [ average_yaw_fun ] = average_yaw( nlp )
%average_yaw constraint for average_yaw
%   Creates SymFunction for a average_yaw constraint
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Compute function for average_yaw constraint
X = cell(1,nlp.NumNode);
for i = 1:nlp.NumNode
    X{i}  = SymVariable(['x',num2str(i)],[nlp.Plant.numState,1]);
    if i == 1
        average_yaw = X{i}(6);
    else
        average_yaw = average_yaw + X{i}(6);
    end
end
average_yaw = average_yaw/nlp.NumNode;
average_yaw_fun = SymFunction(['average_yaw_', nlp.Plant.Name], average_yaw, X);

end

