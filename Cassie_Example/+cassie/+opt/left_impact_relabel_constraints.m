function left_impact_relabel_constraints(nlp, src, tar, bounds, varargin)
    
    plant = nlp.Plant;
    
    % fist call the class method
    plant.rigidImpactConstraint(nlp, src, tar, bounds, varargin{:});
    
    % Don't need time continuity constraint
    removeConstraint(nlp,'tContDomain');
    
    % We do not want to constrain the absolute position, so we remove the 
    % default constraint and reconstruct it 
    removeConstraint(nlp,['xDiscreteMap' plant.Name]);
    R = plant.R;
    x = plant.States.x;
    xn = plant.States.xn;
    x_diff = R*x-xn;
    x_map = SymFunction(['xDiscreteMap' plant.Name],x_diff(4:end),{x,xn});
    addNodeConstraint(nlp, x_map, {'x','xn'}, 'first', 0, 0, 'Linear');
end