% Left Foot Impact (guard)
function guard = left_impact(domain, load_path)
    
    % set impact
    guard = RigidImpact('LeftImpact',domain,'leftToeHeight');
    
    % set the impact constraint
    guard.addImpactConstraint(struct2array(domain.HolonomicConstraints), load_path);
    
    % extra impact constraints
    guard.UserNlpConstraint = @cassie.opt.left_impact_constraints;

end