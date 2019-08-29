%% Setup
cd('C:\Users\RoahmLab\Documents\GitHub\Cassie_CFROST\Cassie_Example\opt_two_step');

clear; clc; restoredefaultpath; matlabrc; if(exist('startup.m', 'file')); startup; end

% addpath('/home/roahmlab/Cassie_Zhenyu/jsonlab'); % Zhenyu add to json path

root = get_root_path();
addpath(fullfile(root, 'Cassie_Example'));
addpath(fullfile(root, 'submodules','Cassie_Model'));
addpath(fullfile(root, 'submodules','frost-dev'));
addpath(fullfile(root, 'submodules','C-Frost','Matlab'));
addpath(fullfile(root, 'Cassie_Example', 'cassie_dynamics_library', 'mex'));
frost_addpath;
if ~exist('gen/opt','dir')
    mkdir('gen','opt');
end
addpath('gen/opt');


addpath('C:\Users\RoahmLab\Documents\GitHub\Cassie_CFROST\Cassie_Example\opt_two_step\SmOpt'); 
addpath('C:\Users\RoahmLab\Documents\GitHub\Cassie_CFROST\Cassie_Example\opt_two_step\SmOpt\DAT'); 
load('CassieData3.mat');
clc

%%

Vx_range = linspace(   -1,    1, 11);
Vy_range = linspace(-0.30, 0.30, 11);
H_range  = linspace(-0.15, 0.15, 11);

% Vx_range = linspace(-0.00, 0.10, 5);
% Vy_range = linspace(-0.005, 0.005, 3); % increments of 0.005 will
% converge while 0.01 will not.
% H_range  = linspace(-0.00, 0.00, 1);


% Test 2: It seems that when the lateral velocity vy is added, the problem
% is over-constrained which makes it infeasible for the optimizer to solve.
% Vx_range = linspace(-0.00, 0.50, 25);
% Vy_range = linspace(-0.05, 0.05, 30);
% H_range  = linspace(-0.00, 0.00, 1);

% Test 3: When the lateral velocity is fixed and only vary vx and h, the
% current optimizer works fine.
% Vx_range = linspace(-0.00, 0.50, 25);
% Vy_range = linspace(-0.00, 0.00, 1);
% H_range  = linspace(-0.05, 0.05, 5);


FileName = 'GaitLibrary_v5';

Cassie_CreateParameterStudy(FileName, sol, [0, 0, 0], 'Vx', 1, Vx_range,...
                                                      'Vy', 2, Vy_range,...
                                                       'H', 3, H_range);

%% Process


% Cassie_ProcessParameterStudy(FileName, nlp, info, robot)
Cassie_ProcessParameterStudy_Parallel(FileName, nlp, info, robot)



%% PC Stride Time Study (Test 1) 
% Vx_range = linspace(   -0,    1, 21);
Vx_range = linspace(-0.00, 1.00, 21);
Vy_range = linspace(-0.00, 0.00,  1);
H_range  = linspace(-0.00, 0.00,  1);
St_range = linspace( 0.10, 0.50, 21);

FileName = 'GaitLibrary_PC_v4';

Cassie_CreateParameterStudy(FileName, sol, [0, 0, 0, 0.4], 'Vx', 1, Vx_range,...
                                                           'Vy', 2, Vy_range,...
                                                           'H',  3, H_range,...
                                                           'St', 4, St_range);
% Final solution is stored in 'GaitLibraryPC_v1'


%% PC Stride Time Study (Test 2) 
% Vx_range = linspace(   -0,    1, 21);
Vx_range = linspace(   -1,    2, 101);
Vy_range = linspace(-0.00, 0.00,  1);
H_range  = linspace(-0.00, 0.00,  1);
St_range = linspace( 0.10, 1.00, 101);

FileName = 'GaitLibrary_PC_v5';

Cassie_CreateParameterStudy(FileName, sol, [0, 0, 0, 0.4], 'Vx', 1, Vx_range,...
                                                           'Vy', 2, Vy_range,...
                                                           'H',  3, H_range,...
                                                           'St', 4, St_range);
% Final solution is stored in 'GaitLibraryPC_v1'                                                       

%%
Vx_range = linspace(   -1,    1, 21);
% Vy_range = linspace(-0.30, 0.30, 21);
% H_range  = linspace(-0.15, 0.15, 21);
St_range = linspace( 0.40, 0.40,  1);

FileName = 'GaitLibrary_BP3_21x21x21_v1';


Cassie_CreateParameterStudy(FileName, sol, [0, 0, 0, 0.4], 'Vx', 1, Vx_range,...
                                                           'Vy', 2, Vy_range,...
                                                           'H',  3, H_range,...
                                                           'St', 4, St_range);
%% Process Parallel Computing (8 cores)

FileName = 'GaitLibrary_BP3_21x21x21_v1';
Cassie_ProcessParameterStudy_Parallel(FileName, nlp, info, robot,sys)
%%
FileName = 'GaitLibrary_BP3_21x21x21_v1'; % unfinished
Cassie_ProcessParameterStudy(FileName, nlp, info, robot)
% Cassie_ProcessParameterStudy_Parallel(FileName, nlp, info, robot)

%%
sol = configurations{1,152}.finalDatStruct;
gait = two_step.utils.parse(nlp, sol);

%% Animate 
% set 'SkipExporting' option to false for the first time to allow
mkdir('gen','anim');
conGUI = cassie.load_animation(robot, gait, [], ...
    'SkipExporting', true, ... % set 'SkipExporting' option to false for the first time to allow the code to generate functions used for animation
    'ExportPath','gen/anim');   % the directory to export functions 

%% Analysize solutions
figure
hold on; box on; grid on

for i = 1:length(configurations)
    
    if ~isempty(configurations{1,i}.finalDatStruct) % a solution is found
       plot3(grids{1,1}(configurations{1,i}.indexVector(1)), ...
             grids{1,4}(configurations{1,i}.indexVector(4)), ...
             configurations{1,i}.costValue, 'r.')
    else
       plot3(grids{1,1}(configurations{1,i}.indexVector(1)), ...
             grids{1,4}(configurations{1,i}.indexVector(4)), ...
             configurations{1,i}.costValue, 'b.')
    end
    
end    

xlabel('xVel [m/s]');
ylabel('Stime [s]');
zlabel('cost value');
%%
PaConfig = cell(length(configurations),1);

for i = 1:length(configurations)
    
    
    if ~isempty(configurations{1,i}.finalDatStruct) % a solution is found
        PaConfig{i}.sF        = true;
        PaConfig{i}.sol       = configurations{1,i}.finalDatStruct;
        PaConfig{i}.gait      = two_step.utils.parse(nlp, sol);
        PaConfig{i}.time      = [PaConfig{i}.gait(1).tspan(1:end-1), PaConfig{i}.gait(3).tspan + PaConfig{i}.gait(1).tspan(end) ];
        PaConfig{i}.Traj_x    = [PaConfig{i}.gait(1).states.x(:,1:end-1), PaConfig{i}.gait(3).states.x];
        PaConfig{i}.Traj_dx   = [PaConfig{i}.gait(1).states.dx(:,1:end-1), PaConfig{i}.gait(3).states.dx];
        PaConfig{i}.Trajx_ddx = [PaConfig{i}.gait(1).states.ddx(:,1:end-1), PaConfig{i}.gait(3).states.ddx];
        PaConfig{i}.Cvalue    = configurations{1,i}.costValue;
        PaConfig{i}.Pvalue    = [grids{1,1}(configurations{1,i}.indexVector(1)), grids{1,4}(configurations{1,i}.indexVector(4))];
        PaConfig{i}.Ivalue    = configurations{1,i}.indexVector([1,4]);
    else
        PaConfig{i}.sF        = false;
        PaConfig{i}.sol       = [];
        PaConfig{i}.gait      = [];
        PaConfig{i}.time      = [];
        PaConfig{i}.Traj_x    = [];
        PaConfig{i}.Traj_dx   = [];
        PaConfig{i}.Traj_ddx  = [];
        PaConfig{i}.Cvalue    = [];
        PaConfig{i}.Pvalue    = [];
        PaConfig{i}.Ivalue    = [];
        
    end
    
    
end   
%%
figure
i = 10;
subplot(3,1,1);
plot(PaConfig{i}.time, PaConfig{i}.Traj_x(1:6,:))
xlim([0 PaConfig{i}.time(end)]);
xlabel('Time [s]');
ylabel('Torso');

