function [sys,domains,guards] = load_behavior(robot, load_path, varargin)
    %% Flat-footed wakling
    
    % Parse inputs
    p = inputParser;
    p.addOptional('type', 'two_step')
    p.parse(varargin{:});
    parser_results = p.Results;
    
    % Choose behavior type
    switch parser_results.type
        
        case 'one_step'
            % RightStance_SS -> LeftImpact_SS_Relabel
            %      ^                   |
            %      |___________________|
            
            % Define domains
            right_stance = cassie.domain.right_stance(robot, load_path);
            left_impact  = cassie.domain.left_impact(robot, load_path, 'relabel', true);
            
            domains = right_stance;
            guards = left_impact;
            
            % Define hybrid system
            sys = HybridSystem('Cassie');
            sys = addVertex(sys, {'RightStance_SS'}, 'Domain', {right_stance});
            srcs = {'RightStance_SS'};
            tars = {'RightStance_SS'};
            sys = addEdge(sys, srcs, tars);
            sys = setEdgeProperties(sys, srcs, tars, 'Guard', {left_impact});
            
        case 'two_step'
            % RightStance_SS -> LeftImpact_SS -> LeftStance_SS -> RightImpact_SS
            %      ^                                                   |
            %      |___________________________________________________|
            
            % Define domains
            right_stance = cassie.domain.right_stance(robot, load_path);
            left_stance  = cassie.domain.left_stance(robot, load_path);
            right_impact = cassie.domain.right_impact(robot, load_path);
            left_impact  = cassie.domain.left_impact(robot, load_path);
            
            domains = [right_stance, left_stance];
            guards = [left_impact, right_impact];
            
            % Define hybrid system
            sys = HybridSystem('Cassie');
            sys = addVertex(sys, {'RightStance_SS','LeftStance_SS'}, 'Domain', {right_stance, left_stance});
            srcs = {'RightStance_SS','LeftStance_SS'};
            tars = {'LeftStance_SS','RightStance_SS'};
            sys = addEdge(sys, srcs, tars);
            sys = setEdgeProperties(sys, srcs, tars, 'Guard', {left_impact, right_impact});
            
        case 'standing'
            % Define domains
            standing = cassie.domain.right_stance(robot, load_path, 'double_support', true);
            
            domains = standing;
            guards = [];
            sys = standing;     
            
        case 'one_step_double_support'
            % RightStance_DS -> LeftLift_SS -> RightStance_SS -> LeftImpact_DS_Relabel
            %      ^                                                   |
            %      |___________________________________________________|
            
            % Define domains
            right_stance_ds = cassie.domain.right_stance(robot, load_path, 'double_support', true);
            right_stance_ss = cassie.domain.right_stance(robot, load_path);
            
            left_lift = cassie.domain.left_lift(robot, load_path);
            left_impact  = cassie.domain.left_impact(robot, load_path, 'double_support', true, 'relabel', true);
            
            domains = [right_stance_ds, right_stance_ss];
            guards = [left_lift, left_impact];
            
            % Define hybrid system             
            sys = HybridSystem('Cassie');
            sys = addVertex(sys, {'RightStance_DS', 'RightStance_SS'}, 'Domain', {right_stance_ds, right_stance_ss});            
            sys = addEdge(sys, 'RightStance_DS', 'RightStance_SS');
            sys = setEdgeProperties(sys, 'RightStance_DS', 'RightStance_SS', 'Guard', left_lift);
            sys = addEdge(sys, 'RightStance_SS', 'RightStance_DS');
            sys = setEdgeProperties(sys, 'RightStance_SS', 'RightStance_DS', 'Guard', left_impact);

                 
            
        case 'two_step_double_support'
            % RightStance_DS -> LeftLift_SS -> RightStance_SS -> LeftImpact_DS -> LeftStance_DS -> RightLift_SS -> LeftStance_SS -> RightImpact_DS
            %      ^                                                                                                                      |
            %      |______________________________________________________________________________________________________________________|
            
            % Define domains
            right_stance_ds = cassie.domain.right_stance(robot, load_path, 'double_support', true);
            left_stance_ds = cassie.domain.left_stance(robot, load_path, 'double_support', true);
            
            right_stance_ss = cassie.domain.right_stance(robot, load_path);
            left_stance_ss  = cassie.domain.left_stance(robot, load_path);
            
            right_lift = cassie.domain.right_lift(robot, load_path);
            left_lift = cassie.domain.left_lift(robot, load_path);
            
            right_impact = cassie.domain.right_impact(robot, load_path, 'double_support', true);
            left_impact  = cassie.domain.left_impact(robot, load_path, 'double_support', true);
            
            domains = [right_stance_ds, right_stance_ss, left_stance_ds, left_stance_ss];
            guards = [left_lift, left_impact, right_lift, right_impact];
            
            % Define hybrid system             
            sys = HybridSystem('Cassie');
            sys = addVertex(sys, {'RightStance_DS', 'RightStance_SS', 'LeftStance_DS', 'LeftStance_SS'}, 'Domain', {right_stance_ds, right_stance_ss, left_stance_ds, left_stance_ss});            
            sys = addEdge(sys, 'RightStance_DS', 'RightStance_SS');
            sys = setEdgeProperties(sys, 'RightStance_DS', 'RightStance_SS', 'Guard', left_lift);
            sys = addEdge(sys, 'RightStance_SS', 'LeftStance_DS');
            sys = setEdgeProperties(sys, 'RightStance_SS', 'LeftStance_DS', 'Guard', left_impact);
            sys = addEdge(sys, 'LeftStance_DS', 'LeftStance_SS');
            sys = setEdgeProperties(sys, 'LeftStance_DS', 'LeftStance_SS', 'Guard', right_lift);
            sys = addEdge(sys, 'LeftStance_SS', 'RightStance_DS');
            sys = setEdgeProperties(sys, 'LeftStance_SS', 'RightStance_DS', 'Guard', right_impact);
                 
            
        otherwise
            error('Unknown behavior type')            
    end
    
end
