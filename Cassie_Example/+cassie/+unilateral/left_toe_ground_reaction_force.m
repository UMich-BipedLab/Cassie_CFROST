function h_nsf = left_toe_ground_reaction_force(robot)
% left toe ground reaction force
GRF = robot.Inputs.ConstraintWrench.fLeftToeBottom;
h_nsf = UnilateralConstraint(robot, GRF(3), 'leftToeGroundReactionForce', 'fLeftToeBottom');

end

