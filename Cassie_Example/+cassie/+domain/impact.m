% Foot Impact (guard)
function guard = impact(model, load_path, varargin)
    
    % Parse inputs
    p = inputParser;
    p.addOptional('leg', 'left')
    p.addOptional('next_domain', 'single_support')
    p.addOptional('relabel', false)
    p.parse(varargin{:});
    parser_results = p.Results;
    
    % Default name
    Name = 'Impact';
            
    % Specify next domain
    switch parser_results.next_domain
        case 'single_support'
            domain = cassie.domain.single_support(model, load_path, 'leg', parser_results.leg);
        case 'double_support'
            Name = [Name, 'DoubleSupport'];
            domain = cassie.domain.double_support(model, load_path);
        otherwise
            error('Unknown domain')
    end
        
    % Choose based on impact leg
    switch parser_results.leg
        case 'right'
            % Default domain name
            Name = ['Right', Name];
            % Setup impact
            if parser_results.relabel
                Name = [Name, 'Relabel'];
                guard = RigidImpact(Name,domain,'rightToeHeight');
                guard.R = guard.R(:,[1:6,14:20,7:13]);
                guard.R(:,[2,4,6,7,8,14,15]) = -guard.R(:,[2,4,6,7,8,14,15]);
            else
                % Set Impact
                guard = RigidImpact(Name,domain,'rightToeHeight');
            end
            
        case 'left'
            % Default domain name
            Name = ['Left', Name];
            % Setup impact
            if parser_results.relabel
                Name = [Name, 'Relabel'];
                guard = RigidImpact(Name,domain,'leftToeHeight');
                guard.R = guard.R(:,[1:6,14:20,7:13]);
                guard.R(:,[2,4,6,7,8,14,15]) = -guard.R(:,[2,4,6,7,8,14,15]);
            else
                % Set Impact
                guard = RigidImpact(Name,domain,'leftToeHeight');
            end
            
        case 'double'
            % Default domain name
            Name = ['Double', Name];
            % Setup impact
            if parser_results.relabel
                Name = [Name, 'Relabel'];
                guard = RigidImpact(Name,domain,'leftToeHeight'); % TODO (Ross): should be both left and right toe height
                guard.R = guard.R(:,[1:6,14:20,7:13]);
                guard.R(:,[2,4,6,7,8,14,15]) = -guard.R(:,[2,4,6,7,8,14,15]);
            else
                % Set Impact
                guard = RigidImpact(Name,domain,'leftToeHeight'); % TODO (Ross): should be both left and right toe height
            end
            
        otherwise
            error('Unknown leg.')
    end
    
    % Set the impact constraint
    guard.addImpactConstraint(struct2array(domain.HolonomicConstraints), load_path);
    
end