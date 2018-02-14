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
            % RightStance -> LeftImpact (Relabel)
            %      ^                       |
            %      |_______________________|
            
            % Define domains
            right_stance = cassie.domain.right_stance(robot, load_path);
            left_impact  = cassie.domain.left_impact(right_stance, load_path, 'relabel', true);
            
            domains = [right_stance];
            guards = [left_impact];
            
            % Define hybrid system
            sys = HybridSystem('Cassie');
            sys = addVertex(sys, {'RightStance'}, 'Domain', {right_stance});
            srcs = {'RightStance'};
            tars = {'RightStance'};
            sys = addEdge(sys, srcs, tars);
            sys = setEdgeProperties(sys, srcs, tars, 'Guard', {left_impact});
            
        case 'two_step'
            % RightStance -> LeftImpact -> LeftStance -> RightImpact
            %      ^                                         |
            %      |_________________________________________|
            
            % Define domains
            right_stance = cassie.domain.right_stance(robot, load_path);
            left_stance  = cassie.domain.left_stance(robot, load_path);
            right_impact = cassie.domain.right_impact(right_stance, load_path);
            left_impact  = cassie.domain.left_impact(left_stance, load_path);
            
            domains = [right_stance, left_stance];
            guards = [left_impact, right_impact];
            
            % Define hybrid system
            sys = HybridSystem('Cassie');
            sys = addVertex(sys, {'RightStance','LeftStance'}, 'Domain', {right_stance, left_stance});
            srcs = {'RightStance','LeftStance'};
            tars = {'LeftStance','RightStance'};
            sys = addEdge(sys, srcs, tars);
            sys = setEdgeProperties(sys, srcs, tars, 'Guard', {left_impact, right_impact});
            
        case 'double_support'
            % Define domains
            right_double_support = cassie.domain.right_double_support(robot, load_path);
            
            domains = right_double_support;
            guards = [];
            sys = right_double_support;     
            
        case 'double_support_two_step'
            % RightDoubleSupport -> RightStance -> LeftImpact -> LeftDoubleSupport -> LeftStance -> RightImpact
            %      ^                                                                                    |
            %      |____________________________________________________________________________________|
            
            % Define domains
            right_double_support = cassie.domain.right_double_support(robot, load_path);
            left_double_support = cassie.domain.left_double_support(robot, load_path);
            right_lift = cassie.domain.right_lift(right_double_support, load_path);
            left_lift = cassie.domain.left_lift(left_double_support, load_path);
            
            right_stance = cassie.domain.right_stance(robot, load_path);
            left_stance  = cassie.domain.left_stance(robot, load_path);
            right_impact = cassie.domain.right_impact(right_stance, load_path);
            left_impact  = cassie.domain.left_impact(left_stance, load_path);
            
            domains = [right_double_support, right_stance, left_double_support, left_stance];
            guards = [left_impact, right_impact];
            
            % Define hybrid system             
            sys = HybridSystem('Cassie');
            sys = addVertex(sys, {'RightDoubleSupport', 'RightStance', 'LeftDoubleSupport', 'LeftStance'}, 'Domain', {right_double_support, right_stance, left_double_support, left_stance});            
            sys = addEdge(sys, 'RightDoubleSupport', 'RightStance');
            sys = setEdgeProperties(sys, 'RightDoubleSupport', 'RightStance', 'Guard', left_lift);
            sys = addEdge(sys, 'RightStance', 'LeftDoubleSupport');
            sys = setEdgeProperties(sys, 'RightStance', 'LeftDoubleSupport', 'Guard', left_impact);
            sys = addEdge(sys, 'LeftDoubleSupport', 'LeftStance');
            sys = setEdgeProperties(sys, 'LeftDoubleSupport', 'LeftStance', 'Guard', right_lift);
            sys = addEdge(sys, 'LeftStance', 'RightDoubleSupport');
            sys = setEdgeProperties(sys, 'LeftStance', 'RightDoubleSupport', 'Guard', right_impact);
            
        case 'double_support_two_step_v2'
            % RightDoubleSupport -> RightStance -> LeftImpact -> LeftDoubleSupport -> LeftStance -> RightImpact -> RightDoubleSupport
            
            % Define domains
            right_double_support = cassie.domain.right_double_support(robot, load_path);
            left_double_support = cassie.domain.left_double_support(robot, load_path);
            right_lift = cassie.domain.right_lift(right_double_support, load_path);
            left_lift = cassie.domain.left_lift(left_double_support, load_path);
            
            right_stance = cassie.domain.right_stance(robot, load_path);
            left_stance  = cassie.domain.left_stance(robot, load_path);
            right_impact = cassie.domain.right_impact(right_stance, load_path);
            left_impact  = cassie.domain.left_impact(left_stance, load_path);
            
            domains = [right_double_support, right_stance, left_double_support, left_stance];
            guards = [left_impact, right_impact];
            
            % Define hybrid system             
            sys = HybridSystem('Cassie');
            sys = addVertex(sys, {'RightDoubleSupport', 'RightStance', 'LeftDoubleSupport', 'LeftStance', 'FinalDoubleSupport'}, 'Domain', {right_double_support, right_stance, left_double_support, left_stance, right_double_support});            
            sys = addEdge(sys, 'RightDoubleSupport', 'RightStance');
            sys = setEdgeProperties(sys, 'RightDoubleSupport', 'RightStance', 'Guard', left_lift);
            sys = addEdge(sys, 'RightStance', 'LeftDoubleSupport');
            sys = setEdgeProperties(sys, 'RightStance', 'LeftDoubleSupport', 'Guard', left_impact);
            sys = addEdge(sys, 'LeftDoubleSupport', 'LeftStance');
            sys = setEdgeProperties(sys, 'LeftDoubleSupport', 'LeftStance', 'Guard', right_lift);
            sys = addEdge(sys, 'LeftStance', 'FinalDoubleSupport');
            sys = setEdgeProperties(sys, 'LeftStance', 'FinalDoubleSupport', 'Guard', right_impact);            
            
        otherwise
            error('Unknown behavior type')            
    end
    
end
