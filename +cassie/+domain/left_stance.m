function domain = left_stance(model, load_path, varargin)
    % construct the left stance domain of Cassie

    % Parse inputs
    p = inputParser;
    p.addOptional('guard', 'none')
    p.parse(varargin{:});
    parser_results = p.Results;
    
    % Default domain name
    Name = 'LeftStance';

    % make a copy of the robot model
    domain = copy(model);
    % Add contact
    left_contact = cassie.holonomic.left_toe_contact(domain);
    domain = addContact(domain, left_contact.frame, left_contact.fric_coef, left_contact.geometry, load_path);
    
    switch parser_results.guard
        case 'none'
            % Do not add any events
        case 'right_impact'
            % Add event - height of non-stance foot right toe
            domain = addEvent(domain, cassie.unilateral.right_toe_height(domain));
        case 'left_lift'
            % Add event - ground reaction force of left toe
            domain = addEvent(domain, cassie.unilateral.left_toe_ground_reaction_force(domain));
        otherwise 
            error('Unknown guard.')
    end
   
    % virtual constraint
    domain = addVirtualConstraint(domain, cassie.virtual.actuated_joints(domain, load_path));
        
    % set the name of the new copy
    domain.setName(Name);
   
end
    