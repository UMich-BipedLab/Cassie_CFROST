% Left Foot Impact (guard)
function guard = left_impact(domain, load_path, varargin)
    
    % Parse inputs
    p = inputParser;
    p.addOptional('relabel', false)
    p.parse(varargin{:});
    parser_results = p.Results;
    
    if parser_results.relabel
        % set impact
        guard = RigidImpact('LeftImpactRelabel',domain,'leftToeHeight');
        % Relabeling Matrix
        guard.R = guard.R(:,[1:6,14:20,7:13]);
        guard.R(:,[2,4,5,7,8,14,15]) = -guard.R(:,[2,4,5,7,8,14,15]);
        % extra impact constraints
        guard.UserNlpConstraint = @cassie.opt.left_impact_relabel_constraints;
    else
        % set impact
        guard = RigidImpact('LeftImpact',domain,'leftToeHeight');
        % extra impact constraints
        guard.UserNlpConstraint = @cassie.opt.left_impact_constraints;
    end
    
    % set the impact constraint
    guard.addImpactConstraint(struct2array(domain.HolonomicConstraints), load_path);

end