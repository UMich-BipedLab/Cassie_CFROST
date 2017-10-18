% Right Foot Impact (guard)
function guard = right_impact(domain, load_path)
    
    % set impact
    guard = RigidImpact('RightImpact',domain,'rightToeHeight');
    
    % set the impact constraint
    guard.addImpactConstraint(struct2array(domain.HolonomicConstraints), load_path);
    
    % extra impact constraints
    guard.UserNlpConstraint = @cassie.opt.right_impact_constraints;

end