subplot(3,1,2)
plot(PaConfig{i}.time, PaConfig{i}.Traj_x(7:7+6,:))
xlim([0 PaConfig{i}.time(end)]);
xlabel('Time [s]');
ylabel('Left Leg');

subplot(3,1,3)
plot(PaConfig{i}.time, PaConfig{i}.Traj_x(14:end,:))
xlim([0 PaConfig{i}.time(end)]);
xlabel('Time [s]');
ylabel('Right Leg');


%% Reorganize solutions

% PaConfig_Org = cell(21,21);
PaConfig_Org = cell(101,101);

for j = 1:101
    
    for k = 1:101
        
        
            % search for corresponding index
            IndNum = [];

            for i = 1:length(PaConfig)
                if PaConfig{i}.sF == false
                   continue;
                end   
                
                if all(PaConfig{i}.Ivalue == [j, k]) % a solution is found
                   IndNum = [IndNum, i];
                end
            end   

            if length(IndNum)>1 % if more than one solution exist at this index
                Cva = [];
                % find the one with smallest cost value
                for n = 1:length(PaConfig)
                    Cva = [Cva, PaConfig{i}.Cvalue];
                end    

                [~, Imin] = min(Cva);
                IndNum = IndNum(Imin);

            end

            if ~isempty(IndNum)
%                if PaConfig{i}.sF == true % a solution is found
                  PaConfig_Org(j,k) = PaConfig(IndNum);
%                else % s config created, but did not find a solution           
%                   PaConfig_Org(j,k) = {-1};
%                end    
            end

    end    

end



%%

save('GaitLibraryPC_v2.mat','PaConfig_Org','PaConfig','configurations','grids','indices');




%% Convert solutions for 3d problem
%% Analysize solutions
figure
hold on; box on; grid on

for i = 1:length(configurations)
    
    if ~isempty(configurations{1,i}.finalDatStruct) % a solution is found
       plot3(grids{1,1}(configurations{1,i}.indexVector(1)), ...
             grids{1,2}(configurations{1,i}.indexVector(2)), ...
             grids{1,3}(configurations{1,i}.indexVector(3)), 'r.')
    else
       plot3(grids{1,1}(configurations{1,i}.indexVector(1)), ...
             grids{1,2}(configurations{1,i}.indexVector(2)), ...
             grids{1,3}(configurations{1,i}.indexVector(3)), 'b.')
    end
    
end    

xlabel('xVel [m/s]');
ylabel('yVel [m/s]');
zlabel('Height [m]');
%%
PaConfig = cell(length(configurations),1);

for i = 1:length(configurations)
    
    
    if ~isempty(configurations{1,i}.finalDatStruct) % a solution is found
        PaConfig{i}.sF        = true;
        PaConfig{i}.sol       = configurations{1,i}.finalDatStruct;
        PaConfig{i}.gait      = two_step.utils.parse(nlp, PaConfig{i}.sol);
        PaConfig{i}.time      = [PaConfig{i}.gait(1).tspan(1:end-1), PaConfig{i}.gait(3).tspan];
        PaConfig{i}.Traj_x    = [PaConfig{i}.gait(1).states.x(:,1:end-1), PaConfig{i}.gait(3).states.x];
        PaConfig{i}.Traj_dx   = [PaConfig{i}.gait(1).states.dx(:,1:end-1), PaConfig{i}.gait(3).states.dx];
        PaConfig{i}.Trajx_ddx = [PaConfig{i}.gait(1).states.ddx(:,1:end-1), PaConfig{i}.gait(3).states.ddx];
        PaConfig{i}.Cvalue    = configurations{1,i}.costValue;
        PaConfig{i}.Pvalue    = [grids{1,1}(configurations{1,i}.indexVector(1)), grids{1,2}(configurations{1,i}.indexVector(2)), grids{1,3}(configurations{1,i}.indexVector(3))];
        PaConfig{i}.Ivalue    = configurations{1,i}.indexVector(1:3);
    else
        PaConfig{i}.sF        = false;
        PaConfig{i}.sol       = [];
        PaConfig{i}.gait      = [];
        PaConfig{i}.time      = [];
        PaConfig{i}.Traj_x    = [];
        PaConfig{i}.Traj_dx   = [];
        PaConfig{i}.Traj_ddx  = [];
        PaConfig{i}.Cvalue    = [];
        PaConfig{i}.Pvalue    = [];
        PaConfig{i}.Ivalue    = [];    
    end
    
    
end   
%%
figure
i = 10;
subplot(3,1,1);
plot(PaConfig{i}.time, PaConfig{i}.Traj_x(1:6,:))
xlim([0 PaConfig{i}.time(end)]);
xlabel('Time [s]');
ylabel('Torso');

subplot(3,1,2)
plot(PaConfig{i}.time, PaConfig{i}.Traj_x(7:7+6,:))
xlim([0 PaConfig{i}.time(end)]);
xlabel('Time [s]');
ylabel('Left Leg');

subplot(3,1,3)
plot(PaConfig{i}.time, PaConfig{i}.Traj_x(14:end,:))
xlim([0 PaConfig{i}.time(end)]);
xlabel('Time [s]');
ylabel('Right Leg');


%% Reorganize solutions

% PaConfig_Org = cell(21,21);
PaConfig_Org = cell(21,21,21);

for j = 1:21
    
    for k = 1:21
        
        for m = 1:21
            
            % search for corresponding index
            IndNum = [];

            for i = 1:length(PaConfig)
                if PaConfig{i}.sF == false
                   continue;
                end   
                
                if all(PaConfig{i}.Ivalue == [j, k, m]) % a solution is found
                   IndNum = [IndNum, i];
                end
            end   

            if length(IndNum)>1 % if more than one solution exist at this index
                Cva = [];
                % find the one with smallest cost value
                for n = 1:length(PaConfig)
                    Cva = [Cva, PaConfig{i}.Cvalue];
                end    

                [~, Imin] = min(Cva);
                IndNum = IndNum(Imin);

            end

            if ~isempty(IndNum)
%                if PaConfig{i}.sF == true % a solution is found
                  PaConfig_Org(j,k,m) = PaConfig(IndNum);
%                else % s config created, but did not find a solution           
%                   PaConfig_Org(j,k) = {-1};
%                end    
            end
            
            
        end
    end    

end



%%

save('GaitLibraryPC_v2.mat','PaConfig_Org','PaConfig','configurations','grids','indices');



%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% PC gait library vx, H, and St
Vx_range = linspace(-0.50, 0.50, 11); %1
Vy_range = linspace(-0.00, 0.00,  1); %2
H_range  = linspace(-0.15, 0.15, 11); %3
St_range = linspace( 0.40, 0.40,  1); %4
Gc_range = linspace( 0.15, 0.15,  1); %5 original solution has values between 0.15 m and 0.155 m

FileName = 'SmOpt\DAT\GaitLibrary_2D_Velocity_FootHeight_v1';


Cassie_CreateParameterStudy(FileName, sol, [0, 0, 0, 0.4, 0.15], 'Vx', 1, Vx_range,...
                                                                 'Vy', 2, Vy_range,...
                                                                 'H',  3, H_range,...
                                                                 'St', 4, St_range,...
                                                                 'Gc', 5, Gc_range);
%% Process Parallel Computing (4 cores)
clc
FileName = 'SmOpt\DAT\GaitLibrary_2D_Velocity_FootHeight_v1';
% Cassie_ProcessParameterStudy_Parallel(FileName, nlp, info, robot,sys) FileName, nlp, info, robot
Cassie_ProcessParameterStudy(FileName, nlp, info, robot)
%%
m =0;

for k = 1:length(configurations)
    
    if configurations{1,k}.processed == 1
        
       m = m +1;
    end
end    

disp(m/length(configurations))
%%
%% Convert solutions for 3d problem
%% Analysize solutions

figure
hold on; box on; grid on

for i = 1:length(configurations)
    
    if ~isempty(configurations{1,i}.finalDatStruct) % a solution is found
       plot3(grids{1,1}(configurations{1,i}.indexVector(1)), ...
             grids{1,3}(configurations{1,i}.indexVector(4)), ...
             grids{1,5}(configurations{1,i}.indexVector(5)), 'r.')
    else
       plot3(grids{1,1}(configurations{1,i}.indexVector(1)), ...
             grids{1,4}(configurations{1,i}.indexVector(4)), ...
             grids{1,5}(configurations{1,i}.indexVector(5)), 'b.')
    end
    
end    

