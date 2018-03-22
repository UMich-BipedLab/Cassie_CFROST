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
            % RightStance -> LeftImpactRelabel
            %      ^                   |
            %      |___________________|
            
            % Define domains
            right_stance = cassie.domain.single_support(robot, load_path, 'leg', 'right', 'guard', 'left_impact');
            left_impact  = cassie.domain.impact(robot, load_path, 'leg', 'left', 'relabel', true);
            
            domains = right_stance;
            guards = left_impact;
            
            % Define hybrid system
            sys = HybridSystem('Cassie');
            sys = addVertex(sys, {'RightStance'}, 'Domain', {right_stance});
            srcs = {'RightStance'};
            tars = {'RightStance'};
            sys = addEdge(sys, srcs, tars);
            sys = setEdgeProperties(sys, srcs, tars, 'Guard', {left_impact});
            
        case 'two_step'
            % RightStance -> LeftImpact -> LeftStance -> RightImpact
            %      ^                                          |
            %      |__________________________________________|
            
            % Define domains
            right_stance = cassie.domain.single_support(robot, load_path, 'leg', 'right', 'guard', 'left_impact');
            left_impact  = cassie.domain.impact(robot, load_path, 'leg', 'left');
            left_stance = cassie.domain.single_support(robot, load_path, 'leg', 'left', 'guard', 'right_impact');
            right_impact  = cassie.domain.impact(robot, load_path, 'leg', 'right');
            
            domains = [right_stance, left_stance];
            guards = [left_impact, right_impact];
            
            % Define hybrid system
            sys = HybridSystem('Cassie');
            sys = addVertex(sys, {'RightStance','LeftStance'}, 'Domain', {right_stance, left_stance});
            srcs = {'RightStance','LeftStance'};
            tars = {'LeftStance','RightStance'};
            sys = addEdge(sys, srcs, tars);
            sys = setEdgeProperties(sys, srcs, tars, 'Guard', {left_impact, right_impact});
            
        case 'three_step'
            % RightStance -> LeftImpact -> LeftStance -> RightImpact -> RightStance2 
            %      ^                                                         |
            %      |_________________________________________________________|
            
            % Define domains
            right_stance_1 = cassie.domain.single_support(robot, load_path, 'leg', 'right', 'guard', 'left_impact');
            left_impact  = cassie.domain.impact(robot, load_path, 'leg', 'left');
            left_stance_1 = cassie.domain.single_support(robot, load_path, 'leg', 'left', 'guard', 'right_impact');
            right_impact  = cassie.domain.impact(robot, load_path, 'leg', 'right');
            right_stance_2 = cassie.domain.single_support(robot, load_path, 'leg', 'right', 'guard', 'left_impact');

            domains = [right_stance_1, left_stance_1, right_stance_2];
            guards = [left_impact, right_impact];
            
            % Define hybrid system
            sys = HybridSystem('Cassie');
            sys = addVertex(sys, {'RightStance1','LeftStance1','RightStance2'}, 'Domain', {right_stance_1, left_stance_1, right_stance_2});
            sys = addEdge(sys, 'RightStance1', 'LeftStance1');
            sys = setEdgeProperties(sys, 'RightStance1', 'LeftStance1', 'Guard', left_impact);
            sys = addEdge(sys, 'LeftStance1', 'RightStance2');
            sys = setEdgeProperties(sys, 'LeftStance1', 'RightStance2', 'Guard', right_impact);
                        
        case 'one_step_running'
            % RightStance -> Right_Lift -> Flight -> LeftImpactRelabel
            %      ^                                         |
            %      |_________________________________________|
            
            % Define domains
            right_stance = cassie.domain.single_support(robot, load_path, 'leg', 'right', 'guard', 'right_lift');
            right_lift  = cassie.domain.lift(robot, load_path, 'leg', 'right', 'next_domain', 'flight');
            flight = cassie.domain.flight(robot, load_path, 'guard', 'left_impact');
            left_impact  = cassie.domain.impact(robot, load_path, 'leg', 'left', 'relabel', true);
            
            domains = [right_stance, flight];
            guards = [right_lift, left_impact];
            
            % Define hybrid system
            sys = HybridSystem('Cassie');
            sys = addVertex(sys, {'RightStance','Flight'}, 'Domain', {right_stance, flight});
            sys = addEdge(sys, 'RightStance', 'Flight');
            sys = setEdgeProperties(sys, 'RightStance', 'Flight', 'Guard', {right_lift});
            sys = addEdge(sys, 'Flight', 'RightStance');
            sys = setEdgeProperties(sys, 'Flight', 'RightStance', 'Guard', {left_impact});
            
        case 'standing'
            % Define domains
            standing = cassie.domain.double_support(robot, load_path);
            
            domains = standing;
            guards = [];
            sys = standing;     
             
        case 'one_step_double_support'
            % DoubleSupport -> LeftLiftSingleSupport -> RightStance -> LeftImpactDoubleSupportRelabel
            %      ^                                                                 |
            %      |_________________________________________________________________|
            
            % Define domains
            double_support = cassie.domain.double_support(robot, load_path, 'guard', 'left_lift');
            left_lift  = cassie.domain.lift(robot, load_path, 'leg', 'left', 'next_domain', 'single_support');
            right_stance = cassie.domain.single_support(robot, load_path, 'leg', 'right', 'guard', 'left_impact');
            left_impact  = cassie.domain.impact(robot, load_path, 'leg', 'left', 'next_domain', 'double_support', 'relabel', true);
 
            domains = [double_support, right_stance];
            guards = [left_lift, left_impact];
            
            % Define hybrid system             
            sys = HybridSystem('Cassie');
            sys = addVertex(sys, {'DoubleSupport', 'RightStance'}, 'Domain', {double_support, right_stance});            
            sys = addEdge(sys, 'DoubleSupport', 'RightStance');
            sys = setEdgeProperties(sys, 'DoubleSupport', 'RightStance', 'Guard', left_lift);
            sys = addEdge(sys, 'RightStance', 'DoubleSupport');
            sys = setEdgeProperties(sys, 'RightStance', 'DoubleSupport', 'Guard', left_impact);

                 
            
        case 'two_step_double_support'
            % DoubleSupport1 -> LeftLift -> RightStance -> LeftImpactDoubleSupport -> DoubleSupport2 -> RightLift -> LeftStance -> RightImpactDoubleSupport
            %      ^                                                                                                                          |
            %      |__________________________________________________________________________________________________________________________|
            
            % Define domains
            double_support_1 = cassie.domain.double_support(robot, load_path, 'guard', 'left_lift');
            left_lift  = cassie.domain.lift(robot, load_path, 'leg', 'left', 'next_domain', 'single_support');
            right_stance = cassie.domain.single_support(robot, load_path, 'leg', 'right', 'guard', 'left_impact');
            left_impact  = cassie.domain.impact(robot, load_path, 'leg', 'left', 'next_domain', 'double_support');
 
            double_support_2 = cassie.domain.double_support(robot, load_path, 'guard', 'right_lift');
            right_lift  = cassie.domain.lift(robot, load_path, 'leg', 'right', 'next_domain', 'single_support');
            left_stance = cassie.domain.single_support(robot, load_path, 'leg', 'left', 'guard', 'right_impact');
            right_impact  = cassie.domain.impact(robot, load_path, 'leg', 'right', 'next_domain', 'double_support');
 
         
            domains = [double_support_1, right_stance, double_support_2, left_stance];
            guards = [left_lift, left_impact, right_lift, right_impact];
            
            % Define hybrid system             
            sys = HybridSystem('Cassie');
            sys = addVertex(sys, {'DoubleSupport1', 'RightStance', 'DoubleSupport2', 'LeftStance'}, 'Domain', {double_support_1, right_stance, double_support_2, left_stance});            
            sys = addEdge(sys, 'DoubleSupport1', 'RightStance');
            sys = setEdgeProperties(sys, 'DoubleSupport1', 'RightStance', 'Guard', left_lift);
            sys = addEdge(sys, 'RightStance', 'DoubleSupport2');
            sys = setEdgeProperties(sys, 'RightStance', 'DoubleSupport2', 'Guard', left_impact);
            sys = addEdge(sys, 'DoubleSupport2', 'LeftStance');
            sys = setEdgeProperties(sys, 'DoubleSupport2', 'LeftStance', 'Guard', right_lift);
            sys = addEdge(sys, 'LeftStance', 'DoubleSupport1');
            sys = setEdgeProperties(sys, 'LeftStance', 'DoubleSupport1', 'Guard', right_impact);
                 
            
        otherwise
            error('Unknown behavior type')            
    end
    
end
