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
function Cassie_ProcessParameterStudy(FileName, nlp, info, robot)
    maxTries = 0;
    % Figure out if the file already exists
    if ~exist([FileName,'.mat'],'file')
        % File does not exist, issue an error.  This file must be created
        % by the function CreateParameterStudy
        error('File not found');
    else
        disp('Start processing!');
        load(FileName,'configurations','types','indices','grids');
        % NY = length(configurations{1}.startDatStruct.xd_name);
        % NU = length(configurations{1}.startDatStruct.u_name);
        
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
            
            % Test
            % processIndex = 76;
            
            
            % Process this configuration:
            % Update initial conditions:
            
            x0 = configurations{processIndex}.startDatStruct;
            % update to bound values at these indices:
            p = zeros(length(indices),1);
            for i = 1:length(indices)

                p(i) = grids{i}(configurations{processIndex}.indexVector(i));

            end
       
            vx = p(1);
            vy = p(2);
            h  = p(3);    
            %st = p(4);
            
            % -------- Velocity ---------
            bounds = two_step.utils.getBounds(robot, vx, vy, h);
            
            nlp.updateVariableBounds(bounds);
            nlp.Phase(1).updateConstrProp('average_hip_abduction_RightStance', 'last', 'lb', bounds.RightStance.average_hip_abduction.lb, 'ub', bounds.RightStance.average_hip_abduction.ub);
            nlp.Phase(3).updateConstrProp('average_hip_abduction_LeftStance',  'last', 'lb', bounds.LeftStance.average_hip_abduction.lb,  'ub', bounds.LeftStance.average_hip_abduction.ub);
            nlp.Phase(1).updateConstrProp('average_hip_rotation_RightStance',  'last', 'lb', bounds.RightStance.average_hip_rotation.lb,  'ub', bounds.RightStance.average_hip_rotation.ub);
            nlp.Phase(3).updateConstrProp('average_hip_rotation_LeftStance',   'last', 'lb', bounds.LeftStance.average_hip_rotation.lb,   'ub', bounds.LeftStance.average_hip_rotation.ub);

            velocity = [vx; vy];
            nlp.Phase(1).updateConstrProp('average_velocity_RightStance', 'last', 'lb', velocity, 'ub', velocity);
            nlp.Phase(3).updateConstrProp('average_velocity_LeftStance',  'last', 'lb', velocity, 'ub', velocity);
            
            if abs(vy) <= 1e-3
                nlp.Phase(1).updateConstrProp('BezierSymmetry', 'last', 'lb', 0, 'ub', 0);
            else
                nlp.Phase(1).updateConstrProp('BezierSymmetry', 'last', 'lb', -inf, 'ub', inf);
            end

            % ------- Step Height ---------
            step_height = h;
            % Right Stance Guard
            for k = 1:length(nlp.Phase(1).ConstrTable.u_leftToeHeight_cassie)-1
                nlp.Phase(1).ConstrTable.u_leftToeHeight_cassie(k).updateProp('lb', -Inf, 'ub', Inf);
            end
                nlp.Phase(1).ConstrTable.u_leftToeHeight_cassie(end).updateProp('lb', step_height, 'ub', step_height);
            % Left Stance Guard
            for k = 1:length(nlp.Phase(3).ConstrTable.u_rightToeHeight_cassie)-1
                nlp.Phase(3).ConstrTable.u_rightToeHeight_cassie(k).updateProp('lb', -Inf, 'ub', Inf);
            end
                nlp.Phase(3).ConstrTable.u_rightToeHeight_cassie(end).updateProp('lb', 2*step_height, 'ub', 2*step_height);
            
            %             nlp.Phase(1).ConstrTable.swing_knee_velocity_RightStance(end).updateProp('lb', bounds.RightStance.swing_knee_vel.lb, 'ub', bounds.RightStance.swing_knee_vel.ub);
            %             nlp.Phase(3).ConstrTable.swing_knee_velocity_LeftStance(end).updateProp('lb', bounds.LeftStance.swing_knee_vel.lb, 'ub', bounds.LeftStance.swing_knee_vel.ub);
            
            %             nlp.Phase(1).ConstrTable.swing_toe_linear_velocity_x_RightStance(end).updateProp('lb', bounds.RightStance.swing_toe_vel_x.lb, 'ub', bounds.RightStance.swing_toe_vel_x.ub);
            %             nlp.Phase(3).ConstrTable.swing_toe_linear_velocity_x_LeftStance(end).updateProp('lb', bounds.LeftStance.swing_toe_vel_x.lb, 'ub', bounds.LeftStance.swing_toe_vel_x.ub);
            %             nlp.Phase(1).ConstrTable.swing_toe_linear_velocity_y_RightStance(end).updateProp('lb', bounds.RightStance.swing_toe_vel_y.lb, 'ub', bounds.RightStance.swing_toe_vel_y.ub);
            %             nlp.Phase(3).ConstrTable.swing_toe_linear_velocity_y_LeftStance(end).updateProp('lb', bounds.LeftStance.swing_toe_vel_y.lb, 'ub', bounds.LeftStance.swing_toe_vel_y.ub);
            %             nlp.Phase(1).ConstrTable.swing_toe_linear_velocity_z_RightStance(end).updateProp('lb', bounds.RightStance.swing_toe_vel_z.lb, 'ub', bounds.RightStance.swing_toe_vel_z.ub);
            %             nlp.Phase(3).ConstrTable.swing_toe_linear_velocity_z_LeftStance(end).updateProp('lb', bounds.LeftStance.swing_toe_vel_z.lb, 'ub', bounds.LeftStance.swing_toe_vel_z.ub);
            
            nlp.update(); 
            
            
            % Process:
            disp(['Call to IPOPT (', num2str(processIndex), ')for index [',num2str(configurations{processIndex}.indexVector),'].']);       
            % [gait, sol, info, total_time] = two_step.utils.solve(nlp, x0);
            % Link the NLP problem to a NLP solver
            solver = IpoptApplication(nlp);
            solver.Options.ipopt.hessian_approximation      =  'limited-memory';
            solver.Options.ipopt.bound_frac                 =  1e-8;
            solver.Options.ipopt.bound_push                 =  1e-8;
            % Possible parameter changes to solver
            solver.Options.ipopt.tol                        =  1e-3;
            solver.Options.ipopt.dual_inf_tol               =  1e-3;
            solver.Options.ipopt.constr_viol_tol            =  1e-5;
            solver.Options.ipopt.compl_inf_tol              =  1e-3;
            solver.Options.ipopt.max_iter                   =  500;

            solver.Options.ipopt.point_perturbation_radius  =  0;
            solver.Options.ipopt.warm_start_bound_push      =  1e-8;
            solver.Options.ipopt.warm_start_mult_bound_push =  1e-8;
            solver.Options.ipopt.mu_init                    =  1e-6;
            solver.Options.ipopt.warm_start_init_point      =  'yes';
            solver.Options.zl                               =  info.zl;
            solver.Options.zu                               =  info.zu;
            solver.Options.lambda                           =  info.lambda;
            
            solver.Options.ipopt.print_timing_statistics    = 'no';
            solver.Options.ipopt.nlp_lower_bound_inf        = -1e6;
            solver.Options.ipopt.nlp_upper_bound_inf        =  1e6;
            
