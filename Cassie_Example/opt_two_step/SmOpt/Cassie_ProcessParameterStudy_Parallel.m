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
%   * processed (bool)
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
function Cassie_ProcessParameterStudy_Parallel(FileName, nlp_ori, info, robot,sys)

    maxTries = 0; % Maximal number of trials before give up;
    NoC      = 4; % Number of cores
    debug    = false;
    % parpool(NoC);

    
    % Figure out if the file already exists
    if ~exist([FileName,'.mat'],'file')
        % File does not exist, issue an error.  This file must be created
        % by the function CreateParameterStudy
        error('File not found');
    else
        disp('Start processing!');
        LoadCofig = load(FileName,'configurations','types','indices','grids');
        configurations = LoadCofig.configurations;
        types          = LoadCofig.types;
        indices        = LoadCofig.indices;
        grids          = LoadCofig.grids;
        
        % File exists, continue processing
        while true % infinite loop, will exit via 'break'
            % Find the unprocessed configuration with the lowest objective
            % starting value:
            foundSomething = false;
            % bestValue = inf;
            processIndex = 0;
            
            ParaIndex = [];
            
            for i = 1:length(configurations)
                if ~configurations{i}.processed % && (configurations{i}.costValue < bestValue)
                    processIndex = i;
                    % bestValue = configurations{i}.costValue;
                    foundSomething = true;
                    ParaIndex = [ParaIndex, processIndex];
                end
                
                if length(ParaIndex) >= NoC
                    break; % At most process Noc threads;
                end    
                
            end
            
            
            % Check if a processable configuration was found
            if ~foundSomething
                % Didn't find something to process. Exit.
                disp('DONE');
                save(FileName,'configurations','types','indices','grids');
                break;
            end
            
            
            solver = cell(length(ParaIndex),1);
            x0     = cell(length(ParaIndex),1);
            nlp    = cell(length(ParaIndex),1);
            

            
            for PAind = 1:length(ParaIndex)
                % Process this configuration:
                % Update initial conditions:

                x0{PAind} = configurations{ParaIndex(PAind)}.startDatStruct;
                
                % update to bound values at these indices:
                p = zeros(length(indices),1);
                for i = 1:length(indices)

                    p(i) = grids{i}(configurations{ParaIndex(PAind)}.indexVector(i));

                end

                vx = p(1);
                vy = p(2);
                h  = p(3);  
                %St = p(4); 
                %Gc = p(5);
                
                % bounds = two_step.utils.getBounds(robot, vx, vy, h, St, Gc);
                bounds = two_step.utils.getBounds(robot, vx, vy, h);
                LData = load('NLP.mat');
                nlp{PAind} = LData.nlp;
                % nlp = nlp_ori; % !!!!!!!!
                % nlp{PAind} = HybridTrajectoryOptimization('two_step',sys,num_grid,[],'EqualityConstraintBoundary',1e-4);

                
                % -------- Stride time --------- 
                nlp{PAind}.updateVariableBounds(bounds);

                % -------- Velocity ---------
                nlp{PAind}.Phase(1).updateConstrProp('average_hip_abduction_RightStance', 'last', 'lb', bounds.RightStance.average_hip_abduction.lb, 'ub', bounds.RightStance.average_hip_abduction.ub);
                nlp{PAind}.Phase(3).updateConstrProp('average_hip_abduction_LeftStance',  'last', 'lb', bounds.LeftStance.average_hip_abduction.lb,  'ub', bounds.LeftStance.average_hip_abduction.ub);
                nlp{PAind}.Phase(1).updateConstrProp('average_hip_rotation_RightStance',  'last', 'lb', bounds.RightStance.average_hip_rotation.lb,  'ub', bounds.RightStance.average_hip_rotation.ub);
                nlp{PAind}.Phase(3).updateConstrProp('average_hip_rotation_LeftStance',   'last', 'lb', bounds.LeftStance.average_hip_rotation.lb,   'ub', bounds.LeftStance.average_hip_rotation.ub);

                velocity = [vx; vy];
                nlp{PAind}.Phase(1).updateConstrProp('average_velocity_RightStance', 'last', 'lb', velocity, 'ub', velocity);
                nlp{PAind}.Phase(3).updateConstrProp('average_velocity_LeftStance',  'last', 'lb', velocity, 'ub', velocity);

                if abs(vy) <= 1e-3
                    nlp{PAind}.Phase(1).updateConstrProp('BezierSymmetry', 'last', 'lb', 0, 'ub', 0);
                else
                    nlp{PAind}.Phase(1).updateConstrProp('BezierSymmetry', 'last', 'lb', -inf, 'ub', inf);
                end

                % ------- Step Height ---------
                step_height = h;
                % Right Stance Guard
                for k = 1:length(nlp{PAind}.Phase(1).ConstrTable.u_leftToeHeight_cassie)-1
                    nlp{PAind}.Phase(1).ConstrTable.u_leftToeHeight_cassie(k).updateProp('lb', -Inf, 'ub', Inf);
                end
                    nlp{PAind}.Phase(1).ConstrTable.u_leftToeHeight_cassie(end).updateProp('lb', step_height, 'ub', step_height);
                % Left Stance Guard
                for k = 1:length(nlp{PAind}.Phase(3).ConstrTable.u_rightToeHeight_cassie)-1
                    nlp{PAind}.Phase(3).ConstrTable.u_rightToeHeight_cassie(k).updateProp('lb', -Inf, 'ub', Inf);
                end
                    nlp{PAind}.Phase(3).ConstrTable.u_rightToeHeight_cassie(end).updateProp('lb', 2*step_height, 'ub', 2*step_height);

                nlp{PAind}.update(); 

                % Process:
                disp(['Call to IPOPT for index [',num2str(configurations{ParaIndex(PAind)}.indexVector),'].']);       

                % Link the NLP problem to a NLP solver
                solver{PAind} = IpoptApplication(nlp{PAind}); 
                solver{PAind}.Options.ipopt.hessian_approximation      =  'limited-memory';
                solver{PAind}.Options.ipopt.bound_frac                 =  1e-8;
                solver{PAind}.Options.ipopt.bound_push                 =  1e-8;
                % Possible parameter changes to solver
                solver{PAind}.Options.ipopt.tol                        =  1e-3;
                solver{PAind}.Options.ipopt.dual_inf_tol               =  1e-3;
                solver{PAind}.Options.ipopt.constr_viol_tol            =  1e-5;
                solver{PAind}.Options.ipopt.compl_inf_tol              =  1e-3;
                solver{PAind}.Options.ipopt.max_iter                   =  500;