xlabel('xVel [m/s]');
ylabel('Stride time [s]');
zlabel('Ground clearance [m]');
%%
%% Analysize solutions

figure
hold on; box on; grid on

for i = 1:length(configurations)
    
    if ~isempty(configurations{1,i}.finalDatStruct) % a solution is found
       plot(grids{1,1}(configurations{1,i}.indexVector(1)), ...
             grids{1,3}(configurations{1,i}.indexVector(3)), 'r.')
    else
       plot(grids{1,1}(configurations{1,i}.indexVector(1)), ...
             grids{1,3}(configurations{1,i}.indexVector(3)), 'b.')
    end
    
end    

xlabel('xVel [m/s]');
ylabel('FootHeight [m]');
zlabel('ST [s]');
%%

PaConfig = cell(length(configurations),1);
NConfig  = length(configurations);

for i = 1:length(configurations)
    
    if ~isempty(configurations{1,i}.finalDatStruct) % a solution is found
        
        PaConfig{i}.sF        = true;
        PaConfig{i}.sol       = configurations{1,i}.finalDatStruct;
        PaConfig{i}.gait      = two_step.utils.parse(nlp, PaConfig{i}.sol);
%         PaConfig{i}.time      = [PaConfig{i}.gait(1).tspan(1:end-1),        PaConfig{i}.gait(3).tspan];
%         PaConfig{i}.Traj_x    = [PaConfig{i}.gait(1).states.x(:,1:end-1),   PaConfig{i}.gait(3).states.x];
%         PaConfig{i}.Traj_dx   = [PaConfig{i}.gait(1).states.dx(:,1:end-1),  PaConfig{i}.gait(3).states.dx];
%         PaConfig{i}.Trajx_ddx = [PaConfig{i}.gait(1).states.ddx(:,1:end-1), PaConfig{i}.gait(3).states.ddx];
        PaConfig{i}.Cvalue    = configurations{1,i}.costValue;
        PaConfig{i}.Pvalue    = [grids{1,1}(configurations{1,i}.indexVector(1)), grids{1,2}(configurations{1,i}.indexVector(2)), grids{1,3}(configurations{1,i}.indexVector(3))];
        PaConfig{i}.Ivalue    = configurations{1,i}.indexVector([1,2,3]);
    
    else
        
        PaConfig{i}.sF        = false;
        PaConfig{i}.sol       = [];
        PaConfig{i}.gait      = [];
%         PaConfig{i}.time      = [];
%         PaConfig{i}.Traj_x    = [];
%         PaConfig{i}.Traj_dx   = [];
%         PaConfig{i}.Traj_ddx  = [];
        PaConfig{i}.Cvalue    = [];
        PaConfig{i}.Pvalue    = [];
        PaConfig{i}.Ivalue    = [];
        
    end
    
    disp(i/NConfig);
    
end

%%

figure
i = 10;
subplot(3,1,1);
plot(PaConfig{i}.time, PaConfig{i}.Traj_x(1:6,:))
xlim([0 PaConfig{i}.time(end)]);
xlabel('Time [s]');
ylabel('Torso');

subplot(3,1,2)
plot(PaConfig{i}.time, PaConfig{i}.Traj_x(7:7+6,:))
xlim([0 PaConfig{i}.time(end)]);
xlabel('Time [s]');
ylabel('Left Leg');

subplot(3,1,3)
plot(PaConfig{i}.time, PaConfig{i}.Traj_x(14:end,:))
xlim([0 PaConfig{i}.time(end)]);
xlabel('Time [s]');
ylabel('Right Leg');


%% Reorganize solutions

% PaConfig_Org = cell(21,21);
PaConfig_Org = cell(21,21,21);

for j = 1:21
    
    for k = 1:21
        
        for m = 1:21
            
            % search for corresponding index
            IndNum = [];

            for i = 1:length(PaConfig)
                if PaConfig{i}.sF == false
                   continue;
                end   
                
                if all(PaConfig{i}.Ivalue == [j, k, m]) % a solution is found
                   IndNum = [IndNum, i];
                end
            end   

            if length(IndNum)>1 % if more than one solution exist at this index
                Cva = [];
                % find the one with smallest cost value
                for n = 1:length(PaConfig)
                    Cva = [Cva, PaConfig{i}.Cvalue];
                end    

                [~, Imin] = min(Cva);
                IndNum = IndNum(Imin);

            end

            if ~isempty(IndNum)
%                if PaConfig{i}.sF == true % a solution is found
                  PaConfig_Org(j,k,m) = PaConfig(IndNum);
%                else % s config created, but did not find a solution           
%                   PaConfig_Org(j,k) = {-1};
%                end    
            end
            
            
        end
    end    

end

%% Reorganize solutions 11x11

% PaConfig_Org = cell(21,21);
PaConfig_Org = cell(11,11);

for j = 1:11
    
        
        for m = 1:11
            
            % search for corresponding index
            IndNum = [];

            for i = 1:length(PaConfig)
                if PaConfig{i}.sF == false
                   continue;
                end   
                
                if all(PaConfig{i}.Ivalue == [j, 1, m]) % a solution is found
                   IndNum = [IndNum, i];
                end
            end   

            if length(IndNum)>1 % if more than one solution exist at this index
                Cva = [];
                % find the one with smallest cost value
                for n = 1:length(PaConfig)
                    Cva = [Cva, PaConfig{i}.Cvalue];
                end    

                [~, Imin] = min(Cva);
                IndNum = IndNum(Imin);

            end

            if ~isempty(IndNum)
%                if PaConfig{i}.sF == true % a solution is found
                  PaConfig_Org(j,m) = PaConfig(IndNum);
%                else % s config created, but did not find a solution           
%                   PaConfig_Org(j,k) = {-1};
%                end    
            end
            
            
       end    

end


%%

save('GaitLibrary_2D_Velocity_FootHeight_Organized_v1.mat','PaConfigGait','PaConfigList','configurations','grids','indices');


%%
PaConfigList = reshape(PaConfig_Org,21*21*21,1);
PaConfigGait = cell(21^3,1);

for k = 1:1:length(PaConfigList)
    if ~isempty(PaConfigList{k})
        
       StrA = [];
       StrA.solution    = PaConfigList{k}.gait;
       StrA.velocity    = PaConfigList{k}.Pvalue(1);
       StrA.step_length = PaConfigList{k}.Pvalue(1)*PaConfigList{k}.Pvalue(2);
       
       StrA.Pvalue      = PaConfigList{k}.Pvalue;
       StrA.Ivalue      = PaConfigList{k}.Ivalue;
       

       PaConfigGait{k}     = StrA;
    end    
end    



%%
PaConfigList = reshape(PaConfig_Org,11*11,1);
PaConfigGait = cell(11^2,1);

for k = 1:1:length(PaConfigList)
    if ~isempty(PaConfigList{k})
        
       StrA = [];
       StrA.solution    = PaConfigList{k}.gait;
       StrA.velocity    = PaConfigList{k}.Pvalue(1);
       StrA.step_length = PaConfigList{k}.Pvalue(1)*PaConfigList{k}.Pvalue(2);
       
       StrA.Pvalue      = PaConfigList{k}.Pvalue;
       StrA.Ivalue      = PaConfigList{k}.Ivalue;
       

       PaConfigGait{k}     = StrA;
    end    
end    


%%

save('GaitLibrary_PCgc_v1.mat','PaConfigGait');


%% Animate
close all
i = 20;
gait = two_step.utils.parse(nlp, PaConfigList{i}.sol);
% set 'SkipExporting' option to false for the first time to allow
mkdir('gen','anim');
conGUI = cassie.load_animation(robot, gait, [], ...
    'SkipExporting', true, ... % set 'SkipExporting' option to false for the first time to allow the code to generate functions used for animation
    'ExportPath','gen/anim');   % the directory to export functions 

%%
%% PC gait library vx, H, and St
Vx_range = linspace(-0.50, 1.00, 21); %1
Vy_range = linspace(-0.00, 0.00,  1); %2
H_range  = linspace(-0.00, 0.00,  1); %3
% St_range = linspace( 0.10, 0.70, 21); %4
St_range = linspace( 0.20, 0.50, 21); %4
Gc_range = linspace( 0.15, 0.15,  1); %5 original solution has values between 0.15 m and 0.155 m

FileName = 'GaitLibrary_2D_NGC_v2';

Cassie_CreateParameterStudy(FileName, sol, [0, 0, 0, 0.4, 0.15], 'Vx', 1, Vx_range,...
                                                                 'Vy', 2, Vy_range,...
                                                                 'H',  3, H_range,...
                                                                 'St', 4, St_range,...
                                                                 'Gc', 5, Gc_range);
