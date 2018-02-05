% Right Foot Lift (guard)
function guard = right_lift(domain, load_path)
    
    % set guard (impact for now, we remove all impact constraints though)
    guard = RigidImpact('RightLift',domain,'rightToeGroundReactionForce');
    
    % set the impact constraint
    guard.addImpactConstraint(struct2array(domain.HolonomicConstraints), load_path);
    
    % extra impact constraints
    guard.UserNlpConstraint = @cassie.opt.right_lift_constraints;

end