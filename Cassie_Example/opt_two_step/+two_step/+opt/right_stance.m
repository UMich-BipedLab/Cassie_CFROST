function right_stance(nlp, bounds, varargin)
    % Extract Plant
    domain = nlp.Plant;
    vars   = nlp.OptVarTable;
    nNode = nlp.NumNode;
    
    % Add Virtual Constraints
    domain.VirtualConstraints.time.imposeNLPConstraint(nlp, [bounds.time.kp, bounds.time.kd], [1,1]);
    
    %% Tau Boundary [0,1]
    addNodeConstraint(nlp, cassie.constraints.tau0(nlp), ...
        [{'T'},domain.VirtualConstraints.time.PhaseParamName], 'first', 0, 0, 'Nonlinear');
    addNodeConstraint(nlp, cassie.constraints.tauF(nlp), ...
        [{'T'},domain.VirtualConstraints.time.PhaseParamName], 'last', 0, 0, 'Nonlinear');
    
    %% Step Length
%     addNodeConstraint(nlp, cassie.constraints.step_length(nlp), ...
%        {'x'}, 'last', bounds.step_length.lb, bounds.step_length.ub, 'Nonlinear');

    %% Average Velocity
    average_velocity_cstr = NlpFunction('Name',['average_velocity_', domain.Name],...
        'Dimension',2,...
        'lb', bounds.average_velocity.lb,...
        'ub', bounds.average_velocity.ub ,...
        'Type','Linear',...
        'SymFun',cassie.constraints.average_velocity(nlp),...
        'DepVariables',[nlp.OptVarTable.T(1),nlp.OptVarTable.x(1),nlp.OptVarTable.x(end)]);
    
    addConstraint(nlp, ['average_velocity_', domain.Name], 'last', average_velocity_cstr);
    
    %% Toe-to-Toe Distance  
    addNodeConstraint(nlp, cassie.constraints.step_width(nlp), ...
        {'x'}, 'all', bounds.toe_to_toe_width.lb, bounds.toe_to_toe_width.ub, 'Nonlinear');

    %% Pelvis-to-Toe Distance
    addNodeConstraint(nlp, cassie.constraints.distance_pelvis_to_stance_toe(nlp), ...
        {'x'}, 'all', bounds.distance_pelvis_to_stance_toe.lb, bounds.distance_pelvis_to_stance_toe.ub, 'Nonlinear');
    
    %% Swing Foot Clearance
    addNodeConstraint(nlp, cassie.constraints.step_height(nlp), ...
        {'x'}, floor(nlp.NumNode/2), bounds.foot_clearance.lb, bounds.foot_clearance.ub, 'Nonlinear');
    
    %% Swing Toe Velocity
    % Throughout all nodes
    addNodeConstraint(nlp, cassie.constraints.swing_toe_angular_velocity_x(nlp), ...
        {'x','dx'}, 'all', 0, 0, 'Nonlinear');
    addNodeConstraint(nlp, cassie.constraints.swing_toe_angular_velocity_z(nlp), ...
        {'x','dx'}, 'all', 0, 0, 'Nonlinear');
    % Final node
    addNodeConstraint(nlp, cassie.constraints.swing_toe_linear_velocity_x(nlp), ...
        {'x','dx'}, 'last', bounds.swing_toe_vel_x.lb, bounds.swing_toe_vel_x.ub, 'Nonlinear');
    addNodeConstraint(nlp, cassie.constraints.swing_toe_linear_velocity_y(nlp), ...
        {'x','dx'}, 'last', bounds.swing_toe_vel_y.lb, bounds.swing_toe_vel_y.ub, 'Nonlinear');
    addNodeConstraint(nlp, cassie.constraints.swing_toe_linear_velocity_z(nlp), ...
        {'x','dx'}, 'last', bounds.swing_toe_vel_z.lb, bounds.swing_toe_vel_z.ub, 'Nonlinear');
    
    %% Swing knee velocity
    %     dx = nlp.Plant.States.dx;
    %     expression = dx(10);
    %     func = SymFunction(['swing_knee_velocity_',nlp.Plant.Name], expression, {nlp.Plant.States.dx});
    %     addNodeConstraint(nlp, func, ...
    %         {'dx'}, 'last', bounds.swing_knee_vel.lb,  bounds.swing_knee_vel.ub, 'Linear');
    
    %% Average pitch
    average_pitch_cstr = NlpFunction('Name',['average_pitch_', domain.Name],...
        'Dimension',1,...
        'lb', bounds.average_pitch.lb,...
        'ub', bounds.average_pitch.ub ,...
        'Type','Linear',...
        'SymFun', cassie.constraints.average_pitch(nlp),...
        'DepVariables',nlp.OptVarTable.x);
    
    addConstraint(nlp, ['average_pitch_', domain.Name], 'last', average_pitch_cstr);
    
    %% Average yaw
    average_yaw_cstr = NlpFunction('Name',['average_yaw_', domain.Name],...
        'Dimension',1,...
        'lb', bounds.average_yaw.lb,...
        'ub', bounds.average_yaw.ub ,...
        'Type','Linear',...
        'SymFun',cassie.constraints.average_yaw(nlp),...
        'DepVariables',nlp.OptVarTable.x);
    
    addConstraint(nlp, ['average_yaw_', domain.Name], 'last', average_yaw_cstr);
    
    %% Average hip abduction
    average_hip_abduction_cstr = NlpFunction('Name',['average_hip_abduction_', domain.Name],...
        'Dimension',2,...
        'lb', bounds.average_hip_abduction.lb,...
        'ub', bounds.average_hip_abduction.ub ,...
        'Type','Linear',...
        'SymFun', cassie.constraints.average_hip_abduction(nlp),...
        'DepVariables',nlp.OptVarTable.x);
    
    addConstraint(nlp, ['average_hip_abduction_', domain.Name], 'last', average_hip_abduction_cstr);
    
    %% Average hip rotation
    average_hip_rotation_cstr = NlpFunction('Name',['average_hip_rotation_', domain.Name],...
        'Dimension',2,...
        'lb', bounds.average_hip_rotation.lb,...
        'ub', bounds.average_hip_rotation.ub ,...
        'Type','Linear',...
        'SymFun', cassie.constraints.average_hip_rotation(nlp),...
        'DepVariables',nlp.OptVarTable.x);
    
    addConstraint(nlp, ['average_hip_rotation_', domain.Name], 'last', average_hip_rotation_cstr);
    
    %% Having variable x_start defined at all nodes (example)
    nlp = AddVariable(nlp, 'xStart', length(domain.States.x), bounds);
    xStart = SymVariable('xStart', [length(domain.States.x), 1]);
    vars   = nlp.OptVarTable;
    
    contr = domain.States.x - xStart;
    contr_func = SymFunction(['initial_x_start_',domain.Name], contr, {domain.States.x, xStart});
    lb = 0;
    ub = 0;
    addNodeConstraint(nlp, contr_func, {'x', 'xStart'}, 'first', lb, ub, 'NonLinear');

    xStartPrev = SymVariable('xStartPrev', [length(xStart), 1]);
    contr = xStart - xStartPrev;
    contr_func = SymFunction(['xStartCont_',domain.Name], contr, {xStart, xStartPrev});
    node_list = 2:1:nNode;
    int_x_cstr(numel(node_list)) = struct();
    [int_x_cstr.Name] = deal(['xStartCont_',domain.Name]);
    [int_x_cstr.Dimension] = deal(length(nlp.Plant.States.x));
    [int_x_cstr.lb] = deal(0);
    [int_x_cstr.ub] = deal(0);
    [int_x_cstr.SymFun] = deal(contr_func);
    [int_x_cstr.Type] = deal('Nonlinear');
    for i = 1:numel(node_list)
        idx = node_list(i);
        int_x_cstr(i).DepVariables = [vars.xStart(idx);vars.xStart(idx-1)];
    end
    nlp = addConstraint(nlp, ['xStartCont_',domain.Name], node_list, int_x_cstr);
    %% Costs
    
    % Torque Cost
    addRunningCost(nlp, cassie.costs.torque(nlp), 'u');
    
    ModelErrorCost(nlp);
