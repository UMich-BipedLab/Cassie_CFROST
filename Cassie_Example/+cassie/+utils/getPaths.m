function [ paths ] = getPaths( ROOT_PATH )
%GETPATHS Defines and creates useful paths

paths = struct;

paths.EXPORT = [ROOT_PATH, '\gen'];
paths.RES = [ROOT_PATH, '\res'];
paths.FROST = [ROOT_PATH, '\submodules\frost-dev'];
paths.C_FROST = [ROOT_PATH, '\submodules\C-Frost\Matlab'];
paths.MODEL = [ROOT_PATH, '\submodules\Cassie_Model'];
% paths.MODEL_LOAD = [paths.MODEL, '\gen\sym'];
% paths.OPT_LOAD = [paths.EXPORT, '\sym\'];
% paths.OPT_EXPORT = [paths.EXPORT, '\opt'];

% Create Directories
create_directory(paths);

end

function [] = create_directory(paths)
% Create directory and add to path
if isstruct(paths)
    names = fieldnames(paths);
    for i = 1:numel(names)
        if ~exist(paths.(names{i}),'dir')
            mkdir(paths.(names{i}));
        end
        addpath(genpath(paths.(names{i})));
    end
elseif iscell(paths)
    for i = 1:length(cells)
        if ~exist(paths{i},'dir')
            mkdir(paths{i});
        end
        addpath(genpath(paths{i}));
    end
else
    if ~exist(paths,'dir')
        mkdir(paths);
    end
    addpath(paths);
end
end


