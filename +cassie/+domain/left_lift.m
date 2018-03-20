% Left Foot Lift (guard)
function guard = left_lift(model, load_path, varargin)
    
    % Specify next domain
    domain = cassie.domain.right_stance(model, load_path);
    
    % set guard (impact for now, we remove all impact constraints though)
    guard = RigidImpact('LeftLift_SS',domain,'leftToeGroundReactionForce');
    
    % set the impact constraint
    guard.addImpactConstraint(struct2array(domain.HolonomicConstraints), load_path);

end