%     addRunningCost(nlp, cassie.costs.model_error(nlp), {'x', 'T'}, {5});
%     for i = 1:nlp.NumNode
%         auxData = nlp.CostTable.modelerror(i).AuxData;
%         auxData{1} = i;
%         nlp.CostTable.modelerror(i).setAuxdata(auxData);
%         %nlp.updateCostProp('modelerror', i, 'AuxData', auxData);
%     end



    % obj is a (non-hybrid) trajectory optimization program


%     % variables
%     T   = SymVariable('t',[2,1]);
% 
% %     Xnum  = SymVariable('xnum',[nlp.Plant.numState,1]);
%     Xall  = SymVariable('xal',[1, nlp.NumNode]);
%     Xps   = SymVariable('xps',[1, nlp.NumNode]);
%     X_    = SymVariable('xey',[nlp.Plant.numState,1]);
%     
%     
%     
%     g = SymVariable('grav');
%     h = SymVariable('heig');    
% 
%     
%     for k = 1:nlp.NumNode
%         X_ = Xall(k);
%         if k == 1
%            xo  = X_(1);
%            dxo = X_(2);
%         end
%         Xps(k) = X_(1);
%         Ts = (k-1)*(T(2) - T(1))/nlp.NumNode;
%         % Only under such condisiton, the period T is a real number (exist)
%         LIP_x(k) = (exp((Ts*(g*h)^(1/2))/h)*(dxo*h + xo*(g*h)^(1/2)))/(2*(g*h)^(1/2)) - (exp(-(Ts*(g*h)^(1/2))/h)*(dxo*h - xo*(g*h)^(1/2)))/(2*(g*h)^(1/2));
%         Model_Error_cost = Model_Error_cost + (Xps(k) - LIP_x(k)).^2;
%     end     
%     
%     
% 
% 
%    
% %     Model_Error_cost = SymVariable('modelerrorCost',[1,1]);
% %     for i = 1:nlp.NumNode
% %       Model_Error_cost = Model_Error_cost + (Xps(i) - LIP_x(i)).^2;
% %     end
%     
%     s_dep_vars = {T, Xall};
%     s_dep_params = {[g,h]};
%     Model_Error_fun = SymFunction(['Model_Error_cost_', nlp.Name], ...
%         Model_Error_cost, s_dep_vars, s_dep_params);
%     
% %     x1allnodes = zeros(nlp.NumNode,nlp.Plant.numState);
%     for k = 1: nlp.NumNode
%         x1allnodes(k) = nlp.OptVarTable.x(k);
%     end
%     
%     
%     Model_Error_nlp_fun = NlpFunction('Name', 'modelerrornlpcost', ...
%         'Dimension', 1, ...
%         'Type', 'Nonlinear', ...
%         'SymFun', Model_Error_fun, ...
%         'DepVariables', [nlp.OptVarTable.T(1); nlp.OptVarTable.x;], ...
%         'AuxData', [9.8;0.85]);
%     
%     addCost( nlp, Model_Error_nlp_fun.Name, 'last', Model_Error_nlp_fun );   
    
end

function nlp = AddVariable(nlp, s_name, siz, bounds)
    var = struct();
    var.Name = s_name;
    var.Dimension = prod(siz);
    if isfield(bounds,s_name)
        if isfield(bounds.(s_name),'lb')
            var.lb = bounds.(s_name).lb;
        end
        if isfield(bounds.(s_name),'ub')
            var.ub = bounds.(s_name).ub;
        end
        if isfield(bounds.(s_name),'x0')
            var.x0 = bounds.(s_name).x0;
        end
    end
    % state variables are defined at all nodes
    nlp = addVariable(nlp, s_name, 'all', var);
end

