function right_stance_constraints(nlp, bounds, varargin)
    
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
    
    %% Swing Foot Clearance
    X  = SymVariable('x',[domain.numState,1]);
    swingFootHeight = SymFunction(['swingFootClearance_',domain.Name], nlp.Plant.EventFuncs.leftToeHeight.ConstrExpr, {X});
    addNodeConstraint(nlp, swingFootHeight, {'x'}, floor(nlp.NumNode/2), 0.15, Inf,'Linear');
    
    %% Level swing toe
    J_swToe = domain.ContactPoints.LeftToeBottom.computeBodyJacobian(domain.numState);
    v_swToe = J_swToe*domain.States.dx;
    swToePitch = SymFunction(['swingToePitch_',domain.Name], v_swToe(4), {domain.States.x, domain.States.dx});
    addNodeConstraint(nlp, swToePitch, {'x','dx'}, 'all', 0, 0, 'Nonlinear');
    
    %% Distance from Body to Toe
    p_stToe = domain.ContactPoints.RightToeBottom.computeCartesianPosition;
    p_body = domain.States.x(1:3);
    expr = sqrt((p_stToe(1)-p_body(1)).^2 + (p_stToe(2)-p_body(2)).^2 + (p_stToe(3)-p_body(3)).^2);
    Body2ToeDistance = SymFunction(['Body2ToeDistance_',domain.Name],expr, {domain.States.x});
    addNodeConstraint(nlp, Body2ToeDistance, {'x'}, 'all', 0.5, 1, 'Nonlinear');

    %% Distance from Toe to Toe
    pR = domain.ContactPoints.RightToeBottom.computeCartesianPosition;
    pL = domain.ContactPoints.LeftToeBottom.computeCartesianPosition;
    expr = sqrt((pR(1)-pL(1)).^2 + (pR(2)-pL(2)).^2);
    Body2ToeDistance = SymFunction(['Toe2ToeDistance_',domain.Name],expr, {domain.States.x});
    addNodeConstraint(nlp, Body2ToeDistance, {'x'}, 'all', 0.2, Inf, 'Nonlinear');
    
    %% Final swing foot velocity
    p_swToe = domain.ContactPoints.LeftToeBottom.computeCartesianPosition;
    v_swToe = jacobian(p_swToe, domain.States.x)*domain.States.dx;
    
    swingToeVelocity_x = SymFunction(['SwingToeVelocity_x_',domain.Name],v_swToe(1), {domain.States.x, domain.States.dx});
    addNodeConstraint(nlp, swingToeVelocity_x, {'x','dx'}, 'last', 0, 0, 'Nonlinear');
    
    swingToeVelocity_y = SymFunction(['SwingToeVelocity_y_',domain.Name],v_swToe(2), {domain.States.x, domain.States.dx});
    addNodeConstraint(nlp, swingToeVelocity_y, {'x','dx'}, 'last', 0, 0, 'Nonlinear');
    
    swingToeVelocity_z = SymFunction(['SwingToeVelocity_z_',domain.Name],v_swToe(3), {domain.States.x, domain.States.dx});
    addNodeConstraint(nlp, swingToeVelocity_z, {'x','dx'}, 'last', -1, 0, 'Nonlinear');
   
 
    %% Costs
    
    % Torque Cost
    u = domain.Inputs.Control.u;
    cost = sum((u).^2);
    cost_fun = SymFunction('torque', cost, {u});
    addRunningCost(nlp, cost_fun, 'u');
    
    % Torso Pitch/Roll
    q_torso = domain.States.x([5,6]);
    cost = {sum((100.*q_torso).^2)};
    cost_fun = SymFunction('q_torso', cost, {domain.States.x});
    addRunningCost(nlp, cost_fun, 'x');
    
    % Hip Abduction Cost
    q_hip_abduction = domain.States.x([8,16]);
    cost = {sum((100.*q_hip_abduction).^2)};
    cost_fun = SymFunction('q_hip_abduction', cost, {domain.States.x});
    addRunningCost(nlp, cost_fun, 'x');
    
    % Hip Rotation Cost
    q_hip_rotation = domain.States.x([9,17]);
    cost = {sum((100.*q_hip_rotation).^2)};
    cost_fun = SymFunction('q_hip_rotation', cost, {domain.States.x});
    addRunningCost(nlp, cost_fun, 'x'); 

end


