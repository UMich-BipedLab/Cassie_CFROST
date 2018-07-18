Vx_range = linspace(-1, 1, 11);
Vy_range = linspace(-0.3, 0.3, 11);
H_range = linspace(-0.15, 0.15, 11);

counter = 1;

load(fullfile(local_res_path, 'funcs'));

for vx = Vx_range
    for vy = Vy_range
        for h = H_range
            % -------- Velocity ---------
            bounds = two_step.utils.getBounds(robot, vx, vy, h);
            
            nlp.updateVariableBounds(bounds);
            nlp.Phase(1).updateConstrProp('average_hip_abduction_RightStance', 'last', 'lb', bounds.RightStance.average_hip_abduction.lb, 'ub', bounds.RightStance.average_hip_abduction.ub);
            nlp.Phase(3).updateConstrProp('average_hip_abduction_LeftStance', 'last', 'lb', bounds.LeftStance.average_hip_abduction.lb, 'ub', bounds.LeftStance.average_hip_abduction.ub);
            nlp.Phase(1).updateConstrProp('average_hip_rotation_RightStance', 'last', 'lb', bounds.RightStance.average_hip_rotation.lb, 'ub', bounds.RightStance.average_hip_rotation.ub);
            nlp.Phase(3).updateConstrProp('average_hip_rotation_LeftStance', 'last', 'lb', bounds.LeftStance.average_hip_rotation.lb, 'ub', bounds.LeftStance.average_hip_rotation.ub);

            velocity = [vx; vy];
            nlp.Phase(1).updateConstrProp('average_velocity_RightStance', 'last', 'lb', velocity, 'ub', velocity);
            nlp.Phase(3).updateConstrProp('average_velocity_LeftStance', 'last', 'lb', velocity, 'ub', velocity);
            
            if abs(vy) <= 1e-3
                nlp.Phase(1).updateConstrProp('BezierSymmetry', 'last', 'lb', 0, 'ub', 0);
            else
                nlp.Phase(1).updateConstrProp('BezierSymmetry', 'last', 'lb', -inf, 'ub', inf);
            end

            % ------- Step Height ---------
            step_height = h;
            % Right Stance Guard
            for k = 1:length(nlp.Phase(1).ConstrTable.u_leftToeHeight_cassie)-1
                nlp.Phase(1).ConstrTable.u_leftToeHeight_cassie(k).updateProp('lb', -Inf, 'ub', Inf);
            end
            nlp.Phase(1).ConstrTable.u_leftToeHeight_cassie(end).updateProp('lb', step_height, 'ub', step_height);
            % Left Stance Guard
            for k = 1:length(nlp.Phase(3).ConstrTable.u_rightToeHeight_cassie)-1
                nlp.Phase(3).ConstrTable.u_rightToeHeight_cassie(k).updateProp('lb', -Inf, 'ub', Inf);
            end
            nlp.Phase(3).ConstrTable.u_rightToeHeight_cassie(end).updateProp('lb', 2*step_height, 'ub', 2*step_height);
            
            nlp.Phase(1).ConstrTable.swing_knee_velocity_RightStance(end).updateProp('lb', bounds.RightStance.swing_knee_vel.lb, 'ub', bounds.RightStance.swing_knee_vel.ub);
            nlp.Phase(3).ConstrTable.swing_knee_velocity_LeftStance(end).updateProp('lb', bounds.LeftStance.swing_knee_vel.lb, 'ub', bounds.LeftStance.swing_knee_vel.ub);
            
            nlp.Phase(1).ConstrTable.swing_toe_linear_velocity_x_RightStance(end).updateProp('lb', bounds.RightStance.swing_toe_vel_x.lb, 'ub', bounds.RightStance.swing_toe_vel_x.ub);
            nlp.Phase(3).ConstrTable.swing_toe_linear_velocity_x_LeftStance(end).updateProp('lb', bounds.LeftStance.swing_toe_vel_x.lb, 'ub', bounds.LeftStance.swing_toe_vel_x.ub);
            nlp.Phase(1).ConstrTable.swing_toe_linear_velocity_y_RightStance(end).updateProp('lb', bounds.RightStance.swing_toe_vel_y.lb, 'ub', bounds.RightStance.swing_toe_vel_y.ub);
            nlp.Phase(3).ConstrTable.swing_toe_linear_velocity_y_LeftStance(end).updateProp('lb', bounds.LeftStance.swing_toe_vel_y.lb, 'ub', bounds.LeftStance.swing_toe_vel_y.ub);
            nlp.Phase(1).ConstrTable.swing_toe_linear_velocity_z_RightStance(end).updateProp('lb', bounds.RightStance.swing_toe_vel_z.lb, 'ub', bounds.RightStance.swing_toe_vel_z.ub);
            nlp.Phase(3).ConstrTable.swing_toe_linear_velocity_z_LeftStance(end).updateProp('lb', bounds.LeftStance.swing_toe_vel_z.lb, 'ub', bounds.LeftStance.swing_toe_vel_z.ub);
            
            nlp.update();
            
            solver = IpoptApplication(nlp);
            frost_c.createBoundsFile(solver, funcs, data_path, sprintf('bounds_%d', counter));
            
            fprintf('Done with bounds_%d.json\n', counter);
            
            counter = counter + 1;
        end
    end
end
