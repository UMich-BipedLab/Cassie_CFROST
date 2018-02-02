function domain = left_double_support(model, load_path)
    % construct the double support left domain of Cassie

    % make a copy of the robot model
    domain = copy(model);
    % set the name of the new copy
    domain.setName('LeftDoubleSupport');
    
    % Add contacts
    right_contact = cassie.holonomic.right_toe_contact(domain);
    left_contact = cassie.holonomic.left_toe_contact(domain);
    domain = addContact(domain, right_contact.frame, right_contact.fric_coef, right_contact.geometry, load_path);
    domain = addContact(domain, left_contact.frame, left_contact.fric_coef, left_contact.geometry, load_path);
    
    % Add event - height of non-stance foot (right toe)
    domain = addEvent(domain, cassie.unilateral.right_toe_ground_reaction_force(domain));
   
    % virtual constraint
    domain = addVirtualConstraint(domain, cassie.virtual.actuated_joints(domain, load_path));
    
    % extra user constraints
    domain.UserNlpConstraint = @cassie.opt.left_double_support_constraints;
   
end