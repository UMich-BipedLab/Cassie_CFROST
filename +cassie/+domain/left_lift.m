% Left Foot Lift (guard)
function guard = left_lift(domain, load_path)
    
    % set guard (impact for now, we remove all impact constraints though)
    guard = RigidImpact('LeftLift',domain,'leftToeGroundReactionForce');
    
    % set the impact constraint
    guard.addImpactConstraint(struct2array(domain.HolonomicConstraints), load_path);
    
    % extra impact constraints
    guard.UserNlpConstraint = @cassie.opt.left_lift_constraints;

end