%                 solver{PAind}.Options.ipopt.point_perturbation_radius  =  0;
%                 solver{PAind}.Options.ipopt.warm_start_bound_push      =  1e-8;
%                 solver{PAind}.Options.ipopt.warm_start_mult_bound_push =  1e-8;
%                 solver{PAind}.Options.ipopt.mu_init                    =  1e-6;
%                 solver{PAind}.Options.ipopt.warm_start_init_point      =  'yes';
%                 solver{PAind}.Options.zl                               =  info.zl;
%                 solver{PAind}.Options.zu                               =  info.zu;
%                 solver{PAind}.Options.lambda                           =  info.lambda;

                solver{PAind}.Options.ipopt.print_timing_statistics    = 'no';
                solver{PAind}.Options.ipopt.nlp_lower_bound_inf        = -1e6;
                solver{PAind}.Options.ipopt.nlp_upper_bound_inf        =  1e6;

                if debug == false
                   solver{PAind}.Options.ipopt.print_level                =  0;
                end
                % solver.Options.ipopt.acceptable_tol             = 1e-2;
                % solver.Options.ipopt.acceptable_constr_viol_tol = 1e-4;
                % solver.Options.ipopt.acceptable_dual_inf_tol    = 1e-2;
                % solver.Options.ipopt.acceptable_compl_inf_tol   = 1e-2;
                % solver.Options.ipopt.print_user_options         = 'yes';
            end
            
            

            sol_  = cell(length(ParaIndex),1);
            info_ = cell(length(ParaIndex),1);    
            %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            if debug == false
                % Run the optimization
                parfor PAind = 1:length(ParaIndex)                
                    try
                        % Run the optimization
                        [sol_{PAind}, info_{PAind}] = optimize(solver{PAind}, x0{PAind});
                    catch
                        info_{PAind}.status = -1;     
                    end   
                end    
            else  
              for PAind = 1:length(ParaIndex)
                    try
                    % Run the optimization
                    [sol_{PAind}, info_{PAind}] = optimize(solver{PAind}, x0{PAind});  
                    catch
                        info_{PAind}.status = -1;     
                    end  
              end 
                
            end % end parfor
            %% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
            
            
            
            
            for PAind = 1:length(ParaIndex) % Check solutions
                if (info_{PAind}.status == 0)
                    % succesfull call to IPOPT:
                    disp('Call to IPOPT was successful');
                    configurations{ParaIndex(PAind)}.processed = true;
                    configurations{ParaIndex(PAind)}.nFailed = 0;
                    configurations{ParaIndex(PAind)}.finalDatStruct = sol_{PAind};


                    % Store new cost value:                                                            
                    configurations{ParaIndex(PAind)}.costValue = info_{PAind}.objective;
                    % Now check if this is the best 
                    foundSomethingBetter = false;
                    for i = 1:length(configurations)
                        % Check if the solution stored at i is better (by a
                        % margin of 'betterMargin')
                        betterMargin = 0.0001;
                        if (i~=ParaIndex(PAind)) &&...
                           configurations{i}.processed &&...
                           (configurations{i}.nFailed < maxTries) &&...
                           all(configurations{i}.indexVector == configurations{ParaIndex(PAind)}.indexVector) &&...
                           (configurations{i}.costValue-betterMargin < (configurations{ParaIndex(PAind)}.costValue))
                            foundSomethingBetter = true;
                        end
                    end
                    if ~foundSomethingBetter
                        disp([' With a value of ',num2str(configurations{ParaIndex(PAind)}.costValue),', this is the best solution that was found at this index.']);
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
                            newIndex = configurations{ParaIndex(PAind)}.indexVector + addIndex;
                            if configurations{ParaIndex(PAind)}.indexVector == newIndex
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
                            
                            %% Just find one solution first
                            IfExist = false;
                            for k = 1:length(configurations) 
                                % If a solution has already been found at
                                % this index;
                                if  all(configurations{k}.indexVector == newIndex) && (configurations{k}.processed == 1) && (~isempty(configurations{k}.finalDatStruct))   
                                    IfExist = true;
                                    disp('A solution already exists at this point');
                                end
                                % If a configuration has already been
                                % created at in index;
                                if  all(configurations{k}.indexVector == newIndex) && (configurations{k}.processed == 0)   
                                    IfExist = true;
                                    disp('A configuration already exists at this point');
                                end
                            end
                            if IfExist
                                continue;% an index is larger than the grid
                            end
                            
                            
                            
                            configurations{end + 1}.processed  = false;
                            configurations{end}.nFailed        = 0;
                            configurations{end}.indexVector    = newIndex;
                            configurations{end}.costValue      = configurations{ParaIndex(PAind)}.costValue;
                            configurations{end}.startDatStruct = configurations{ParaIndex(PAind)}.finalDatStruct;
                            configurations{end}.finalDatStruct = {};
                            disp(['Created new configuration at indices [',num2str(newIndex),'].']);
                        end
                    else
                        % A better solution exists already, do nothing
                        disp('A better solution already exists at this point');
                    end
                else
                    % unsuccesfull call to Muscod:
                    disp('Call to IPOPT was NOT successful');
                    % disp(cmdout(end-1600:end));
                    
                    if configurations{ParaIndex(PAind)}.nFailed < maxTries
                        % retry with slightly randomized values:
                        disp('Retry');
                        % don't mark this as processed (which means it will be
                        % tried again)
                        configurations{ParaIndex(PAind)}.processed = false;
                        % count the number of failed attempts:
                        configurations{ParaIndex(PAind)}.nFailed = configurations{ParaIndex(PAind)}.nFailed + 1;
                        % Make a small random change to the initial
                        % configuration of the input vector:
                        configurations{ParaIndex(PAind)}.startDatStruct = configurations{ParaIndex(PAind)}.startDatStruct + (rand(size(configurations{processIndex}.startDatStruct))-0.5)*0.001;
                    else
                        % giving up
                        disp('Give up');
                        configurations{ParaIndex(PAind)}.processed = true;
                        configurations{ParaIndex(PAind)}.nFailed = 99;
                    end
                end 
            end % check solutions end
            
            
            % save everthing to file:
            save(FileName,'configurations','types','indices','grids');
            
            
        end
    end
end

