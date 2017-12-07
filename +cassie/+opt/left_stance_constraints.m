function left_stance_constraints(nlp, bounds, varargin)
    
    domain = nlp.Plant;

    %% relative degree 2 outputs
    domain.VirtualConstraints.time.imposeNLPConstraint(nlp, [bounds.time.kp, bounds.time.kd], [1,1]);
    
    %% tau boundary [0,1]
    T  = SymVariable('t',[2,1]);
    p = {SymVariable(tomatrix(domain.VirtualConstraints.time.PhaseParams(:)))};
    p_name = domain.VirtualConstraints.time.PhaseParamName;
    tau_0 = SymFunction(['tau_0_',domain.Name], T(1) - p{1}(2), [{T},p]);
    tau_F = SymFunction(['tau_F_',domain.Name], T(2) - p{1}(1), [{T},p]);
    addNodeConstraint(nlp, tau_0, [{'T'},p_name], 'first', 0, 0, 'Nonlinear');
    addNodeConstraint(nlp, tau_F, [{'T'},p_name], 'last', 0, 0, 'Nonlinear');

    %% average velocity
    if bounds.use_average_velocity
        T  = SymVariable('t',[2,1]);
        X0  = SymVariable('x0',[domain.numState,1]);
        XF  = SymVariable('xF',[domain.numState,1]);
        avg_vel = (XF(1:2) - X0(1:2)) ./ (T(2) - T(1));
        avg_vel_fun = SymFunction('average_velocity', avg_vel, {T,X0,XF});
        
        avg_vel_cstr = NlpFunction('Name','average_velocity',...
            'Dimension',2,...
            'lb', bounds.average_velocity.lb,...
            'ub', bounds.average_velocity.ub ,...
            'Type','Linear',...
            'SymFun',avg_vel_fun,...
            'DepVariables',[nlp.OptVarTable.T(1); nlp.OptVarTable.x(1); nlp.OptVarTable.x(end)]);
        
        addConstraint(nlp, 'average_velocity', 'last', avg_vel_cstr);
    end
    
    %% step length
    if bounds.use_step_length
        X0  = SymVariable('x0',[domain.numState,1]);
        XF  = SymVariable('xF',[domain.numState,1]);
        H_WR = domain.ContactPoints.RightToeBottom.computeForwardKinematics;
        H_WR0 = subs(H_WR, domain.States.x, X0);
        H_WRF = subs(H_WR, domain.States.x, XF);
        H_R0RF = H_WR0 \ H_WRF;
        p_R0RF = H_R0RF(1:3,end);
        step_length = [p_R0RF(2)/2; -p_R0RF(1)/2];
        step_length_fun = SymFunction(['step_length_', domain.Name], step_length, {X0,XF});
        
        step_length_cstr = NlpFunction('Name',['step_length_', domain.Name],...
            'Dimension',2,...
            'lb', bounds.step_length.lb,...
            'ub', bounds.step_length.ub ,...
            'Type','Nonlinear',...
            'SymFun',step_length_fun,...
            'DepVariables',[nlp.OptVarTable.x(1); nlp.OptVarTable.x(end)]);
        
        addConstraint(nlp, ['step_length_', domain.Name], 'last', step_length_cstr);
    end
    
    %% Swing Foot Clearance
    H_WR = domain.ContactPoints.RightToeBottom.computeForwardKinematics;
    H_WL = domain.ContactPoints.LeftToeBottom.computeForwardKinematics;
    H_LR = H_WL \ H_WR;
    p_LR = H_LR(1:3,end);
    expr = p_LR(3); % z distance of right toe measured from left toe
    swingFootHeight = SymFunction(['swingFootClearance_', domain.Name], expr, {domain.States.x});    
    addNodeConstraint(nlp, swingFootHeight, {'x'}, 'all', -Inf, Inf, 'Nonlinear');
    
    %% Swing Toe Pitch
    J_swToe = domain.ContactPoints.LeftToeBottom.computeBodyJacobian(domain.numState);
    v_swToe = J_swToe*domain.States.dx;
    swToePitch = SymFunction(['swingToePitch_',domain.Name], v_swToe(4), {domain.States.x, domain.States.dx});
    addNodeConstraint(nlp, swToePitch, {'x','dx'}, 'all', 0, 0, 'Nonlinear');
    
    %% Swing Toe Yaw
    J_swToe = domain.ContactPoints.LeftToeBottom.computeBodyJacobian(domain.numState);
    v_swToe = J_swToe*domain.States.dx;
    swToePitch = SymFunction(['swingToeYaw_',domain.Name], v_swToe(6), {domain.States.x, domain.States.dx});
    addNodeConstraint(nlp, swToePitch, {'x','dx'}, 'all', 0, 0, 'Nonlinear');
    
    %% Distance from Body to Toe
    p_stToe = domain.ContactPoints.LeftToeBottom.computeCartesianPosition;
    p_body = domain.States.x(1:3);
    expr = sqrt((p_stToe(1)-p_body(1)).^2 + (p_stToe(2)-p_body(2)).^2 + (p_stToe(3)-p_body(3)).^2);
    Body2ToeDistance = SymFunction(['Body2ToeDistance_',domain.Name], expr, {domain.States.x});
    addNodeConstraint(nlp, Body2ToeDistance, {'x'}, 'all', bounds.body_to_to_length.lb, bounds.body_to_to_length.ub, 'Nonlinear');

    %% Distance from Toe to Toe
    H_WR = domain.ContactPoints.RightToeBottom.computeForwardKinematics;
    H_WL = domain.ContactPoints.LeftToeBottom.computeForwardKinematics;
    H_RL = H_WR \ H_WL;
    p_RL = H_RL(1:3,end);
    expr = -p_RL(1); % x distance of left toe measured from right toe
    Body2ToeDistance = SymFunction(['Toe2ToeDistance_',domain.Name], expr, {domain.States.x});
    addNodeConstraint(nlp, Body2ToeDistance, {'x'}, 'all', bounds.toe_to_toe_width.lb, bounds.toe_to_toe_width.ub, 'Nonlinear');
        
    %% Final swing foot velocity
    p_swToe = domain.ContactPoints.RightToeBottom.computeCartesianPosition;
    v_swToe = jacobian(p_swToe, domain.States.x)*domain.States.dx;
    
    swingToeVelocity_x = SymFunction(['SwingToeVelocity_x_',domain.Name],v_swToe(1), {domain.States.x, domain.States.dx});
    addNodeConstraint(nlp, swingToeVelocity_x, {'x','dx'}, 'last', 0, 0, 'Nonlinear');
    
    swingToeVelocity_y = SymFunction(['SwingToeVelocity_y_',domain.Name],v_swToe(2), {domain.States.x, domain.States.dx});
    addNodeConstraint(nlp, swingToeVelocity_y, {'x','dx'}, 'last', 0, 0, 'Nonlinear');
    
    swingToeVelocity_z = SymFunction(['SwingToeVelocity_z_',domain.Name],v_swToe(3), {domain.States.x, domain.States.dx});
    addNodeConstraint(nlp, swingToeVelocity_z, {'x','dx'}, 'last', -2, 0, 'Nonlinear');
    
    %% Average roll
