function domain = double_support(model, load_path, varargin)
    % construct the right stance domain of Cassie
    
    % Parse inputs
    p = inputParser;
    p.addOptional('guard', 'none')
    p.parse(varargin{:});
    parser_results = p.Results;
    
    % Default domain name
    Name = 'DoubleSupport';

    % make a copy of the robot model
    domain = copy(model);
    
    % Add contacts
    right_contact = cassie.holonomic.right_toe_contact(domain);
    left_contact = cassie.holonomic.left_toe_contact(domain);
    domain = addContact(domain, right_contact.frame, right_contact.fric_coef, right_contact.geometry, load_path);
    domain = addContact(domain, left_contact.frame, left_contact.fric_coef, left_contact.geometry, load_path);

    switch parser_results.guard
        case 'none'
            % Do not add any events
        case 'left_lift'
            % Add event - ground reaction force of left toe
            domain = addEvent(domain, cassie.unilateral.left_toe_ground_reaction_force(domain));
        case 'right_lift'
            % Add event - ground reaction force of right toe
            domain = addEvent(domain, cassie.unilateral.right_toe_ground_reaction_force(domain));
        case 'double_lift'
            % Add event - ground reaction force of both left and right toes
            domain = addEvent(domain, cassie.unilateral.left_toe_ground_reaction_force(domain));
            domain = addEvent(domain, cassie.unilateral.right_toe_ground_reaction_force(domain));        
        otherwise
            error('Unknown event function')
    end

    % Virtual constraints
    domain = addVirtualConstraint(domain, cassie.virtual.actuated_joints(domain, load_path));
        
    % Set the name of the new copy
    domain.setName(Name);
   
end