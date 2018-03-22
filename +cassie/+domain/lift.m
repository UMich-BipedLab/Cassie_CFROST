% Foot Lift (guard)
function guard = lift(model, load_path, varargin)

    % Parse inputs
    p = inputParser;
    p.addOptional('leg', 'left')
    p.addOptional('next_domain', 'flight')
    p.parse(varargin{:});
    parser_results = p.Results;
    
    % Default domain name
    Name = 'Lift';
           
    % Specify next domain
    switch parser_results.next_domain
        case 'single_support'
            Name = [Name, 'SingleSupport'];
            % Next domain is the opposite leg than the one lifted
            switch parser_results.leg
                case 'left'
                    domain = cassie.domain.single_support(model, load_path, 'leg', 'right');
                case 'right'
                    domain = cassie.domain.single_support(model, load_path, 'leg', 'left');
                otherwise
                    error('Unknown leg')
            end
            
        case 'flight'
            domain = cassie.domain.flight(model, load_path);

        otherwise
            error('Unknown domain')
    end

    
    % Choose based on lifted leg
    switch parser_results.leg
        case 'left'
            Name = ['Left',Name];
            % set guard (impact for now, we remove all impact constraints though)
            guard = RigidImpact(Name, domain, 'leftToeGroundReactionForce');
        case 'right'
            Name = ['Right',Name];
            % set guard (impact for now, we remove all impact constraints though)
            guard = RigidImpact(Name, domain, 'rightToeGroundReactionForce');
        case 'double'
            Name = ['Double',Name];
            % set guard (impact for now, we remove all impact constraints though)
            guard = RigidImpact(Name, domain, 'rightToeGroundReactionForce'); % TODO (Ross): should be both left and right toe GRF
        otherwise
            error('Unknown leg')
    end
    
    
    % Set the impact constraint
    guard.addImpactConstraint(struct2array(domain.HolonomicConstraints), load_path);
    
end