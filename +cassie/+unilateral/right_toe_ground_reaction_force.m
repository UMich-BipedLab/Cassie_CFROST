function h_nsf = right_toe_ground_reaction_force(robot)
% right toe ground reaction force
GRF = robot.Inputs.ConstraintWrench.fRightToeBottom;
h_nsf = UnilateralConstraint(robot, GRF(3), 'rightToeGroundReactionForce', 'fRightToeBottom');

end

