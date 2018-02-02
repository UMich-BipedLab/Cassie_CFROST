function domain = right_double_support(model, load_path)
    % construct the double support right domain of Cassie

    % make a copy of the robot model
    domain = copy(model);
    % set the name of the new copy
    domain.setName('RightDoubleSupport');
    
    % Add contacts
    right_contact = cassie.holonomic.right_toe_contact(domain);
    left_contact = cassie.holonomic.left_toe_contact(domain);
    domain = addContact(domain, right_contact.frame, right_contact.fric_coef, right_contact.geometry, load_path);
    domain = addContact(domain, left_contact.frame, left_contact.fric_coef, left_contact.geometry, load_path);
    
    % Add event - height of non-stance foot (left toe)
    domain = addEvent(domain, cassie.unilateral.left_toe_ground_reaction_force(domain));
   
    % virtual constraint
    domain = addVirtualConstraint(domain, cassie.virtual.actuated_joints(domain, load_path));
    
    % extra user constraints
    domain.UserNlpConstraint = @cassie.opt.right_double_support_constraints;
   
end