%% Process Parallel Computing (7 cores)
% 3:47 PM Jan 24
FileName = 'GaitLibrary_2D_NGC_v2';
Cassie_ProcessParameterStudy_Parallel(FileName, nlp, info, robot,sys)
%%
%% Analysize solutions

figure
hold on; box on; grid on

for i = 1:length(configurations)
    
    if ~isempty(configurations{1,i}.finalDatStruct) % a solution is found
       plot(grids{1,1}(configurations{1,i}.indexVector(1)), ...
            grids{1,4}(configurations{1,i}.indexVector(4)), 'r.')
    else
       plot(grids{1,1}(configurations{1,i}.indexVector(1)), ...
            grids{1,4}(configurations{1,i}.indexVector(4)), 'b.')
    end
    
end    

xlabel('xVel [m/s]');
ylabel('Stride time [s]');
zlabel('Ground clearance [m]');
%%

PaConfig = cell(length(configurations),1);
NConfig  = length(configurations);

for i = 1:length(configurations)
    
    if ~isempty(configurations{1,i}.finalDatStruct) % a solution is found
        
        PaConfig{i}.sF        = true;
        PaConfig{i}.sol       = configurations{1,i}.finalDatStruct;
        PaConfig{i}.gait      = two_step.utils.parse(nlp, PaConfig{i}.sol);
        PaConfig{i}.Cvalue    = configurations{1,i}.costValue;
        PaConfig{i}.Pvalue    = [grids{1,1}(configurations{1,i}.indexVector(1)), grids{1,4}(configurations{1,i}.indexVector(4))];
        PaConfig{i}.Ivalue    = configurations{1,i}.indexVector([1, 4]);
    
    else
        
        PaConfig{i}.sF        = false;
        PaConfig{i}.sol       = [];
        PaConfig{i}.gait      = [];
        PaConfig{i}.Cvalue    = [];
        PaConfig{i}.Pvalue    = [];
        PaConfig{i}.Ivalue    = [];
        
    end
    
    disp(i/NConfig);
    
end

%% Reorganize solutions
PaConfig_Org = cell(21,21);

for j = 1:21
    
    for k = 1:21
            IndNum = [];

            for i = 1:length(PaConfig)
                if PaConfig{i}.sF == false
                   continue;
                end   
                
                if all(PaConfig{i}.Ivalue == [j, k]) % a solution is found
                   IndNum = [IndNum, i];
                end
            end   

            if length(IndNum)>1 % if more than one solution exist at this index
                Cva = [];
                for n = 1:length(PaConfig)
                    Cva = [Cva, PaConfig{i}.Cvalue];
                end    

                [~, Imin] = min(Cva);
                IndNum = IndNum(Imin);

            end

            if ~isempty(IndNum)
                  PaConfig_Org(j,k) = PaConfig(IndNum);
            end
    end    
end

%%
PaConfigList = reshape(PaConfig_Org,21^2,1);
PaConfigGait = cell(21^2,1);

for k = 1:1:length(PaConfigList)
    if ~isempty(PaConfigList{k})
        
       StrA = [];
       StrA.solution    = PaConfigList{k}.gait;
       StrA.velocity    = PaConfigList{k}.Pvalue(1);
       StrA.step_length = PaConfigList{k}.Pvalue(1)*PaConfigList{k}.Pvalue(2);
       
       StrA.Pvalue      = PaConfigList{k}.Pvalue;
       StrA.Ivalue      = PaConfigList{k}.Ivalue;
       

       PaConfigGait{k}     = StrA;
    end    
end    

%%

save('GaitLibrary_2D_Organizedv2.mat','PaConfigGait','PaConfigList','configurations','grids','indices');

%% Animate
close all
i = 74;
gait = two_step.utils.parse(nlp, PaConfigList{i}.sol);
% set 'SkipExporting' option to false for the first time to allow
mkdir('gen','anim');
conGUI = cassie.load_animation(robot, gait, [], ...
    'SkipExporting', true, ... % set 'SkipExporting' option to false for the first time to allow the code to generate functions used for animation
    'ExportPath','gen/anim');   % the directory to export functions 
%%


















%% Computer dependent settings:
% Possibility one: Lab Computer
PathToMuscod  = '/home/cremy/MUSCOD-II/MC2/Release/bin/muscod';
PathTo2DBiped   = '/home/weitaoxi/muscodgaitcreat/2013_04_13_SeriesParallel2DBiped/';
PathTo1DMonoped = '/home/weitaoxi/muscodgaitcreat/2013_04_30_SeriesParallel1DMonoped/';


%% STEP_01
% 1D hopping
% This first set of datStructs and .dat files are the initial problem
% files. The initial parameters have been selected as simple as possible.
% Yet they will converge to solutions when used in muscod.
%  - No constraints are imposed at this stage.
%  - Transmission values are fixed.
datStruct = CreateDatStructMonoped1D('SEA',0); % posMeWork
save('BaseData/HOPPING_1D_SL_posMeWork_BASE_00.mat', 'datStruct');
CreateDatFile('BaseData/HOPPING_1D_SL_posMeWork_BASE_00',datStruct)
%
datStruct = CreateDatStructMonoped1D('SEA',1); % posActWork
save('BaseData/HOPPING_1D_SL_posActWork_BASE_00.mat', 'datStruct');
CreateDatFile('BaseData/HOPPING_1D_SL_posActWork_BASE_00',datStruct)
%
datStruct = CreateDatStructMonoped1D('SEA',2); % posElWork
save('BaseData/HOPPING_1D_SL_posElWork_BASE_00.mat', 'datStruct');
CreateDatFile('BaseData/HOPPING_1D_SL_posElWork_BASE_00',datStruct)
%
datStruct = CreateDatStructMonoped1D('SEA',3);% totElLoss
save('BaseData/HOPPING_1D_SL_totElLoss_BASE_00.mat', 'datStruct');
CreateDatFile('BaseData/HOPPING_1D_SL_totElLoss_BASE_00',datStruct)
%
datStruct = CreateDatStructMonoped1D('PEA',1); % posActWork
save('BaseData/HOPPING_1D_PL_posActWork_BASE_00.mat', 'datStruct');
CreateDatFile('BaseData/HOPPING_1D_PL_posActWork_BASE_00',datStruct)
%
datStruct = CreateDatStructMonoped1D('PEA',2); % posElWork
save('BaseData/HOPPING_1D_PL_posElWork_BASE_00.mat', 'datStruct');
CreateDatFile('BaseData/HOPPING_1D_PL_posElWork_BASE_00',datStruct)
%
datStruct = CreateDatStructMonoped1D('PEA',3);% totElLoss
save('BaseData/HOPPING_1D_PL_totElLoss_BASE_00.mat', 'datStruct');
CreateDatFile('BaseData/HOPPING_1D_PL_totElLoss_BASE_00',datStruct)

% Copy to project director to process in Muscod
currentPath = pwd;
system(['cp ',pwd,'/BaseData/HOPPING_1D_*_BASE_00.dat ', PathTo1DMonoped,'DAT/']);
% SWITCH TO PROJECT DIRECTORY AND RUN MUSCOD THERE
cd(PathTo1DMonoped);
[MuscodResults_01(1), cmdout] = system([PathToMuscod,' HOPPING_1D_SL_posMeWork_BASE_00']);
[MuscodResults_01(2), cmdout] = system([PathToMuscod,' HOPPING_1D_SL_posActWork_BASE_00']);
[MuscodResults_01(3), cmdout] = system([PathToMuscod,' HOPPING_1D_SL_posElWork_BASE_00']);
[MuscodResults_01(4), cmdout] = system([PathToMuscod,' HOPPING_1D_SL_totElLoss_BASE_00']);
[MuscodResults_01(5), cmdout] = system([PathToMuscod,' HOPPING_1D_PL_posActWork_BASE_00']);
[MuscodResults_01(6), cmdout] = system([PathToMuscod,' HOPPING_1D_PL_posElWork_BASE_00']);
[MuscodResults_01(7), cmdout] = system([PathToMuscod,' HOPPING_1D_PL_totElLoss_BASE_00']);
cd(currentPath);
% Copy back to BaseData/
system(['cp ',PathTo1DMonoped,'RES/HOPPING_1D_*_BASE_00.* ',pwd,'/BaseData/']);
% Clean up DAT and RES folders
system(['rm ',PathTo1DMonoped,'DAT/*.* ']);
system(['rm ',PathTo1DMonoped,'RES/*.* ']);

