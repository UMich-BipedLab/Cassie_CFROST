% This function reads a .plt file and returns the time trajectories of the
% states y and controls u.  Cell arrays with the state and control names
% are also obtained.
function [t, y, u, yName, uName] = ReadPLTfile(fileName, NY, NU)    
    
    % Open file and read out data:
    fid = fopen([fileName,'.plt']);
    % First line with headers:
    nameStr = fgetl(fid);
    % Remove all whitespace nameStr:
    nameStr = nameStr(double(nameStr)~=32);
    % Scan for name array
    name = textscan(nameStr,'%s ');
    name = name{1};
    % scan the rest of the document
    data = fscanf(fid,'%f');
    fclose(fid);
    
    n = size(data,1);
    data = reshape(data,NY+NU+1,n/(NY+NU+1))';
    
    % Extract individual components:
    t = data(:,1);
    y = data(:,2:NY+1);
    yName = name(2:NY+1);
    u = data(:,NY+2:end);
    uName = name(NY+2:end);
end