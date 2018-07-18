function h_nsf = left_toe_height(robot)
    % left toe height constraint
    p_left_toe = getCartesianPosition(robot, robot.ContactPoints.LeftToeBottom);
    h_nsf = UnilateralConstraint(robot, p_left_toe(3), 'leftToeHeight', 'x');
end

 