PlotMuscodResultsMonoped('BaseData/HOPPING_1D_SL_posMeWork_BASE_00',[1 2 3 4 5 6]);
PlotMuscodResultsMonoped('BaseData/HOPPING_1D_SL_posActWork_BASE_00',[1 2 3 4 5 6]);
PlotMuscodResultsMonoped('BaseData/HOPPING_1D_SL_posElWork_BASE_00',[1 2 3 4 5 6]);
PlotMuscodResultsMonoped('BaseData/HOPPING_1D_SL_totElLoss_BASE_00',[1 2 3 4 5 6]);
PlotMuscodResultsMonoped('BaseData/HOPPING_1D_PL_posActWork_BASE_00',[1 2 3 4 5 6]);
PlotMuscodResultsMonoped('BaseData/HOPPING_1D_PL_posElWork_BASE_00',[1 2 3 4 5 6]);
PlotMuscodResultsMonoped('BaseData/HOPPING_1D_PL_totElLoss_BASE_00',[1 2 3 4 5 6]);
disp(MuscodResult_01); % All converged on 7/15/2013

%% STEP_02:
% In a second step, the results obtained in STEP_01 are resampled, and used
% as intial guesses for a series, in which the constraints are enforced,
% and transmission values can be changed.
load('BaseData/HOPPING_1D_SL_posMeWork_BASE_00.mat','datStruct');
datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_SL_posMeWork_BASE_00', 30,10,1);
datStruct.header = {'// Updated from HOPPING_1D_SL_posMeWork_BASE_00'};
datStruct.p(4) = 6;  % enforce constraints on actuation
datStruct.p_fix(6) = 0; % optimize transmission values
save('BaseData/HOPPING_1D_SL_posMeWork_BASE_01.mat', 'datStruct');
CreateDatFile('BaseData/HOPPING_1D_SL_posMeWork_BASE_01',datStruct);

load('BaseData/HOPPING_1D_SL_posActWork_BASE_00.mat','datStruct');
datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_SL_posActWork_BASE_00', 30,10,1);
datStruct.header = {'// Updated from HOPPING_1D_SL_posActWork_BASE_00'};
datStruct.p(4) = 6;  % enforce constraints on actuation
datStruct.p_fix(6) = 0; % optimize transmission values
datStruct.h(1) = 0.5115;
save('BaseData/HOPPING_1D_SL_posActWork_BASE_01.mat', 'datStruct');
CreateDatFile('BaseData/HOPPING_1D_SL_posActWork_BASE_01',datStruct);

load('BaseData/HOPPING_1D_SL_posElWork_BASE_00.mat','datStruct');
datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_SL_posElWork_BASE_00', 30,10,1);
datStruct.header = {'// Updated from HOPPING_1D_SL_posElWork_BASE_00'};
datStruct.p(4) = 6;  % enforce constraints on actuation
datStruct.p_fix(6) = 0; % optimize transmission values
datStruct.h(1) = 0.5097;
save('BaseData/HOPPING_1D_SL_posElWork_BASE_01.mat', 'datStruct');
CreateDatFile('BaseData/HOPPING_1D_SL_posElWork_BASE_01',datStruct);

load('BaseData/HOPPING_1D_SL_totElLoss_BASE_00.mat','datStruct');
datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_SL_totElLoss_BASE_00', 30,10,1);
datStruct.header = {'// Updated from HOPPING_1D_SL_totElLoss_BASE_00'};
datStruct.p(4) = 6;  % enforce constraints on actuation
datStruct.p_fix(6) = 0; % optimize transmission values
save('BaseData/HOPPING_1D_SL_totElLoss_BASE_01.mat', 'datStruct');
CreateDatFile('BaseData/HOPPING_1D_SL_totElLoss_BASE_01',datStruct);

load('BaseData/HOPPING_1D_PL_posActWork_BASE_00.mat','datStruct');
datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_PL_posActWork_BASE_00', 30,10,1);
datStruct.header = {'// Updated from HOPPING_1D_PL_posActWork_BASE_00'};
datStruct.p(4) = 6;  % enforce constraints on actuation
datStruct.p_fix(6) = 0; % optimize transmission values
save('BaseData/HOPPING_1D_PL_posActWork_BASE_01.mat', 'datStruct');
CreateDatFile('BaseData/HOPPING_1D_PL_posActWork_BASE_01',datStruct);

load('BaseData/HOPPING_1D_PL_posElWork_BASE_00.mat','datStruct');
datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_PL_posElWork_BASE_00', 30,10,1);
datStruct.header = {'// Updated from HOPPING_1D_PL_posElWork_BASE_00'};
datStruct.p(4) = 6;  % enforce constraints on actuation
datStruct.p_fix(6) = 0; % optimize transmission values
save('BaseData/HOPPING_1D_PL_posElWork_BASE_01.mat', 'datStruct');
CreateDatFile('BaseData/HOPPING_1D_PL_posElWork_BASE_01',datStruct);

load('BaseData/HOPPING_1D_PL_totElLoss_BASE_00.mat','datStruct');
datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_PL_totElLoss_BASE_00', 30,10,1);
datStruct.header = {'// Updated from HOPPING_1D_PL_totElLoss_BASE_00'};
datStruct.p(4) = 6;  % enforce constraints on actuation
datStruct.p_fix(6) = 0; % optimize transmission values
save('BaseData/HOPPING_1D_PL_totElLoss_BASE_01.mat', 'datStruct');
CreateDatFile('BaseData/HOPPING_1D_PL_totElLoss_BASE_01',datStruct);


% Copy to project director to process in Muscod
currentPath = pwd;
system(['cp ',pwd,'/BaseData/HOPPING_1D_*_BASE_01.dat ', PathTo1DMonoped,'DAT/']);
% SWITCH TO PROJECT DIRECTORY AND RUN MUSCOD THERE
cd(PathTo1DMonoped);
[MuscodResults_02(1), cmdout] = system([PathToMuscod,' HOPPING_1D_SL_posMeWork_BASE_01']);
[MuscodResults_02(2), cmdout] = system([PathToMuscod,' HOPPING_1D_SL_posActWork_BASE_01']);
[MuscodResults_02(3), cmdout] = system([PathToMuscod,' HOPPING_1D_SL_posElWork_BASE_01']);
[MuscodResults_02(4), cmdout] = system([PathToMuscod,' HOPPING_1D_SL_totElLoss_BASE_01']);
[MuscodResults_02(5), cmdout] = system([PathToMuscod,' HOPPING_1D_PL_posActWork_BASE_01']);
[MuscodResults_02(6), cmdout] = system([PathToMuscod,' HOPPING_1D_PL_posElWork_BASE_01']);
[MuscodResults_02(7), cmdout] = system([PathToMuscod,' HOPPING_1D_PL_totElLoss_BASE_01']);
cd(currentPath);
% Copy back to BaseData/
system(['cp ',PathTo1DMonoped,'RES/HOPPING_1D_*_BASE_01.* ',pwd,'/BaseData/']);
% Clean up DAT and RES folders
system(['rm ',PathTo1DMonoped,'DAT/*.* ']);
system(['rm ',PathTo1DMonoped,'RES/*.* ']);

PlotMuscodResultsMonoped('BaseData/HOPPING_1D_SL_posMeWork_BASE_01',[1 2 3 4 5 6]);
PlotMuscodResultsMonoped('BaseData/HOPPING_1D_SL_posActWork_BASE_01',[1 2 3 4 5 6]);
PlotMuscodResultsMonoped('BaseData/HOPPING_1D_SL_posElWork_BASE_01',[1 2 3 4 5 6]);
PlotMuscodResultsMonoped('BaseData/HOPPING_1D_SL_totElLoss_BASE_01',[1 2 3 4 5 6]);
PlotMuscodResultsMonoped('BaseData/HOPPING_1D_PL_posActWork_BASE_01',[1 2 3 4 5 6]);
PlotMuscodResultsMonoped('BaseData/HOPPING_1D_PL_posElWork_BASE_01',[1 2 3 4 5 6]);
PlotMuscodResultsMonoped('BaseData/HOPPING_1D_PL_totElLoss_BASE_01',[1 2 3 4 5 6]);
disp(MuscodResult_02); % All converged on 7/15/2013

