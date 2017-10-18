function [sys,domains,guards] = load_behavior(robot, load_path)
    % flat-footed wakling:
    % RightStance -> LeftImpact -> LeftStance -> RightImpact
    %      ^                                         |
    %      |_________________________________________|
    
    % Define domains
    right_stance = cassie.domain.right_stance(robot, load_path);
    left_stance  = cassie.domain.left_stance(robot, load_path);
    right_impact = cassie.domain.right_impact(right_stance, load_path);
    left_impact  = cassie.domain.left_impact(left_stance, load_path);
    
    domains = [right_stance, left_stance];
    guards = [right_impact, left_impact];
    
    % Define hybrid system
    sys = HybridSystem('Cassie');
    sys = addVertex(sys, {'RightStance','LeftStance'}, 'Domain', {right_stance, left_stance});
    srcs = {'RightStance','LeftStance'};
    tars = {'LeftStance','RightStance'};
    sys = addEdge(sys, srcs, tars);
    sys = setEdgeProperties(sys, srcs, tars, 'Guard', {left_impact, right_impact});
    
end
