function obj = FuncErrorCost( obj, v_des )

% obj is a (non-hybrid) trajectory optimization program

DOF = 7;
% variables
T  = SymVariable('t',[2,1]);
X0  = SymVariable('x0',[DOF,1]);
XF  = SymVariable('xF',[DOF,1]);
% parameter
Vdes = SymVariable('vdes');

avg_vel_cost = ((XF(1) - X0(1)) / (T(2) - T(1)) - Vdes ).^2;
s_dep_vars = {T, X0, XF};
s_dep_params = {Vdes};
avg_vel_fun = SymFunction(['avg_vel_cost_', obj.Name], ...
    avg_vel_cost, s_dep_vars, s_dep_params);

avg_vel_nlp_fun = NlpFunction('Name', 'avg_vel_nlp_cost', ...
    'Dimension', 1, ...
    'Type', 'Nonlinear', ...
    'SymFun', avg_vel_fun, ...
    'DepVariables', [obj.OptVarTable.T(1); obj.OptVarTable.x(1); obj.OptVarTable.x(end)], ...
    'AuxData', v_des);

obj = addCost( obj, avg_vel_fun.Name, 'last', avg_vel_nlp_fun );