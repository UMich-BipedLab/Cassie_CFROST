% Left Foot Lift (guard)
function guard = left_lift(model, load_path, varargin)

    % Parse inputs
    p = inputParser;
    p.addOptional('flight', false)
    p.parse(varargin{:});
    parser_results = p.Results;
    
    % Default domain name
    Name = 'LeftLift';
    
    % Specify next domain
    if parser_results.flight
        Name = [Name, 'Flight'];
        domain = cassie.domain.flight(model, load_path);
    else
        domain = cassie.domain.right_stance(model, load_path);
    end
    
    % set guard (impact for now, we remove all impact constraints though)
    guard = RigidImpact(Name, domain, 'leftToeGroundReactionForce');
    
    % set the impact constraint
    guard.addImpactConstraint(struct2array(domain.HolonomicConstraints), load_path);

end