%% STEP_03: 
StiffnessValues = [linspace(1,9.75,36),logspace(1,log10(200),120),linspace(205,500,60)];
% Process a parameter study that varies the leg stiffness value:
%load('BaseData/HOPPING_1D_SL_posMeWork_BASE_01.mat','datStruct');
%datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_SL_posMeWork_BASE_01', 30,10,1);
%CreateParameterStudy('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_posMeWork', datStruct, 'p',5,StiffnessValues) 
ProcessParameterStudy('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_posMeWork', PathTo1DMonoped, PathToMuscod);
%
%load('BaseData/HOPPING_1D_SL_posActWork_BASE_01.mat','datStruct');
%datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_SL_posActWork_BASE_01', 30,10,1);
%CreateParameterStudy('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_posActWork', datStruct, 'p',5,StiffnessValues) 
ProcessParameterStudy('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_posActWork', PathTo1DMonoped, PathToMuscod);
%
%load('BaseData/HOPPING_1D_SL_posElWork_BASE_01.mat','datStruct');
%datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_SL_posElWork_BASE_01', 30,10,1);
%CreateParameterStudy('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_posElWork', datStruct, 'p',5,StiffnessValues) 
ProcessParameterStudy('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_posElWork', PathTo1DMonoped, PathToMuscod);
%
%load('BaseData/HOPPING_1D_SL_posMeWork_BASE_01.mat','datStruct');
%datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_SL_totElLoss_BASE_01', 30,10,1);
%CreateParameterStudy('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_totElLoss', datStruct, 'p',5,StiffnessValues) 
ProcessParameterStudy('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_totElLoss', PathTo1DMonoped, PathToMuscod);
%
%load('BaseData/HOPPING_1D_PL_posActWork_BASE_01.mat','datStruct');
%datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_PL_posActWork_BASE_01', 30,10,1);
%CreateParameterStudy('ParameterStudies/StiffnessStudy_HOPPING_1D_PL_posActWork', datStruct, 'p',5,StiffnessValues) 
ProcessParameterStudy('ParameterStudies/StiffnessStudy_HOPPING_1D_PL_posActWork', PathTo1DMonoped, PathToMuscod);
%
%load('BaseData/HOPPING_1D_PL_posElWork_BASE_01.mat','datStruct');
%datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_PL_posElWork_BASE_01', 30,10,1);
%CreateParameterStudy('ParameterStudies/StiffnessStudy_HOPPING_1D_PL_posElWork', datStruct, 'p',5,StiffnessValues) 
ProcessParameterStudy('ParameterStudies/StiffnessStudy_HOPPING_1D_PL_posElWork', PathTo1DMonoped, PathToMuscod);
%
%load('BaseData/HOPPING_1D_PL_totElLoss_BASE_01.mat','datStruct');
%datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_PL_totElLoss_BASE_01', 30,10,1);
%CreateParameterStudy('ParameterStudies/StiffnessStudy_HOPPING_1D_PL_totElLoss', datStruct, 'p',5,StiffnessValues) 
ProcessParameterStudy('ParameterStudies/StiffnessStudy_HOPPING_1D_PL_totElLoss', PathTo1DMonoped, PathToMuscod);


%% Show Results:
figure(1)
clf
hold on
box on
grid on
StiffnessValues = [linspace(1,9.75,36),logspace(1,log10(200),120),linspace(205,500,60)];
count = zeros(length(StiffnessValues),7);
load('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_posMeWork','configurations','types','indices','grids');
for i = 1:length(configurations)
    count(configurations{i}.indexVector(1),1)=count(configurations{i}.indexVector(1),1)+1;
    if configurations{i}.nFailed < 5
        plot(grids{1}(configurations{i}.indexVector(1)), configurations{i}.costValue,'b*');
    else
        plot(grids{1}(configurations{i}.indexVector(1)), 0,'r*');
    end
end
load('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_posActWork','configurations','types','indices','grids');
for i = 1:length(configurations)
    count(configurations{i}.indexVector(1),2)=count(configurations{i}.indexVector(1),2)+1;
    if configurations{i}.nFailed < 5
        plot(grids{1}(configurations{i}.indexVector(1)), configurations{i}.costValue,'bo');
    else
        plot(grids{1}(configurations{i}.indexVector(1)), 0,'ro');
    end
end
load('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_posElWork','configurations','types','indices','grids');
for i = 1:length(configurations)
    count(configurations{i}.indexVector(1),3)=count(configurations{i}.indexVector(1),3)+1;
    if configurations{i}.nFailed < 5
        plot(grids{1}(configurations{i}.indexVector(1)), configurations{i}.costValue,'b+');
    else
        plot(grids{1}(configurations{i}.indexVector(1)), 0,'r+');
    end
end
load('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_totElLoss','configurations','types','indices','grids');
for i = 1:length(configurations)
    count(configurations{i}.indexVector(1),4)=count(configurations{i}.indexVector(1),4)+1;
    if configurations{i}.nFailed < 5
        plot(grids{1}(configurations{i}.indexVector(1)), configurations{i}.costValue,'b.');
    else
        plot(grids{1}(configurations{i}.indexVector(1)), 0,'r.');
    end
end
load('ParameterStudies/StiffnessStudy_HOPPING_1D_PL_posActWork','configurations','types','indices','grids');
for i = 1:length(configurations)
    count(configurations{i}.indexVector(1),5)=count(configurations{i}.indexVector(1),5)+1;
    if configurations{i}.nFailed < 5
        plot(grids{1}(configurations{i}.indexVector(1)), configurations{i}.costValue,'go');
    else
        plot(grids{1}(configurations{i}.indexVector(1)), 0,'ro');
    end
end
load('ParameterStudies/StiffnessStudy_HOPPING_1D_PL_posElWork','configurations','types','indices','grids');
for i = 1:length(configurations)
    count(configurations{i}.indexVector(1),6)=count(configurations{i}.indexVector(1),6)+1;
    if configurations{i}.nFailed < 5
        plot(grids{1}(configurations{i}.indexVector(1)), configurations{i}.costValue,'g+');
    else
        plot(grids{1}(configurations{i}.indexVector(1)), 0,'r+');
    end
end
load('ParameterStudies/StiffnessStudy_HOPPING_1D_PL_totElLoss','configurations','types','indices','grids');
for i = 1:length(configurations)
    count(configurations{i}.indexVector(1),7)=count(configurations{i}.indexVector(1),7)+1;
    if configurations{i}.nFailed < 5
        plot(grids{1}(configurations{i}.indexVector(1)), configurations{i}.costValue,'g.');
    else
        plot(grids{1}(configurations{i}.indexVector(1)), 0,'r.');
    end
end
disp(count);
drawnow();


%% STEP_04: 
% A more condensed vector of stiffness values:
StiffnessValues = [linspace(1,9.8,45),logspace(1,log10(100),115),linspace(102,200,50)];
%load('BaseData/HOPPING_1D_SL_posMeWork_BASE_01.mat','datStruct');
%datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_SL_posMeWork_BASE_01', 30,10,1);
%CreateParameterStudy_Randomized('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_posMeWork_02', datStruct, 'p',5,StiffnessValues) 
ProcessParameterStudy_Randomized('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_posMeWork_02', PathTo1DMonoped, PathToMuscod);
%load('BaseData/HOPPING_1D_SL_posActWork_BASE_01.mat','datStruct');
%datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_SL_posActWork_BASE_01', 30,10,1);
%CreateParameterStudy_Randomized('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_posActWork_02', datStruct, 'p',5,StiffnessValues) 
ProcessParameterStudy_Randomized('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_posActWork_02', PathTo1DMonoped, PathToMuscod);
%load('BaseData/HOPPING_1D_SL_posElWork_BASE_01.mat','datStruct');
%datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_SL_posElWork_BASE_01', 30,10,1);
%CreateParameterStudy_Randomized('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_posElWork_02', datStruct, 'p',5,StiffnessValues) 
ProcessParameterStudy_Randomized('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_posElWork_02', PathTo1DMonoped, PathToMuscod);
%load('BaseData/HOPPING_1D_SL_posMeWork_BASE_01.mat','datStruct');
%datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_SL_totElLoss_BASE_01', 30,10,1);
%CreateParameterStudy_Randomized('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_totElLoss_02', datStruct, 'p',5,StiffnessValues) 
ProcessParameterStudy_Randomized('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_totElLoss_02', PathTo1DMonoped, PathToMuscod);
%load('BaseData/HOPPING_1D_PL_posActWork_BASE_01.mat','datStruct');
%datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_PL_posActWork_BASE_01', 30,10,1);
%CreateParameterStudy_Randomized('ParameterStudies/StiffnessStudy_HOPPING_1D_PL_posActWork_02', datStruct, 'p',5,StiffnessValues) 
ProcessParameterStudy_Randomized('ParameterStudies/StiffnessStudy_HOPPING_1D_PL_posActWork_02', PathTo1DMonoped, PathToMuscod);
%load('BaseData/HOPPING_1D_PL_posElWork_BASE_01.mat','datStruct');
%datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_PL_posElWork_BASE_01', 30,10,1);
%CreateParameterStudy_Randomized('ParameterStudies/StiffnessStudy_HOPPING_1D_PL_posElWork_02', datStruct, 'p',5,StiffnessValues) 
ProcessParameterStudy_Randomized('ParameterStudies/StiffnessStudy_HOPPING_1D_PL_posElWork_02', PathTo1DMonoped, PathToMuscod);
%load('BaseData/HOPPING_1D_PL_totElLoss_BASE_01.mat','datStruct');
%datStruct = UpdateDatStruct(datStruct, 'BaseData/HOPPING_1D_PL_totElLoss_BASE_01', 30,10,1);
%CreateParameterStudy_Randomized('ParameterStudies/StiffnessStudy_HOPPING_1D_PL_totElLoss_02', datStruct, 'p',5,StiffnessValues) 
ProcessParameterStudy_Randomized('ParameterStudies/StiffnessStudy_HOPPING_1D_PL_totElLoss_02', PathTo1DMonoped, PathToMuscod);

