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
