function [rootPath] = get_root_path()
    pathstr = mfilename('fullpath');
    [cur, ~, ~] = fileparts([pathstr, '.m']);
    rootPath = fileparts(fileparts(cur));
end
