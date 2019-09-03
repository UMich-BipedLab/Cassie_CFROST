function ModelErrorCost(nlp)
    
    idx = 1; % first state of the robot, x position

%     x  = SymVariable('x',[nlp.Plant.numState,1]);
%     dx = SymVariable('dx',[nlp.Plant.numState,1]);
%     xo   = x(1);
%     dxo  = dx(1);
    
    % variables
    T   = SymVariable('t',[2,1]);
    x_current   = SymVariable('x',[nlp.Plant.numState,1]);% SymVariable('xCurrent', [nlp.Plant.numState, 1]);
    
    xo  = SymVariable('xo');
    dxo = SymVariable('dxo');
    Indx = SymVariable('idex');
    g = SymVariable('grav');
    h = SymVariable('heig');  
    
    Ts = (Indx-1).*(T(2) - T(1))./nlp.NumNode;
    LIP_x = exp((Ts.*sqrt(g.*h))./h)*(dxo.*h + xo.*sqrt(g.*h)) - exp(-(Ts.*sqrt(g.*h))./h).*(dxo.*h - xo.*sqrt(g.*h));
    LIP_x =  LIP_x./(2.*sqrt(g.*h));
    cost  = (x_current(1) - LIP_x).^2;
%     Jcost = jacobian(cost, symvar([T; x_current]));
        
        
    cost_func = SymFunction(['modelError_', nlp.Name], cost, {T, x_current}, {xo,dxo, g,h,Indx});

   
    for k = 2:nlp.NumNode
        addNodeCost(nlp, cost_func, {'T','x'}, k, {-0.3, 0.5, 2, 0.8, k});
    end
    
    nlp.update;
end