%             solver.Options.ipopt.print_level                =  0;
            % solver.Options.ipopt.acceptable_tol             = 1e-2;
            % solver.Options.ipopt.acceptable_constr_viol_tol = 1e-4;
            % solver.Options.ipopt.acceptable_dual_inf_tol    = 1e-2;
            % solver.Options.ipopt.acceptable_compl_inf_tol   = 1e-2;
            % solver.Options.ipopt.print_user_options         = 'yes';
            
            
            % Run the optimization
            [sol, info] = optimize(solver, x0);

            
            
            if (info.status == 0)
                % succesfull call to IPOPT:
                disp('Call to IPOPT was successful');
                configurations{processIndex}.processed = true;
                configurations{processIndex}.nFailed = 0;
                configurations{processIndex}.finalDatStruct = sol;
                
                
                % Store new cost value:    
                if  isfield(info, 'objective')
                
                     configurations{processIndex}.costValue = info.objective;
                else
                     configurations{processIndex}.costValue = 0;%info.objective;    
                end    
                
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
                        %% Just find one solution first
                        IfExist = false;
                        for k = 1:length(configurations) 
                            if  all(configurations{k}.indexVector == newIndex) && (configurations{k}.processed == 1) && (~isempty(configurations{k}.finalDatStruct))   
                                IfExist = true;
                                disp('A solution already exists at this point');
                            end
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
                        configurations{end}.costValue      = configurations{processIndex}.costValue;
                        configurations{end}.startDatStruct = configurations{processIndex}.finalDatStruct;
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
                if configurations{processIndex}.nFailed < maxTries
                    % retry with slightly randomized values:
                    disp('Retry');
                    % don't mark this as processed (which means it will be
                    % tried again)
                    configurations{processIndex}.processed = false;
                    % count the number of failed attempts:
                    configurations{processIndex}.nFailed = configurations{processIndex}.nFailed + 1;
                    % Make a small random change to the initial
                    % configuration of the input vector:
                    configurations{processIndex}.startDatStruct = configurations{processIndex}.startDatStruct + (rand(size(configurations{processIndex}.startDatStruct))-0.5)*0.001;
                else
                    % giving up
                    disp('Give up');
                    configurations{processIndex}.nFailed   = 99;
                    configurations{processIndex}.processed = true;
                end
            end
            % save everthing to file:
            save(FileName,'configurations','types','indices','grids');
        end
    end
end