%     X = cell(1,nlp.NumNode);
%     for i = 1:nlp.NumNode
%         X{i}  = SymVariable(['x',num2str(i)],[domain.numState,1]);
%         if i == 1
%             average_roll = X{i}(4);
%         else
%             average_roll = average_roll + X{i}(4);
%         end
%     end
%     average_roll = average_roll/nlp.NumNode;
%     
%     average_roll_fun = SymFunction(['average_roll_', domain.Name], average_roll, X);
%     average_roll_cstr = NlpFunction('Name',['average_roll_', domain.Name],...
%         'Dimension',1,...
%         'lb', bounds.average_roll.lb,...
%         'ub', bounds.average_roll.ub ,...
%         'Type','Linear',...
%         'SymFun',average_roll_fun,...
%         'DepVariables',nlp.OptVarTable.x);
%     
%     addConstraint(nlp, ['average_roll_', domain.Name], 'last', average_roll_cstr);
   
    %% Average pitch
    X = cell(1,nlp.NumNode);
    for i = 1:nlp.NumNode
        X{i}  = SymVariable(['x',num2str(i)],[domain.numState,1]);
        if i == 1
            average_pitch = X{i}(5);
        else
            average_pitch = average_pitch + X{i}(5);
        end
    end
    average_pitch = average_pitch/nlp.NumNode;
    
    average_pitch_fun = SymFunction(['average_pitch_', domain.Name], average_pitch, X);
    average_pitch_cstr = NlpFunction('Name',['average_pitch_', domain.Name],...
        'Dimension',1,...
        'lb', bounds.average_pitch.lb,...
        'ub', bounds.average_pitch.ub ,...
        'Type','Linear',...
        'SymFun',average_pitch_fun,...
        'DepVariables',nlp.OptVarTable.x);
    
    addConstraint(nlp, ['average_pitch_', domain.Name], 'last', average_pitch_cstr);
    
    %% Average yaw