%% Show the results:
figure(2)
clf
hold on
box on
grid on
StiffnessValues = [linspace(1,9.8,45),logspace(1,log10(100),115),linspace(102,200,50)];
count = zeros(length(StiffnessValues),7);
load('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_posMeWork_02','configurations','types','indices','grids');
for i = 1:length(configurations)
    count(configurations{i}.indexVector(1),1)=count(configurations{i}.indexVector(1),1)+1;
    if configurations{i}.nFailed < 5
        plot(grids{1}(configurations{i}.indexVector(1)), configurations{i}.costValue,'c*');
    else
        plot(grids{1}(configurations{i}.indexVector(1)), 0,'m*');
    end
end
load('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_posActWork_02','configurations','types','indices','grids');
for i = 1:length(configurations)
    count(configurations{i}.indexVector(1),2)=count(configurations{i}.indexVector(1),2)+1;
    if configurations{i}.nFailed < 5
        plot(grids{1}(configurations{i}.indexVector(1)), configurations{i}.costValue,'co');
    else
        plot(grids{1}(configurations{i}.indexVector(1)), 0,'mo');
    end
end
load('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_posElWork_02','configurations','types','indices','grids');
for i = 1:length(configurations)
    count(configurations{i}.indexVector(1),3)=count(configurations{i}.indexVector(1),3)+1;
    if configurations{i}.nFailed < 5
        plot(grids{1}(configurations{i}.indexVector(1)), configurations{i}.costValue,'c+');
    else
        plot(grids{1}(configurations{i}.indexVector(1)), 0,'m+');
    end
end
load('ParameterStudies/StiffnessStudy_HOPPING_1D_SL_totElLoss_02','configurations','types','indices','grids');
for i = 1:length(configurations)
    count(configurations{i}.indexVector(1),4)=count(configurations{i}.indexVector(1),4)+1;
    if configurations{i}.nFailed < 5
        plot(grids{1}(configurations{i}.indexVector(1)), configurations{i}.costValue,'c.');
    else
        plot(grids{1}(configurations{i}.indexVector(1)), 0,'m.');
    end
end
load('ParameterStudies/StiffnessStudy_HOPPING_1D_PL_posActWork_02','configurations','types','indices','grids');
for i = 1:length(configurations)
    count(configurations{i}.indexVector(1),5)=count(configurations{i}.indexVector(1),5)+1;
    if configurations{i}.nFailed < 5
        plot(grids{1}(configurations{i}.indexVector(1)), configurations{i}.costValue,'ko');
    else
        plot(grids{1}(configurations{i}.indexVector(1)), 0,'mo');
    end
end
load('ParameterStudies/StiffnessStudy_HOPPING_1D_PL_posElWork_02','configurations','types','indices','grids');
for i = 1:length(configurations)
    count(configurations{i}.indexVector(1),6)=count(configurations{i}.indexVector(1),6)+1;
    if configurations{i}.nFailed < 5
        plot(grids{1}(configurations{i}.indexVector(1)), configurations{i}.costValue,'k+');
    else
        plot(grids{1}(configurations{i}.indexVector(1)), 0,'m+');
    end
end
load('ParameterStudies/StiffnessStudy_HOPPING_1D_PL_totElLoss_02','configurations','types','indices','grids');
for i = 1:length(configurations)
    count(configurations{i}.indexVector(1),7)=count(configurations{i}.indexVector(1),7)+1;
    if configurations{i}.nFailed < 5
        plot(grids{1}(configurations{i}.indexVector(1)), configurations{i}.costValue,'k.');
    else
        plot(grids{1}(configurations{i}.indexVector(1)), 0,'m.');
    end
end
disp(count);
drawnow();
























%% STEP1
% This first set of datStructs and .dat files are the initial problem
% files. The initial parameters have been selected as simple as possible.
% Yet they will converge to solutions when used in muscod.
%  - No constraints are imposed at this stage.
%  - Transmission values are fixed.
mkdir('BaseData');
datStruct = CreateDatStruct('RUN','PEA','PEA');
save('BaseData/RUN_PH_PL_BASE_00.mat', 'datStruct');
CreateDatFile('BaseData/RUN_PH_PL_BASE_00',datStruct);
datStruct = CreateDatStruct('RUN','PEA','SEA');
save('BaseData/RUN_PH_SL_BASE_00.mat', 'datStruct');
CreateDatFile('BaseData/RUN_PH_SL_BASE_00',datStruct);
datStruct = CreateDatStruct('RUN','SEA','PEA');
save('BaseData/RUN_SH_PL_BASE_00.mat', 'datStruct');
CreateDatFile('BaseData/RUN_SH_PL_BASE_00',datStruct);
datStruct = CreateDatStruct('RUN','SEA','SEA');
save('BaseData/RUN_SH_SL_BASE_00.mat', 'datStruct');
CreateDatFile('BaseData/RUN_SH_SL_BASE_00',datStruct);
% Copy to project director to process in Muscod
currentPath = pwd;
system(['cp ',pwd,'/BaseData/RUN_*_BASE_00.dat ', PathTo2DBiped,'DAT/']);
% SWITCH TO PROJECT DIRECTORY AND RUN MUSCOD THERE
cd(PathTo2DBiped);
[MuscodResults_11(1), cmdout] = system([PathToMuscod,' RUN_PH_PL_BASE_00']);
[MuscodResults_11(2), cmdout] = system([PathToMuscod,' RUN_PH_SL_BASE_00']);
[MuscodResults_11(3), cmdout] = system([PathToMuscod,' RUN_SH_PL_BASE_00']);
[MuscodResults_11(4), cmdout] = system([PathToMuscod,' RUN_SH_SL_BASE_00']);
cd(currentPath);
% Copy back to BaseData/
system(['cp ',PathTo2DBiped,'RES/RUN_*_BASE_00.* ',pwd,'/BaseData/']);
% Clean up DAT and RES folders
system(['rm ',PathTo2DBiped,'DAT/*.* ']);
system(['rm ',PathTo2DBiped,'RES/*.* ']);
% Converged 4/21 and 6/24

