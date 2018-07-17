function domain = single_support(model, load_path, varargin)
    % construct the left stance domain of Cassie

    % Parse inputs
    p = inputParser;
    p.addOptional('leg', 'right')
    p.addOptional('guard', 'none')
    p.parse(varargin{:});
    parser_results = p.Results;
    
    % Make a copy of the robot model
    domain = copy(model);
    
    % Choose stance leg
    switch parser_results.leg
        case 'right'
            % Default domain name
            Name = 'RightStance';
            % Add right toe contact
            right_contact = cassie.holonomic.right_toe_contact(domain);
            domain = addContact(domain, right_contact.frame, right_contact.fric_coef, right_contact.geometry, load_path);
        case 'left'
            % Default domain name
            Name = 'LeftStance';
            % Add left toe contact
            left_contact = cassie.holonomic.left_toe_contact(domain);
            domain = addContact(domain, left_contact.frame, left_contact.fric_coef, left_contact.geometry, load_path);
        otherwise
            error('Unknown leg.')
    end
    
    % Choose guard
    switch parser_results.guard
        case 'none'
            % Do not add any events
        case 'right_impact'
            % Add event - height of non-stance foot right toe
            domain = addEvent(domain, cassie.unilateral.right_toe_height(domain));
        case 'left_impact'
            % Add event - height of non-stance foot left toe
            domain = addEvent(domain, cassie.unilateral.left_toe_height(domain));
        case 'right_lift'
            % Add event - ground reaction force of right toe
            domain = addEvent(domain, cassie.unilateral.right_toe_ground_reaction_force(domain));
        case 'left_lift'
            % Add event - ground reaction force of left toe
            domain = addEvent(domain, cassie.unilateral.left_toe_ground_reaction_force(domain));
        otherwise
            error('Unknown guard.')
    end
   
    % Virtual constraint
    domain = addVirtualConstraint(domain, cassie.virtual.actuated_joints(domain, load_path));
        
    % Set the name of the new copy
    domain.setName(Name);
   
end
    