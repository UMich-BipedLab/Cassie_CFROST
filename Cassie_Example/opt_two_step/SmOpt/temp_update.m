

stiffness = 1:1:25;
for i = 1:length(stiffness)
damp_ratio(i) = 0.2*sqrt(stiffness(i)/10);
end

for i =11:length(stiffness)
load(['TempData/HOPPING_1D_posActWork_',num2str(stiffness(i-1)),'.mat'],'datStruct');
datStruct = UpdateDatStruct(datStruct, ['TempData/HOPPING_1D_posActWork_',num2str(stiffness(i-1))], 30,10,1);
datStruct.p(5) = stiffness(i);  
datStruct.p(7) = damp_ratio(i);  
save(['TempData/HOPPING_1D_posActWork_',num2str(stiffness(i)),'.mat'], 'datStruct');
CreateDatFile(['TempData/HOPPING_1D_posActWork_',num2str(stiffness(i))],datStruct);
    
% Copy to project director to process in Muscod
currentPath = pwd;
system(['cp ',pwd,'TempData/HOPPING_1D_posActWork_',num2str(stiffness(i)),'.dat ', PathTo1DMonoped,'DAT/']);
% SWITCH TO PROJECT DIRECTORY AND RUN MUSCOD THERE
cd(PathTo1DMonoped);
[MuscodResults_02(1), cmdout] = system([PathToMuscod,' HOPPING_1D_posActWork_',num2str(stiffness(i))]);
cd(currentPath);
% Copy back to BaseData/
system(['cp ',PathTo1DMonoped,'RES/HOPPING_1D_posActWork_',num2str(stiffness(i)),'.* ',pwd,'/TempData/']);
% Clean up DAT and RES folders
system(['rm ',PathTo1DMonoped,'DAT/*.* ']);
system(['rm ',PathTo1DMonoped,'RES/*.* ']);

end

for i =9:(-1):1
load(['TempData/HOPPING_1D_posActWork_',num2str(stiffness(i+1)),'.mat'],'datStruct');
datStruct = UpdateDatStruct(datStruct, ['TempData/HOPPING_1D_posActWork_',num2str(stiffness(i+1))], 30,10,1);
datStruct.p(5) = stiffness(i);  
datStruct.p(7) = damp_ratio(i);  
save(['TempData/HOPPING_1D_posActWork_',num2str(stiffness(i)),'.mat'], 'datStruct');
CreateDatFile(['TempData/HOPPING_1D_posActWork_',num2str(stiffness(i))],datStruct);
    
% Copy to project director to process in Muscod
currentPath = pwd;
system(['cp ',pwd,'TempData/HOPPING_1D_posActWork_',num2str(stiffness(i)),'.dat ', PathTo1DMonoped,'DAT/']);
% SWITCH TO PROJECT DIRECTORY AND RUN MUSCOD THERE
cd(PathTo1DMonoped);
[MuscodResults_02(1), cmdout] = system([PathToMuscod,' HOPPING_1D_posActWork_',num2str(stiffness(i))]);
cd(currentPath);
% Copy back to BaseData/
system(['cp ',PathTo1DMonoped,'RES/HOPPING_1D_posActWork_',num2str(stiffness(i)),'.* ',pwd,'/TempData/']);
% Clean up DAT and RES folders
system(['rm ',PathTo1DMonoped,'DAT/*.* ']);
system(['rm ',PathTo1DMonoped,'RES/*.* ']);

end










