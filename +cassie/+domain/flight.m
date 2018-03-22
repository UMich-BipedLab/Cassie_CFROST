function domain = flight(model, load_path, varargin)
    % construct the flight domain of Cassie
    
    % Parse inputs
    p = inputParser;
    p.addOptional('guard', 'none')
    p.parse(varargin{:});
    parser_results = p.Results;
    
    % Default domain name
    Name = 'Flight';

    % make a copy of the robot model
    domain = copy(model);

    switch parser_results.guard
        case 'none'
            % Do not add any events
            
        case 'left_impact'
            % Add event - height of left toe
            domain = addEvent(domain, cassie.unilateral.left_toe_height(domain));
   
        case 'right_impact'
            % Add event - height of right toe
            domain = addEvent(domain, cassie.unilateral.right_toe_height(domain));
            
        case 'double_support_impact'
            % Add event - height of both left and right toes
            domain = addEvent(domain, cassie.unilateral.left_toe_height(domain));
            domain = addEvent(domain, cassie.unilateral.right_toe_height(domain));
            
        otherwise
            error('Unknown event function')
    end

    % Virtual constraints
    domain = addVirtualConstraint(domain, cassie.virtual.actuated_joints(domain, load_path));
        
    % Set the name of the new copy
    domain.setName(Name);
   
end