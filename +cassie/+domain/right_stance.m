function domain = right_stance(model, load_path)
    % construct the right stance domain of Cassie

    % make a copy of the robot model
    domain = copy(model);
    % set the name of the new copy
    domain.setName('RightStance');
    
    % Add contact
    contact = cassie.holonomic.right_toe_contact(domain);
    domain = addContact(domain, contact.frame, contact.fric_coef, contact.geometry, load_path);
    
    % Add event - height of non-stance foot (left toe)
    domain = addEvent(domain, cassie.unilateral.left_toe_height(domain));
   
    % virtual constraint
    domain = addVirtualConstraint(domain, cassie.virtual.actuated_joints(domain, load_path));
    
    % extra user constraints
    domain.UserNlpConstraint = @cassie.opt.right_stance_constraints;
   
end