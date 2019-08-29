% This function reads a .plt file and returns the time trajectories of the
% states y and controls u.  Cell arrays with the state and control names
% are also obtained.
function [obj, h, nshoot, index, t, y, u, p, yName, uName, pName] = ReadMOTfile(fileName, NY, NU)    
    
    % Open file and read out data:
    fid = fopen([fileName,'.mot']);
    % First line with objective:
    objStr = fgetl(fid);
    obj = sscanf(objStr,'COT: %f');
    % Second line with parameter names
    nameStr = fgetl(fid);
    % Remove all whitespace nameStr:
    nameStr = nameStr(double(nameStr)~=32);
    % Scan for name array
    pName = textscan(nameStr,'%s ');
    pName = pName{1};
    % Third line with parameter values:
    paramStr = fgetl(fid); % third line with parameters
    p = sscanf(paramStr,'%f');
    % Fourth line with headers:
    nameStr = fgetl(fid);
    % Remove all whitespace nameStr:
    nameStr = nameStr(double(nameStr)~=32);
    % Scan for name array
    name = textscan(nameStr,'%s ');
    name = name{1};
    % scan the rest of the document
    data = fscanf(fid,'%f');
    fclose(fid);
    
    % These lines might need to be adapted to changing dimensions in the
    % state and controls vector:
    n = size(data,1);
    % Extract trajectories at nodes:
    data = reshape(data,NY+NU+3,n/(NY+NU+3))';
    index = data(:,1:2);
    t = data(:,3);
    y = data(:,4:NY+3);
    yName = name(4:NY+3);
    u = data(:,NY+4:end);
    uName = name(NY+4:end);

    % Extract the phase durations:
    % Find number of phases:
    nh = sum(index(:,2)==0);
    nshoot = zeros(nh,1);
    for i = 1:nh
        nshoot(i) = sum(index(:,1)==(i-1));
    end
    nshoot(nh) = nshoot(nh)-1;
    % find phase durations:
    h = t(cumsum(nshoot)+1)-t([0;cumsum(nshoot(1:nh-1))]+1);
end