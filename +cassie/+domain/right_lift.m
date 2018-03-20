% Right Foot Lift (guard)
function guard = right_lift(model, load_path)
    
    % Specify next domain
    domain = cassie.domain.left_stance(model, load_path);

    % set guard (impact for now, we remove all impact constraints though)
    guard = RigidImpact('RightLift_SS',domain,'rightToeGroundReactionForce');
    
    % set the impact constraint
    guard.addImpactConstraint(struct2array(domain.HolonomicConstraints), load_path);
    
end