function [ average_pitch_fun ] = average_pitch( nlp )
%average_pitch constraint for average_pitch
%   Creates SymFunction for a average_pitch constraint
%
%   Author: Ross Hartley
%     Date: 2018-03-19

% Compute function for average_pitch constraint
X = cell(1,nlp.NumNode);
for i = 1:nlp.NumNode
    X{i}  = SymVariable(['x',num2str(i)],[nlp.Plant.numState,1]);
    if i == 1
        average_pitch = X{i}(5);
    else
        average_pitch = average_pitch + X{i}(5);
    end
end
average_pitch = average_pitch/nlp.NumNode;
average_pitch_fun = SymFunction(['average_pitch_', nlp.Plant.Name], average_pitch, X);

end

