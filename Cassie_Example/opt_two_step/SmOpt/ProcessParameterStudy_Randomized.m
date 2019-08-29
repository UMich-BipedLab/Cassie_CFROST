% This function processes the parameter study that is stored in the file
% 'FileName'.  This file contains the following variables:
%
% - yIndices
% - zIndices
% - uIndices
% - pIndices
% - configurations  (a cell array of the fullowing structs:
%   * startDatStruct (a DatStruct)
%   * finalDatStruct (a DatStruct)
%   * nProcessed (int, the optimization will be restarted for at least min tries with randomzied values)
%   * nFailed (int, after maxTries failed trails, a solution will not be continued...) 
%   * indexVector (identifies the configuration on the parameter grid)
%   * costValue (the true value after processing, the 'parents' CostValue
%                before processing) )
% 
% To process this parameter study, the function interfaces with muscod, by
% placing a ProcessParameter.dat-file in [PathToProject,'DAT'], calling
% MUSCOD with this file via [PathToMuscod,' muscod ProcessParameter'], and
% retrieving the result from [PathToProject,'RES'].
%
%
function ProcessParameterStudy_Randomized(FileName,  PathToProject, PathToMuscod)
    maxTries = 5;
    maxRetries = 3;
    % Figure out if the file already exists
    if ~exist([FileName,'.mat'],'file')
        % File does not exist, issue an error.  This file must be created
        % by the function CreateParameterStudy
        error('File not found');
    else
        disp('Start processing!');
        load(FileName,'configurations','types','indices','grids');
        NY = length(configurations{1}.startDatStruct.xd_name);
        NU = length(configurations{1}.startDatStruct.u_name);
        
        % File exists, continue processing
        while true % infinite loop, will exit via 'break'
            % Find the unprocessed configuration with the lowest objective
            % starting value:
            foundSomething = false;
            bestValue = inf;
            processIndex = 0;
            for i = 1:length(configurations)
                if ~configurations{i}.processed && (configurations{i}.costValue < bestValue)
                    processIndex = i;
                    bestValue = configurations{i}.costValue;
                    foundSomething = true;
                end
            end
            % Check if a processable configuration was found
            if ~foundSomething
                % Didn't find something to process. Exit.
                disp('DONE');
                save(FileName,'configurations','types','indices','grids');
                break;
            end
            % Process this configuration:
            datStruct = configurations{processIndex}.startDatStruct;
            % update to parameter values at these indices:
            for i = 1:length(indices)
                if ~strcmp(types{i},'p')
                    error('This currently only works for parameters, not for other studies')
                else
                    datStruct.p(indices{i}) = grids{i}(configurations{processIndex}.indexVector(i));
                    % Make sure the parameter is fixed!
                    datStruct.p_fix(indices{i}) = 1;
                end
            end
            % Create file:
            CreateDatFile([PathToProject,'DAT/ProcessParameter'],datStruct);
            % Process:
            disp(' ');
            disp(['Call to MUSCOD for configuration (',num2str(processIndex),') at index [',num2str(configurations{processIndex}.indexVector),'] .']);
            
            % SWITCH TO PROJECT DIRECTORY AND RUN MUSCOD THERE
            currentPath = pwd;
            cd(PathToProject);
            [result, cmdout] = system([PathToMuscod,' ProcessParameter']);
            cd(currentPath);
            
            if (result == 0)
                % succesfull call to Muscod:
                disp(['Call to MUSCOD was successful for configuration (',num2str(processIndex),')']);
                % Load results:
                [obj, ~, nshoot, ~, ~, ~, ~, ~, ~, ~, ~] = ReadMOTfile([PathToProject,'RES/ProcessParameter'], NY, NU);
                configurations{processIndex}.finalDatStruct = UpdateDatStruct(configurations{processIndex}.startDatStruct,...
                                                                                [PathToProject,'RES/ProcessParameter'],...
                                                                                sum(nshoot), NY, NU);
                % Store new cost value:                                                            
                configurations{processIndex}.costValue = obj;
                % Now check if this is the best 
                foundSomethingBetter = false;
                for i = 1:length(configurations)
                    % Check if the solution stored at i is better (by a
                    % margin of 'betterMargin')
                    betterMargin = 0.0001;
                    if (i~=processIndex) &&...
                       configurations{i}.processed &&...
                       (configurations{i}.nFailed < maxTries) &&...
                       all(configurations{i}.indexVector == configurations{processIndex}.indexVector) &&...
                       (configurations{i}.costValue-betterMargin < (configurations{processIndex}.costValue))
                        foundSomethingBetter = true;
                    end
                end
                if ~foundSomethingBetter
                    disp([' With a value of ',num2str(configurations{processIndex}.costValue),', this is the best solution that was found at this index.']);
                    configurations{processIndex}.processed = true;
                    % This is the best value at the given instance.  Use it
                    % to generate more solutions:
                    nNew = 3^length(indices);
                    for i = 1:nNew
                        % Figure out the new index array:
                        addIndex = repmat(i-1,1,length(indices)); % Create an arry with the same index
                        addIndex = addIndex./3.^(0:1:(length(indices)-1)); % devide by powers of 3
                        addIndex = floor(addIndex); % round downwards to next integer
                        addIndex = mod(addIndex,3); % clip to 0,1,2
                        addIndex = addIndex-1; % subtract 1 to center about 0
                        % index is any of the possible combinations of
                        % vectors in the range -1,0,+1.  Figure out if the
                        % current one is a valid configuration:
                        % The new index vector will be 
                        % configurations{processIndex}.indexVector + addIndex
                        newIndex = configurations{processIndex}.indexVector + addIndex;
                        if configurations{processIndex}.indexVector == newIndex
                            continue; % Do not create this case, as it would replicate the processed case
                        end
                        if any(newIndex==0)
                            continue; % an index is smaller than 0
                        end
                        tooLarge = false;
                        for j = 1:length(indices) 
                            if newIndex(j)>length(grids{j})
                                tooLarge = true;
                            end
                        end
                        if tooLarge
                            continue;% an index is larger than the grid
                        end
                        configurations{end + 1}.processed  = false;
                        configurations{end}.nFailed        = 0;
                        configurations{end}.nProcessed     = 0;
                        configurations{end}.indexVector    = newIndex;
                        configurations{end}.costValue      = configurations{processIndex}.costValue;
                        configurations{end}.startDatStruct = configurations{processIndex}.finalDatStruct;
                        configurations{end}.finalDatStruct = {};
                        disp(['Created new configuration (',num2str(length(configurations)),') at indices [',num2str(newIndex),'].']);
                    end
                else
                    % A better solution exists already
                    disp('A better solution already exists at this point');
                    if configurations{processIndex}.nProcessed < maxRetries
                        %retry with slightly randomized values:
                        disp(['Retry configuration (',num2str(processIndex),') anyway with a randomized u']);
                        % don't mark this as processed (which means it will be
                        % tried again)
                        configurations{processIndex}.processed = false;
                        % count the number of tried attempts:
                        configurations{processIndex}.nProcessed = configurations{processIndex}.nProcessed + 1;
                        % Make a small random change to the initial
                        % configuration of the input vector 'u':
                        configurations{processIndex}.startDatStruct.u = configurations{processIndex}.startDatStruct.u + (rand(size(configurations{processIndex}.startDatStruct.u))-0.5)*0.001;
                    else
                        %giving up
                        disp(['Give up on  configuration (',num2str(processIndex),')']);
                        configurations{processIndex}.processed = true;
                    end
                end
            else
                % unsuccesfull call to Muscod:
                disp('Call to MUSCOD was NOT successful');
                disp(cmdout(end-1600:end));
                if configurations{processIndex}.nFailed < maxTries
                    %retry with slightly randomized values:
                    disp(['Retry  configuration (',num2str(processIndex),')']);
                    % don't mark this as processed (which means it will be
                    % tried again)
                    configurations{processIndex}.processed = false;
                    % count the number of failed attempts:
                    configurations{processIndex}.nFailed = configurations{processIndex}.nFailed + 1;
                    % Make a small random change to the initial
                    % configuration of the input vector 'u':
                    configurations{processIndex}.startDatStruct.u = configurations{processIndex}.startDatStruct.u + (rand(size(configurations{processIndex}.startDatStruct.u))-0.5)*0.001;
                else
                    %giving up
                    disp(['Give up on  configuration (',num2str(processIndex),')']);
                    configurations{processIndex}.processed = true;
                end
            end
            % save everthing to file:
            save(FileName,'configurations','types','indices','grids');
        end
    end
end