%% STEP2:
% In a second step, the results obtained in STEP1 are resampled, and used
% as intial guesses for a series, in which the constraints are enforced,
% and transmission values can be changed.
load('BaseData/RUN_PH_PL_BASE_00.mat','datStruct');
datStruct = UpdateDatStruct(datStruct, 'BaseData/RUN_PH_PL_BASE_00', 30,25,4);
datStruct.header = {'// Updated from RUN_PH_PL_BASE_00'};
datStruct.p(5) = 6;
datStruct.p_fix(7) = 0;
datStruct.p_fix(9) = 0;
save('BaseData/RUN_PH_PL_BASE_01.mat', 'datStruct');
CreateDatFile('BaseData/RUN_PH_PL_BASE_01',datStruct);
% Converged 4/26
load('BaseData/RUN_PH_SL_BASE_00.mat','datStruct');
datStruct = UpdateDatStruct(datStruct, 'BaseData/RUN_PH_SL_BASE_00', 30,25,4);
datStruct.header = {'// Updated from RUN_PH_SL_BASE_00'};
datStruct.p(5) = 6;
datStruct.p_fix(7) = 0;
datStruct.p_fix(9) = 0;
datStruct.h(1) = 0.4;
save('BaseData/RUN_PH_SL_BASE_01.mat', 'datStruct');
CreateDatFile('BaseData/RUN_PH_SL_BASE_01',datStruct);
% failed in the first run, than changed h(1) to 0.4. Then it converged 4/26
load('BaseData/RUN_SH_PL_BASE_00.mat','datStruct');
datStruct = UpdateDatStruct(datStruct, 'BaseData/RUN_SH_PL_BASE_00', 30,25,4);
datStruct.header = {'// Updated from RUN_SH_PL_BASE_00'};
datStruct.p(5) = 6;
datStruct.p_fix(7) = 0;
datStruct.p_fix(9) = 0;
save('BaseData/RUN_SH_PL_BASE_01.mat', 'datStruct');
CreateDatFile('BaseData/RUN_SH_PL_BASE_01',datStruct);
% Converged4/26
load('BaseData/RUN_SH_SL_BASE_00.mat','datStruct');
datStruct = UpdateDatStruct(datStruct, 'BaseData/RUN_SH_SL_BASE_00', 30,25,4);
datStruct.header = {'// Updated from RUN_SH_SL_BASE_00'};
datStruct.p(5) = 6;
datStruct.p_fix(7) = 0;
datStruct.p_fix(9) = 0;
save('BaseData/RUN_SH_SL_BASE_01.mat', 'datStruct');
CreateDatFile('BaseData/RUN_SH_SL_BASE_01',datStruct);
% Copy to project director to process in Muscod
currentPath = pwd;
system(['cp ',pwd,'/BaseData/RUN_*_BASE_01.dat ', PathTo2DBiped,'DAT/']);
% SWITCH TO PROJECT DIRECTORY AND RUN MUSCOD THERE
cd(PathTo2DBiped);
[MuscodResults_12(1), cmdout] = system([PathToMuscod,' RUN_PH_PL_BASE_01']);
[MuscodResults_12(2), cmdout] = system([PathToMuscod,' RUN_PH_SL_BASE_01']);
[MuscodResults_12(3), cmdout] = system([PathToMuscod,' RUN_SH_PL_BASE_01']);
[MuscodResults_12(4), cmdout] = system([PathToMuscod,' RUN_SH_SL_BASE_01']);
cd(currentPath);
% Copy back to BaseData/
system(['cp ',PathTo2DBiped,'RES/RUN_*_BASE_01.* ',pwd,'/BaseData/']);
% Clean up DAT and RES folders
system(['rm ',PathTo2DBiped,'DAT/*.* ']);
system(['rm ',PathTo2DBiped,'RES/*.* ']);

% Converged 4/26
PlotMuscodResults('BaseData/RUN_PH_PL_BASE_01',[8,12,16,20]);
PlotMuscodResults('BaseData/RUN_PH_SL_BASE_01',[10,14,18,22]);
PlotMuscodResults('BaseData/RUN_SH_PL_BASE_01',[8,12,16,20]);
PlotMuscodResults('BaseData/RUN_SH_SL_BASE_01',[10,14,18,22]);

%% STEP3:
% Reprocess these files, resample them, and run them again to ensure that
% we're starting in a local minimum:
load('BaseData/RUN_PH_PL_BASE_01.mat','datStruct');
datStruct = UpdateDatStruct(datStruct, 'BaseData/RUN_PH_PL_BASE_01', 30,25,4);
datStruct.h(1) = 0.3;
save('BaseData/RUN_PH_PL_BASE_02.mat', 'datStruct');
CreateDatFile('BaseData/RUN_PH_PL_BASE_02',datStruct);
% failed in the first run, than changed h(1) to 0.3. Then it converged 4/26
load('BaseData/RUN_PH_SL_BASE_01.mat','datStruct');
datStruct = UpdateDatStruct(datStruct, 'BaseData/RUN_PH_SL_BASE_01', 30,25,4);
datStruct.h(1) = 0.55;
save('BaseData/RUN_PH_SL_BASE_02.mat', 'datStruct');
CreateDatFile('BaseData/RUN_PH_SL_BASE_02',datStruct);
% failed in the first run, than changed h(1) to 0.3. Then it converged 4/26
load('BaseData/RUN_SH_PL_BASE_01.mat','datStruct');
datStruct = UpdateDatStruct(datStruct, 'BaseData/RUN_SH_PL_BASE_01', 30,25,4);
save('BaseData/RUN_SH_PL_BASE_02.mat', 'datStruct');
CreateDatFile('BaseData/RUN_SH_PL_BASE_02',datStruct);
% Converged 4/26
load('BaseData/RUN_SH_SL_BASE_01.mat','datStruct');
datStruct = UpdateDatStruct(datStruct, 'BaseData/RUN_SH_SL_BASE_01', 30,25,4);
save('BaseData/RUN_SH_SL_BASE_02.mat', 'datStruct');
CreateDatFile('BaseData/RUN_SH_SL_BASE_02',datStruct);
% Copy to project director to process in Muscod
currentPath = pwd;
system(['cp ',pwd,'/BaseData/RUN_*_BASE_02.dat ', PathTo2DBiped,'DAT/']);
% SWITCH TO PROJECT DIRECTORY AND RUN MUSCOD THERE
cd(PathTo2DBiped);
[MuscodResults_13(1), cmdout] = system([PathToMuscod,' RUN_PH_PL_BASE_02']);
[MuscodResults_13(2), cmdout] = system([PathToMuscod,' RUN_PH_SL_BASE_02']);
[MuscodResults_13(3), cmdout] = system([PathToMuscod,' RUN_SH_PL_BASE_02']);
[MuscodResults_13(4), cmdout] = system([PathToMuscod,' RUN_SH_SL_BASE_02']);
cd(currentPath);
% Copy back to BaseData/
system(['cp ',PathTo2DBiped,'RES/RUN_*_BASE_02.* ',pwd,'/BaseData/']);
% Clean up DAT and RES folders
system(['rm ',PathTo2DBiped,'DAT/*.* ']);
system(['rm ',PathTo2DBiped,'RES/*.* ']);
% Converged 4/26

%% STEP4: 
% Process a parameter study that varies the stiffness values:
load('BaseData/RUN_PH_PL_BASE_02.mat','datStruct');
datStruct = UpdateDatStruct(datStruct, 'BaseData/RUN_PH_PL_BASE_02', 30);
% ..., 'p',6,logspace( log10(0.001), log10(15),10), 'p',8,logspace( log10(0.001), log10(15),10)) 
%CreateParameterStudy('ParameterStudies/StiffnessStudy_PH_PL', datStruct, 'p',6,linspace(0.0001,15,10),'p',8,linspace(0.0001,15,10)) 
ProcessParameterStudy('ParameterStudies/StiffnessStudy_PH_PL', 'ParameterStudies/', 'muscod');

load('ParameterStudies/StiffnessStudy_PH_PL','configurations','types','indices','grids');
count = zeros(length(grids{1}),length(grids{2}));
clf
hold on
box on
grid on
for i = 1:length(configurations)
    count(configurations{i}.indexVector(1),configurations{i}.indexVector(2))=count(configurations{i}.indexVector(1),configurations{i}.indexVector(2))+1;
    if configurations{i}.nFailed <= 5
        plot3(grids{1}(configurations{i}.indexVector(1)), grids{2}(configurations{i}.indexVector(2)), configurations{i}.costValue,'*');
    end
end
%axis equal
disp(count);


%% STEP5: 
% Process a parameter study that varies the velocity values:
load('BaseData/RUN_PH_PL_BASE_02.mat','datStruct');
datStruct = UpdateDatStruct(datStruct, 'BaseData/RUN_PH_PL_BASE_02', 30);
CreateParameterStudy('VelocityStudy', datStruct, 'p',4,linspace( 0.05, 2,20)) 
ProcessParameterStudy('VelocityStudy', '.', 'muscod');

load('VelocityStudy','configurations','types','indices','grids');
count = zeros(length(grids{1}),1);
clf
hold on
box on
grid on
for i = 1:length(configurations)
    count(configurations{i}.indexVector(1))=count(configurations{i}.indexVector(1))+1;
    plot(grids{1}(configurations{i}.indexVector(1)),configurations{i}.costValue,'*');
end
disp(count);
