function right_impact_constraints(nlp, src, tar, bounds, varargin)
    
    plant = nlp.Plant;
    
    % fist call the class method
    plant.rigidImpactConstraint(nlp, src, tar, bounds, varargin{:});
    
    % Don't need time continuity constraint
    removeConstraint(nlp,'tContDomain');
    
    % Remove absolute x,y position from periodicity constraint
    R = plant.R;
    x = plant.States.x;
    xn = plant.States.xn;
    x_diff = R*x-xn;
    x_map = SymFunction(['xDiscreteMap' plant.Name], x_diff(4:end), {x,xn});
    
    addNodeConstraint(nlp, x_map, {'x','xn'}, 'first', 0, 0, 'Linear');
    
end