%     X = cell(1,nlp.NumNode);
%     for i = 1:nlp.NumNode
%         X{i}  = SymVariable(['x',num2str(i)],[domain.numState,1]);
%         if i == 1
%             average_yaw = X{i}(6);
%         else
%             average_yaw = average_yaw + X{i}(6);
%         end
%     end
%     average_yaw = average_yaw/nlp.NumNode;
%     
%     average_yaw_fun = SymFunction(['average_yaw_', domain.Name], average_yaw, X);
%     average_yaw_cstr = NlpFunction('Name',['average_yaw_', domain.Name],...
%         'Dimension',1,...
%         'lb', bounds.average_roll.lb,...
%         'ub', bounds.average_roll.ub ,...
%         'Type','Linear',...
%         'SymFun',average_yaw_fun,...
%         'DepVariables',nlp.OptVarTable.x);
%     
%     addConstraint(nlp, ['average_yaw_', domain.Name], 'last', average_yaw_cstr);
    
    %% Average hip abduction
    X = cell(1,nlp.NumNode);
    for i = 1:nlp.NumNode
        X{i}  = SymVariable(['x',num2str(i)],[domain.numState,1]);
        if i == 1
            average_hip_abduction = X{i}([7,14]);
        else
            average_hip_abduction = average_hip_abduction + X{i}([7,14]);
        end
    end
    average_hip_abduction = average_hip_abduction/nlp.NumNode;
    
    average_hip_abduction_fun = SymFunction(['average_hip_abduction_', domain.Name], average_hip_abduction, X);
    average_hip_abduction_cstr = NlpFunction('Name',['average_hip_abduction_', domain.Name],...
        'Dimension',2,...
        'lb', bounds.average_hip_abduction.lb,...
        'ub', bounds.average_hip_abduction.ub ,...
        'Type','Linear',...
        'SymFun',average_hip_abduction_fun,...
        'DepVariables',nlp.OptVarTable.x);
    
    addConstraint(nlp, ['average_hip_abduction_', domain.Name], 'last', average_hip_abduction_cstr);
    
    %% Average hip rotation
    X = cell(1,nlp.NumNode);
    for i = 1:nlp.NumNode
        X{i}  = SymVariable(['x',num2str(i)],[domain.numState,1]);
        if i == 1
            average_hip_rotation = X{i}([8,15]);
        else
            average_hip_rotation = average_hip_rotation + X{i}([8,15]);
        end
    end
    average_hip_rotation = average_hip_rotation/nlp.NumNode;
    
    average_hip_rotation_fun = SymFunction(['average_hip_rotation_', domain.Name], average_hip_rotation, X);
    average_hip_rotation_cstr = NlpFunction('Name',['average_hip_rotation_', domain.Name],...
        'Dimension',2,...
        'lb', bounds.average_hip_rotation.lb,...
        'ub', bounds.average_hip_rotation.ub ,...
        'Type','Linear',...
        'SymFun',average_hip_rotation_fun,...
        'DepVariables',nlp.OptVarTable.x);
    
    addConstraint(nlp, ['average_hip_rotation_', domain.Name], 'last', average_hip_rotation_cstr);
        
    %% Costs
    
    % Torque Cost
    u = domain.Inputs.Control.u;
    cost = sum((u).^2);
    cost_fun = SymFunction('torque', cost, {u});
    addRunningCost(nlp, cost_fun, 'u');
    
%     % Torso Pitch/Roll
%     q_torso = domain.States.x([5,6]);
%     cost = {sum((100.*q_torso).^2)};
%     cost_fun = SymFunction('q_torso', cost, {domain.States.x});
%     addRunningCost(nlp, cost_fun, 'x');
%     
%     % Hip Abduction Cost
%     q_hip_abduction = domain.States.x([8,16]);
%     cost = {sum((100.*q_hip_abduction).^2)};
%     cost_fun = SymFunction('q_hip_abduction', cost, {domain.States.x});
%     addRunningCost(nlp, cost_fun, 'x');
%     
%     % Hip Rotation Cost
%     q_hip_rotation = domain.States.x([9,17]);
%     cost = {sum((100.*q_hip_rotation).^2)};
%     cost_fun = SymFunction('q_hip_rotation', cost, {domain.States.x});
%     addRunningCost(nlp, cost_fun, 'x'); 

    
end


