% Right Foot Impact (guard)
function guard = right_impact(model, load_path, varargin)
    
    % Parse inputs
    p = inputParser;
    p.addOptional('double_support', false)
    p.addOptional('relabel', false)
    p.parse(varargin{:});
    parser_results = p.Results;
    
    % Default domain name
    Name = 'RightImpact';
    
    % Specify next domain
    if parser_results.double_support
        Name = [Name, '_DS'];
        domain = cassie.domain.right_stance(model, load_path, 'double_support', true);
    else
        Name = [Name, '_SS'];
        domain = cassie.domain.right_stance(model, load_path);
    end
    
    if parser_results.relabel
        Name = [Name, '_Relabel'];
        % Set Impact
        guard = RigidImpact(Name,domain,'rightToeHeight');
        % Relabeling Matrix
        guard.R = guard.R(:,[1:6,14:20,7:13]);
        guard.R(:,[2,4,6,7,8,14,15]) = -guard.R(:,[2,4,6,7,8,14,15]);
    else
        % Set Impact
        guard = RigidImpact(Name,domain,'rightToeHeight');
    end
    
    % Set the impact constraint
    guard.addImpactConstraint(struct2array(domain.HolonomicConstraints), load_path);
    
end