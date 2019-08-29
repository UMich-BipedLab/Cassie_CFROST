% Creates a data struct, as it is used in the function CreateDatFile. Each
% data struct create by this function is guranteed to converge to a
% solution in MUSCOD.
% In the basic version, values are chosen to replicate the results of my
% dissertation/ the ICRA paper on costfunctions.
%
% legJointType is either
%   'PEA' or 'SEA'
%
% Possible uses:
% CreateDatFile('Data/HOPPING_1D_PL_BASE',CreateDatStructMonoped1D('PEA'))
% CreateDatFile('Data/HOPPING_1D_SL_BASE',CreateDatStructMonoped1D('SEA'))
function datStruct = CreateDatStructMonoped1D(legJointType, costFunction)
    % First, define all properties that only depend on the gait type:
    sd = zeros(10,1);
    sd(1) = 1; % y
    sd(2) = 0.5; % dy
    sd(3) = 1; % l
    sd(4) = 0; % dl
    sd(5) = 0; % ul
    sd(6) = 0; % dul
    u  = 0;
    h  = [0.5;0.5;0;1];
    nshoot = [10;12;1;20];
    p(2) =  costFunction;  % cost function
    p(3) = 1.3; % Hopping height
    p(4) = 0;   % no limits 
    p(5:8) = [10;0.5;0.2;1]; % kl, du_max, b_l, rho_l
    typeString = 'hopping';
    datStruct.libmodel = 'libPM1D_Hopping';
    datStruct.libind = {'ind_rkf45'; 'ind_rkf45'; 'ind_strans'; 'ind_rkf45'};
    datStruct.h_name = {'flight until apex'; 'flight after apex'; 'touchdown'; 'stance'};
    datStruct.h_comment = {'Flight Phase Until Apex Transit'; 'Flight Phase After Apex Transit'; 'Touchdown'; 'Stance'};
    datStruct.nshoot = nshoot;
    datStruct.h      = h;
    datStruct.h_sca  = [1.0;1.0;0;1.0];
    datStruct.h_min  = [0.0001;0.0001;0.0;0.0001];
    datStruct.h_max  = [5.0;5.0;0.0;5.0];
    datStruct.h_fix  = [0;0;1;0];
    
    switch legJointType
        case 'PEA'
            p(1) = 1;
            legString = 'parallel';
        case 'SEA'
            p(1) = 0;
            legString = 'series';
        otherwise
            error('Unknown hip joint type')
    end
    
    % Parameterized properties:
    datStruct.header = {'/***********************************************';
                          '*';
                          ['*  Gait optimization for a prismatic monopted in a ',typeString];
                          ['*  gait with ',legString,' elastic legs'];
                          '*';
                          '*';
                          ['*    0: ',num2str(p(1),'% 8.5f'),'   // leg_jnt_type [0; 1]              Actuator selection leg (0 = series elastic; 1 = parallel elastic)'];
                          ['*    1: ',num2str(p(2),'% 8.5f'),'   // cost_fct_sel [0; 1; 2; 3]        Cost function selector (1 = posActWorkCOT; 2 = posElWorkCOT; 3 = totElLossCOT)'];
                          ['*    2: ',num2str(p(3),'% 8.5f'),'   // height       [l_0]               Enforced hopping height'];
                          ['*    3: ',num2str(p(4),'% 8.5f'),'   // const_sel    [binary flags]      1: GroundClearance 2: TorqueLimits 4: SpeedLimits'];
                          ['*    4: ',num2str(p(5),'% 8.5f'),'   // kl           [m_0*g/l_0]         Linear spring stiffness in the prismatic joint'];
                          ['*    5: ',num2str(p(6),'% 8.5f'),'   // du_max_l     [sqrt(g*l_0)]       Maximal velocity of the leg extension actuator'];
                          ['*    6: ',num2str(p(7),'% 8.5f'),'   // blRat        [*]                 Damping ratio of the spring'];
                          ['*    7: ',num2str(p(8),'% 8.5f'),'   // rho_l        [*]                 Scaling of the motor size'];
                          '*';
                          '***********************************************/'};

    % Common properties:
    datStruct.xd_name = {'y'; 'd y'; 'l'; 'd l'; 'u l'; 'du l'; 'Me Work'; 'Act Work'; 'El Work'; 'El Loss'};
    datStruct.xd_comment = { 'y'; 
                             'dy'; 
                             'l'; 
                             'dl'; 
                             'ul';
                             'dul';
                             'posMeWork -> must initially remain 0'; 
                             'posActWork -> must initially remain 0'; 
                             'posElWork -> must initially remain 0'; 
                             'totElLoss -> must initially remain 0'};
    % If a joint is using parallel actuation no motion in the actuator is
    % necessary 
    if(strcmp(legJointType, 'PEA'))
        for i = 6:7
            datStruct.xd_comment{i} = [datStruct.xd_comment{i},' -> PEA, no actuator motion'];
        end
    end
    datStruct.sd = sd;
    datStruct.sd_sca      = ones(10,1);
    % States are unlimited apart from the actuator (which is bound by
    % +/-0.15) and the leg length (0.5....1.15)
    datStruct.sd_min      = [-100; -100; 0.50; -100; -0.15; -100; -100; -100; -100; -100;];
    datStruct.sd_max      = [+100; +100; 1.15; +100; +0.15; +100; +100; +100; +100; +100;];
    % Fixed at the start of the simulation:
    datStruct.sd_fix_init = [0;0;0;0;0;0;1;1;1;1];
    % Everything can change thereafter:
    datStruct.sd_fix      = zeros(10,1);
    % Change this, if a joint is using parallel actuation (then no motion
    % in the actuator is necessary)
    if(strcmp(legJointType, 'PEA'))
        datStruct.sd_fix_init(5:7) = 1;
        datStruct.sd_fix(5:7) = 1;
        datStruct.sd(5:7,:) = 0;
    end
    
    datStruct.p_name = {'leg jnt type'; 'cost fct sel'; 'height '; 'const_sel'; 'k l'; 'du max l'; 'b l Rat'; 'rho l'};
    datStruct.p_comment = { 'leg_jnt_type [0; 1]            Actuator selection leg (0 = series elastic; 1 = parallel elastic)'; 
                            'cost_fct_sel [0; 1; 2; 3]      Cost function selector (1 = posActWorkCOT; 2 = posElWorkCOT; 3 = totElLossCOT)';
                            'height       [l_0]             Enforced hopping height'; 
                            'const_sel    [binary flags]    1: GroundClearance 2: TorqueLimits 4: SpeedLimits';
                            'kl           [m_0*g/l_0]       Linear spring stiffness in the prismatic joint'; 
                            'du_max_l     [sqrt(g*l_0)]     Maximal velocity of the leg ';
                            'blRat        [*]               Damping ratio of the spring';
                            'rho_l        [*]               Scaling of the motor size'};
    datStruct.p      = p;
    datStruct.p_sca  = [1; 1; 1.0; 1; 10.0;    0.5;   0.2; 1.0];
    datStruct.p_min  = [0; 1; 1.0; 0;  0.0001; 0.0001;0.0; 0.0];
    datStruct.p_max  = [1; 3; 2.0; 7; 25.0;   10.0;   1.0; 5.0];
    % All Parameters are initially fixed
    datStruct.p_fix  = [1; 1; 1;   1;  1;      1;     1;   1];

    datStruct.u_name = {'F l'};
    datStruct.u_comment = {'Fl'};
    datStruct.u_type = 2; % piecewise linear
    datStruct.u      = u;
    datStruct.u_sca  = 1.0;
    % This limit should never go into effect, since the actuators are
    % limited within the dynamic functions. Yet, it helps stabilize the
    % optimization
    datStruct.u_min  = -20.0;
    datStruct.u_max  = -datStruct.u_min;
    datStruct.u_fix  = 0;

    datStruct.rd_scaStart = 1.0;
    datStruct.rd_scaEnd   = 1.0;
    datStruct.rc_sca      = 1.0;

    datStruct.of_name = 'Energy';
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