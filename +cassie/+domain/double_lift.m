% Left and Right Foot Lift (guard)
function guard = double_lift(model, load_path)

    % Default domain name
    Name = 'DoubleLift';
    
    % Specify next domain
    domain = cassie.domain.flight(model, load_path);
    
    % set guard (impact for now, we remove all impact constraints though)
    guard = RigidImpact(Name, domain, 'leftToeGroundReactionForce');
    
    % set the impact constraint
    guard.addImpactConstraint(struct2array(domain.HolonomicConstraints), load_path);

end