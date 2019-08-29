% Creates a data struct, as it is used in the function CreateDatFile. Each
% data struct create by this function is guranteed to converge to a
% solution in MUSCOD.
% gaitType can be of the following:
%   'RUN', 'WALK', 'SKIP', 'HOP', 'RUWA'
% hipJointType and legJointType are either
%   'PEA' or 'SEA'
%
% Possible uses:
% CreateDatFile('Data/RUN_PH_PL_BASE',CreateDatStruct('RUN','PEA','PEA'))
% CreateDatFile('Data/RUN_PH_SL_BASE',CreateDatStruct('RUN','PEA','SEA'))
% CreateDatFile('Data/RUN_SH_PL_BASE',CreateDatStruct('RUN','SEA','PEA'))
% CreateDatFile('Data/RUN_SH_SL_BASE',CreateDatStruct('RUN','SEA','SEA'))
function datStruct = CreateDatStruct(gaitType, hipJointType, legJointType)
    % First, define all properties that only depend on the gait type:
    switch gaitType
        case 'RUN'
            sd = zeros(25,1);
            sd(2)  = 0.5;   % y
            sd(3)  = 1;   % y
            sd(4)  = 0.5; % dy
            sd(15) = 1;   % lL
            sd(19) = 1;   % lR
            u  = zeros(4,1);
            h  = [1;0;1.4];
            nshoot = [5;1;15];
            p(3) = 2; % cost function (electrical COT)
            p(5) = 0; % limits (none)
            p(6:9) = [0.01;4;10;0.5];
            typeString = 'running';
            datStruct.libmodel = 'libPB_Running';
            datStruct.libind = {'ind_rkf45'; 'ind_strans'; 'ind_rkf45'};
            datStruct.h_name = {'flight'; 'touchdown left'; 'single stance left'};
            datStruct.h_comment = {'Flight Phase'; 'Touchdown Left Leg'; 'Single Stance Left Leg'};
            datStruct.nshoot = nshoot;
            datStruct.h      = h;
            datStruct.h_sca  = [1.0;0;1.0];
            datStruct.h_min  = [0.0001;0.0;0.0001];
            datStruct.h_max  = [5.0;0.0;5.0];
            datStruct.h_fix  = [0;1;0];
            p(4) = 1; % set speed;
        otherwise
            error('Unknown gait type')
    end
    switch hipJointType
        case 'PEA'
            p(1) = 1;
            hipString = 'parallel';
        case 'SEA'
            p(1) = 0;
            hipString = 'series';
        otherwise
            error('Unknown hip joint type')
    end
    switch legJointType
        case 'PEA'
            p(2) = 1;
            legString = 'parallel';
        case 'SEA'
            p(2) = 0;
            legString = 'series';
        otherwise
            error('Unknown hip joint type')
    end
    
    % Parameterized properties:
    datStruct.header = {'/***********************************************';
                          '*';
                          ['*  Gait optimization for a prismatic biped in a symmetric ',typeString];
                          ['*  gait with ',hipString,' elastic hips and ',legString,' elastic legs'];
                          '*';
                          '*';
                          ['*    0: ',num2str(p(1),'% 8.5f'),'   // hip_jnt_type [0; 1]              Actuator selection hip (0 = series elastic; 1 = parallel elastic)'];
                          ['*    1: ',num2str(p(2),'% 8.5f'),'   // leg_jnt_type [0; 1]              Actuator selection leg (0 = series elastic; 1 = parallel elastic)'];
                          ['*    2: ',num2str(p(3),'% 8.5f'),'   // cost_fct_sel [1; 2; 3]           Cost function selector (0 = posMeWorkCOT; 1 = posActWorkCOT; 2 = posElWorkCOT; 3 = totElLossCOT)'];
                          ['*    3: ',num2str(p(4),'% 8.5f'),'   // v_avg        [sqrt(l_0*g)]       Enforced average velocity'];
                          ['*    4: ',num2str(p(5),'% 8.5f'),'   // const_sel    [binary flags]      1: GroundClearance 2: TorqueLimits 4: SpeedLimits'];
                          ['*    5: ',num2str(p(6),'% 8.5f'),'   // kalpha       [m_0*g*l_0/rad]     Rotational spring stiffness in the hip joint'];
                          ['*    6: ',num2str(p(7),'% 8.5f'),'   // du_max_alpha [rad/sqrt(l_0/g)]   Maximal velocity of the leg extension actuator'];
                          ['*    7: ',num2str(p(8),'% 8.5f'),'   // kl           [m_0*g/l_0]         Linear spring stiffness in the prismatic joint'];
                          ['*    8: ',num2str(p(9),'% 8.5f'),'   // du_max_l     [sqrt(g*l_0)]       Maximal velocity of the leg extension actuator'];
                          '*';
                          '***********************************************/'};

    % Common properties:
    datStruct.xd_name = {'x'; 'd x'; 'y'; 'd y'; 'phi'; 'd phi'; 'alpha L'; 'd alpha L'; 'u alpha L'; 'du alpha L'; 'alpha R'; 'd alpha R'; 'u alpha R'; 'du alpha R'; 'l L'; 'd l L'; 'u l L'; 'du l L'; 'l R'; 'd l R'; 'u l R'; 'du l R'; 'Act Work'; 'El Work'; 'El Loss'};
    datStruct.xd_comment = {'x -> must initially remain 0'; 
                             'dx'; 
                             'y'; 
                             'dy'; 
                             'phi'; 
                             'dphi'; 
                             'alphaL'; 
                             'dalphaL'; 
                             'ualphaL'; 
                             'du alphaL'; 
                             'alphaR'; 
                             'dalphaR'; 
                             'ualphaR'; 
                             'dualphaR'; 
                             'lL'; 
                             'dlL'; 
                             'ulL';
                             'dulL';
                             'lR'; 
                             'dlR';
                             'ulR';
                             'dulR';
                             'posActWork -> must initially remain 0'; 
                             'posElWork -> must initially remain 0'; 
                             'totElLoss -> must initially remain 0'};
    % If the hip is driven by series elastic actuation, the initial hip
    % angle can be fixed at 0:
    if(strcmp(hipJointType, 'SEA'))
        datStruct.xd_comment{5} = 'phi -> Remains initially 0 for hip SEA';
    else
        datStruct.xd_comment{5} = 'phi -> Free to move for hip PEA';
    end
    % If a joint is using parallel actuation no motion in the actuator is
    % necessary 
    if(strcmp(hipJointType, 'PEA'))
        for i = [9,10,13,14]
            datStruct.xd_comment{i} = [datStruct.xd_comment{i},' -> PEA, no actuator motion'];
        end
    end
    if(strcmp(legJointType, 'PEA'))
        for i = [17,18,21,22]
            datStruct.xd_comment{i} = [datStruct.xd_comment{i},' -> PEA, no actuator motion'];
        end
    end
    datStruct.sd = sd;
    datStruct.sd_sca      = ones(25,1);
    % States are unlimited apart from the actuator states (which are bound
    % by +/- 90deg and +/-0.15
    datStruct.sd_min      = [-100; -100; -100; -100; -100; -100; -100; -100; -pi/4; -100; -100; -100; -pi/4; -100; -100; -100; -0.15; -100; -100; -100; -0.15; -100; -100; -100; -100];
    datStruct.sd_max      = -datStruct.sd_min;
    % initially only the x-position and the cost functions can not be
    % changed:
    datStruct.sd_fix_init = [1;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;0;1;1;1];
    if(strcmp(hipJointType, 'SEA'))
        datStruct.sd_fix_init(5) = 1;
    end
    % Everything can change thereafter:
    datStruct.sd_fix      = zeros(25,1);
    % Change this, if a joint is using parallel actuation (then no motion
    % in the actuator is necessary)
    if(strcmp(hipJointType, 'PEA'))
        datStruct.sd_fix_init([9,10,13,14]) = 1;
        datStruct.sd_fix([9,10,13,14]) = 1;
        datStruct.sd([9,10,13,14],:) = 0;
    end
    if(strcmp(legJointType, 'PEA'))
        datStruct.sd_fix_init([17,18,21,22]) = 1;
        datStruct.sd_fix([17,18,21,22]) = 1;
        datStruct.sd([17,18,21,22],:) = 0;
    end
    
    datStruct.p_name = {'hip jnt type'; 'leg jnt type'; 'cost fct sel'; 'v avg'; 'const_sel'; 'k alpha'; 'du max alpha'; 'k l'; 'du max l'};
    datStruct.p_comment = {'hip_jnt_type [0; 1]            Actuator selection hip (0 = series elastic; 1 = parallel elastic)'; 
                            'leg_jnt_type [0; 1]            Actuator selection leg (0 = series elastic; 1 = parallel elastic)'; 
                            'cost_fct_sel [1; 2; 3]         Cost function selector (1 = ActWorkCOT; 2 = ElWorkCOT; 3 = ElLossCOT)'; 
                            'v_avg        [sqrt(l_0*g)]     Enforced average velocity'; 
                            'const_sel    [binary flags]    1: GroundClearance 2: TorqueLimits 4: SpeedLimits';
                            'kalpha       [m_0*g*l_0/rad]   Rotational spring stiffness in the hip joint'; 
                            'du_max_alpha [rad/sqrt(l_0/g)] Maximal velocity of the leg extension actuator'; 
                            'kl           [m_0*g/l_0]       Linear spring stiffness in the prismatic joint'; 
                            'du_max_l     [sqrt(g*l_0)]     Maximal velocity of the leg '};
    datStruct.p      = p;
    datStruct.p_sca  = [1; 1; 1; 1.0; 1;  5.0;     4.0;    10.0; 0.5];
    datStruct.p_min  = [0; 0; 1; 0.0; 0;  0.0001;  0.0001;  0.0001; 0.0001];
    datStruct.p_max  = [1; 1; 3; 5.0; 7; 15.0;    10.0;    15.0; 10.0];
    % Only the actuator parameters can be changed.
    datStruct.p_fix  = [1; 1; 1; 1;   1;  0;      1;       0;   1];

    datStruct.u_name = {'T alpha L'; 'T alpha R'; 'F l L'; 'F l R'};
    datStruct.u_comment = {'TalphaL'; 
                            'TalphaR'; 
                            'FlL'; 
                            'FlR'};
    datStruct.u_type = [2; 2; 2; 2]; % piecewise linear
    datStruct.u      = u;
    datStruct.u_sca  = [1.0; 1.0; 1.0; 1.0];
    % This limit should never go into effect, since the actuators are
    % limited within the dynamic functions. Yet, it helps stabilize the
    % optimization
    datStruct.u_min  = [-25.0; -25.0; -25.0; -25.0];
    datStruct.u_max  = -datStruct.u_min;
    datStruct.u_fix  = [0; 0; 0; 0];

    datStruct.rd_scaStart = 1.0;
    datStruct.rd_scaEnd   = 1.0;
    datStruct.rc_sca      = 1.0;

    datStruct.of_name = 'COT';
    datStruct.of_sca  = 0.5;
    datStruct.of_min  = 0.0;
    datStruct.of_max  = 1.0;
    datStruct.nhist   = 100;

    datStruct.libhessian = 'hess_update';
    datStruct.libsolve   = 'solve_slse';
    datStruct.libcond    = 'cond_std';
    datStruct.libtchk    = 'tchk';
    datStruct.libmssqp   = 'mssqp_standard';
    datStruct.libeval    = 'eval_ind';
    datStruct.libqps     = 'qps_qpopt';
    datStruct.libplot    = 'plot_pgplot';

    datStruct.options_acc           = 1e-6;
    datStruct.options_ftol          = -1.0;
    datStruct.options_itol          = -1.0;
    datStruct.options_rfac          = 0.0;
    datStruct.options_levmar        = 0.0;
    datStruct.options_qp_featol     = 1.0e-8;
    datStruct.options_qp_relax      = 1.1;
    datStruct.options_nhtopy        = 0;
    datStruct.options_frstart       = 0;
    datStruct.options_frmax         = 0;
    datStruct.options_itmax         = 1000;
    datStruct.options_plevel_screen = 0;
    datStruct.options_plevel_file   = 1;
    datStruct.options_plevel_matlab = 0;
    datStruct.options_bflag         = -1;
    datStruct.options_qp_itmax      = 10000;
    datStruct.options_qp_expand     = 99999999;
    datStruct.options_sflag         = 0;
    datStruct.options_options_wflag = 0;
    datStruct.options_cflag         = 0;
    datStruct.options_output_ps     = 0;
    datStruct.options_output_gif    = 0;
end