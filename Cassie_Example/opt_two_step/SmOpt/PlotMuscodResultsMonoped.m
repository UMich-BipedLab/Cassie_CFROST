% Plots the states and controls given by the files 'fileName'.plt and
% 'fileName'.mot.  The optional variable 'stateIndices' allows plotting
% only a subset of all states.  E.g., 
% PlotMuscodResults('Data/RUN_PH_PL_BASE',[8,12,16,20]) only plots the
% alpha and l velocities
function PlotMuscodResultsMonoped(fileName, varargin)  
    [t, y, u, yName, uName] = ReadPLTfile(fileName, 10, 1);
    [obj, h, nshoot, index, tN, yN, uN, p, yNameS, uNameS, pNameS] = ReadMOTfile(fileName, 10, 1);
    disp(['COT: ', num2str(obj)]);
    if (nargin > 1)
        stateIndices = varargin{1};
    else
        stateIndices = 1:1:length(yName);
    end
    % for limits:
    c_lim_l     = 0.07*p(8)^-0.37;
    P_max_l     = 24*p(8)^1.35;
    
    figure(1)
    clf
    hold on
    grid on
    box on
    plot(t,u)
    % Show limits on actuator torques:
    plot([t(1),t(end)],-[c_lim_l*P_max_l/p(6),c_lim_l*P_max_l/p(6)],'r:');
    plot([t(1),t(end)],+[c_lim_l*P_max_l/p(6),c_lim_l*P_max_l/p(6)],'r:');
    plot(tN,uN,'+')
    legend({uName{:},'F_{max}, l'});
    
    figure(2)
    clf
    hold on
    grid on
    box on
    plot(t,y(:,stateIndices))
    % Show limits on actuator velocities:
    plot([t(1),t(end)],-[(1-c_lim_l)*p(6),(1-c_lim_l)*p(6)],'r:');
    plot([t(1),t(end)],+[(1-c_lim_l)*p(6),(1-c_lim_l)*p(6)],'r:');
    plot(tN,yN(:,stateIndices),'+')
    legend({yName{stateIndices},'du_{max}, l'});
end