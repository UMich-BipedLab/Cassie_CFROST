function right_impact(nlp, src, tar, bounds, varargin)
        
    % First call the class method
    nlp.Plant.rigidImpactConstraint(nlp, src, tar, bounds, varargin{:});
    
    % Don't need time continuity constraint
    removeConstraint(nlp,'tContDomain');
    
    % Remove default constraint and add back selectable one
    removeConstraint(nlp,['xDiscreteMap' nlp.Plant.Name]);
    selected = SymVariable('s',[nlp.Plant.numState,1]);
    R = nlp.Plant.R;
    x = nlp.Plant.States.x;
    xn = nlp.Plant.States.xn;
    x_diff = selected.*(R*x-xn);
    x_map = SymFunction(['xDiscreteMap' nlp.Plant.Name],x_diff,{x,xn}, selected);
    
    % Don't constrain the absolute position and yaw
    selected = ones(20,1);
    selected([1,2,3,4]) = 0; 
    addNodeConstraint(nlp, x_map, {'x','xn'}, 'first', 0, 0, 'Linear', selected);
end