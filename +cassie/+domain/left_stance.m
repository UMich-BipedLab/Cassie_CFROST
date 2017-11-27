function domain = left_stance(model, load_path)
    % construct the left stance domain of Cassie

    % make a copy of the robot model
    domain = copy(model);
    % set the name of the new copy
    domain.setName('LeftStance');
    
    % Add contact
    contact = cassie.holonomic.left_toe_contact(domain);
    domain = addContact(domain, contact.frame, contact.fric_coef, contact.geometry, load_path);
    
    % Add event - height of non-stance foot (right toe)
    domain = addEvent(domain, cassie.unilateral.right_toe_height(domain));
   
    % virtual constraint
    domain = addVirtualConstraint(domain, cassie.virtual.actuated_joints(domain, load_path));
    
    % extra user constraints
    domain.UserNlpConstraint = @cassie.opt.left_stance_constraints;
   
end
    