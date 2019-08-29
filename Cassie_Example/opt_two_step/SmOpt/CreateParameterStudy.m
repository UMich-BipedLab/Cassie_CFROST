% This function generates the files for a paramtere study.  All information
% will be stored in the file 'FileName'.  The input arguments are a base
% DatStruct (e.g., created via UpdateDatStruct from a previous run of
% MUSCOD. And triplets of arguments, that come in the sequence 'ParamType',
% 'ParamIndex', 'Grid'.  Where ParamType refers to which variable should be
% altered (can be 'y','z','u','p', or 'h'), ParamIndex refers to the index of
% the associated parameter (using Matlab notation, i.e., the first element
% is 1; in contrast to the C/C++ notation), and the Grid indicates which
% values this parameter can take.  Multi-dimensional studies can be
% conducted using multiple triplets:
% Example:
%  - CreateParameterStudy('VelocityStudy, datStruct, 'p',4,[0.5:0.01:2]) 
%     (Velocity study)
%  - CreateParameterStudy('StiffnessStudy', datStruct, 'p',6,logspace( log10(0.001), log10(15),50), 'p',8,logspace( log10(0.001), log10(15),50)) 
%     (Spring stiffness study)
%
function CreateParameterStudy(FileName, datStruct, varargin)
    types   = {};
    indices = {};
    grids   = {};
    nGrid = (nargin-2)/3;
    for i = 1:nGrid
        types{i}   = varargin{(i-1)*3+1};
        indices{i} = varargin{(i-1)*3+2};
        grids{i}   = varargin{(i-1)*3+3};
    end
    % Figure out, which of the grid points are closest to the values found
    % in datStruct:
    for i = 1:nGrid
        if ~strcmp(types{i},'p')
            error('This currently only works for parameters, not for other studies')
        else
             [~, index] = min(abs(grids{i}-datStruct.p(indices{i})));
             % remeber this configuration:
             configurations{1}.indexVector(i) = index;
        end
    end
    configurations{1}.startDatStruct = datStruct;
    configurations{1}.finalDatStruct = {};
    configurations{1}.processed      = false;
    configurations{1}.nFailed        = 0;
    configurations{1}.costValue      = 0;
    save(FileName,'configurations','types','indices','grids');
end

