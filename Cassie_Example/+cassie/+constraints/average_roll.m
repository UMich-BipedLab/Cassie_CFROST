function [ average_roll_fun ] = average_roll( nlp )
%average_roll constraint for average_roll
%   Creates SymFunction for a average_roll constraint
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Compute function for average_roll constraint
X = cell(1,nlp.NumNode);
for i = 1:nlp.NumNode
    X{i}  = SymVariable(['x',num2str(i)],[nlp.Plant.numState,1]);
    if i == 1
        average_roll = X{i}(4);
    else
        average_roll = average_roll + X{i}(4);
    end
end
average_roll = average_roll/nlp.NumNode;
average_roll_fun = SymFunction(['average_roll_', nlp.Plant.Name], average_roll, X);

end

