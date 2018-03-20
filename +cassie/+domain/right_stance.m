function domain = right_stance(model, load_path, varargin)
    % construct the right stance domain of Cassie
    
    % Parse inputs
    p = inputParser;
    p.addOptional('double_support', false)
    p.parse(varargin{:});
    parser_results = p.Results;
    
    % Default domain name
    Name = 'RightStance';

    % make a copy of the robot model
    domain = copy(model);
    
    if parser_results.double_support
        Name = [Name, '_DS'];
        % Add contacts
        right_contact = cassie.holonomic.right_toe_contact(domain);
        left_contact = cassie.holonomic.left_toe_contact(domain);
        domain = addContact(domain, right_contact.frame, right_contact.fric_coef, right_contact.geometry, load_path);
        domain = addContact(domain, left_contact.frame, left_contact.fric_coef, left_contact.geometry, load_path);
        % Add event - ground reaction force of non-stance foot (left toe)
        domain = addEvent(domain, cassie.unilateral.left_toe_ground_reaction_force(domain));
   
    else
        Name = [Name, '_SS'];
        % Add contact
        right_contact = cassie.holonomic.right_toe_contact(domain);
        domain = addContact(domain, right_contact.frame, right_contact.fric_coef, right_contact.geometry, load_path);
        % Add event - height of non-stance foot (left toe)
        domain = addEvent(domain, cassie.unilateral.left_toe_height(domain));
    end

    % virtual constraint
    domain = addVirtualConstraint(domain, cassie.virtual.actuated_joints(domain, load_path));
        
    % set the name of the new copy
    domain.setName(Name);
   
end