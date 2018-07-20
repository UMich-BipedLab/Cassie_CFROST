function [conGUI] = load_animation(robot, gait, terrain, varargin)

      
    ip = inputParser;
    ip.addParameter('UseExported',true,@(x) isequal(x,true) || isequal(x,false));
    ip.addParameter('ExportPath','',@(x)ischar(x));
    ip.addParameter('SkipExporting',false,@(x) isequal(x,true) || isequal(x,false));
    
    ip.parse(varargin{:});
    
    opts = ip.Results;
    if isempty(opts.ExportPath)
        root_path = get_root_path();
        export_path = fullfile(root_path,'gen','anim');
        opts.ExportPath = export_path;
    else
        export_path = opts.ExportPath;
    end
    if ~exist(export_path,'dir')
        mkdir(export_path);
    end
    addpath(export_path);
    
    cont_domain_idx = find(arrayfun(@(x)~isempty(x.tspan),gait));
    t = [];
    q = [];
    
    for j=cont_domain_idx.'
        t = [t,gait(j).tspan];         %#ok<*AGROW>
        q = [q,gait(j).states.x];
    end
    
    
    f = figure(1000); clf;
    cassie_disp = frost.Animator.Display(f, robot, opts);
    
    % Add Pelvis Sphere
    pelvis = robot.Links(getLinkIndices(robot,'pelvis'));
    torso = frost.Animator.LinkSphere(cassie_disp.axs, robot, pelvis, 'torso', opts);
    torso.radius = 0.1;
    cassie_disp.addItem(torso);

    % Add Right Toe
     right_toe_anim_frame = CoordinateFrame(...
         'Name','RightToeAnim',...
         'Reference',robot.ContactPoints.RightToeBottom,...
         'Offset',[0,0,0],...
         'R',[0,0,pi/2]);
    top_offset = [0,0,0.05];
    wf = 0.05; % toe width
    lt = 0.075; % length to front
    lh = 0.075; % length to back
    bottom_offset = [lt,-wf/2,0;
                     lt, wf/2,0;
                    -lh, wf/2,0;
                    -lh,-wf/2,0];
    right_toe = frost.Animator.Pyramid(cassie_disp.axs, robot, right_toe_anim_frame, top_offset, bottom_offset, 'RightToe', opts);
    cassie_disp.addItem(right_toe);
    
    
    % Add Left Toe
    left_toe_anim_frame = CoordinateFrame(...
         'Name','LeftToeAnim',...
         'Reference',robot.ContactPoints.LeftToeBottom,...
         'Offset',[0,0,0],...
         'R',[0,0,pi/2]);
    top_offset = [0,0,0.05];
    wf = 0.05; % toe width
    lt = 0.075; % length to front
    lh = 0.075; % length to back
    bottom_offset = [lt,-wf/2,0;
                     lt, wf/2,0;
                    -lh, wf/2,0;
                    -lh,-wf/2,0];
    left_toe = frost.Animator.Pyramid(cassie_disp.axs, robot, left_toe_anim_frame, top_offset, bottom_offset, 'LeftToe', opts);
    cassie_disp.addItem(left_toe);

    % Display
    if isempty(terrain)
        [terrain.Tx, terrain.Ty] = meshgrid(-10:1:10, -10:1:10);
        terrain.Tz = 0.*terrain.Tx;
    end
    anim = frost.Animator.AbstractAnimator(cassie_disp, t, q, terrain);
    anim.isLooping = true;
    anim.speed = 1;
    anim.pov = frost.Animator.AnimatorPointOfView.Free;
    anim.Animate(true);
    conGUI = frost.Animator.AnimatorControls();
    conGUI.anim = anim;
    
end