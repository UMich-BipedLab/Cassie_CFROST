% This function takes the results stored in fileName to update the
% information stored in datStruct.  To this end, the function interpolates
% the results to generate an evenly spaced grid with a total of
% 'nshoot_total' elements. It then updates the parameter vector p, the
% states sd, the controls u, and the grid nshoot and h.
function newDatStruct = UpdateDatStruct(datStruct, fileName, nshoot_total, NY, NU)
    % Read the .mot & .plt file of baseFileName, to generate a good initial
    % guess for h, p, sd, etc.
    [t, y, u, yName, uName] = ReadPLTfile(fileName, NY, NU);
    [obj, h, nshoot, index, tN, yN, uN, p, yNameS, uNameS, pNameS] = ReadMOTfile(fileName, NY, NU);
    % the new grid should be evenly spaced on these intervals and each
    % phase should have at least one grid point:
    nshoot_NEW = round((nshoot_total-length(h))*h/tN(end))+1;
    % figure out the timestamps at these instances and at the end of the
    % simulation (total sum(nshoot)+1 points).  
    t_NEW = zeros(sum(nshoot_NEW)+1,1);
    deltaT_NEW = h./nshoot_NEW;
    t_act = 0;
    for i = 1:sum(nshoot_NEW)
        t_NEW(i) = t_act;
        phase_ = find(i<=cumsum(nshoot_NEW),1);
        t_act = t_act + deltaT_NEW(phase_);
    end
    t_NEW(sum(nshoot_NEW)+1) = t_act;
    p_NEW = p;
    h_NEW = h;
    sd_NEW = interp1(t+linspace(0,1e-12,length(t))',y,t_NEW,'linear','extrap')';
    u_NEW = interp1(t+linspace(0,1e-12,length(t))',u,t_NEW,'linear','extrap')';
    
    newDatStruct = datStruct;
    newDatStruct.nshoot = nshoot_NEW;
    newDatStruct.h      = h_NEW;
    newDatStruct.p      = p_NEW;
    newDatStruct.sd     = sd_NEW;
    newDatStruct.u      = u_NEW;
end