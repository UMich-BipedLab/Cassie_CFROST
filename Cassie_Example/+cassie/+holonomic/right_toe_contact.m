function contact = right_toe_contact(robot)
    % The right toe contact point
    contact.frame = ToContactFrame(robot.ContactPoints.RightToeBottom,...
        'LineContactWithFriction');
    contact.fric_coef.mu = 0.6;
    contact.fric_coef.gamma = 100;
    contact.geometry.la = 0.05;
    contact.geometry.lb = 0.05;
    
end