function domain = right_stance(model, load_path, varargin)
    % construct the right stance domain of Cassie
    
    % Parse inputs
    p = inputParser;
    p.addOptional('guard', 'none')
    p.parse(varargin{:});
    parser_results = p.Results;
        
    % Default domain name
    Name = 'RightStance';

    % make a copy of the robot model
    domain = copy(model);
    % Add contact
    right_contact = cassie.holonomic.right_toe_contact(domain);
    domain = addContact(domain, right_contact.frame, right_contact.fric_coef, right_contact.geometry, load_path);
    
    switch parser_results.guard
        case 'none'
            % Do not add any events
        case 'left_impact'
            % Add event - height of non-stance foot left toe
            domain = addEvent(domain, cassie.unilateral.left_toe_height(domain));
        case 'right_lift'
            % Add event - ground reaction force of right toe
            domain = addEvent(domain, cassie.unilateral.right_toe_ground_reaction_force(domain));
        otherwise 
            error('Unknown guard.')
    end
    
    % virtual constraint
    domain = addVirtualConstraint(domain, cassie.virtual.actuated_joints(domain, load_path));
        
    % set the name of the new copy
    domain.setName(Name);
   
end