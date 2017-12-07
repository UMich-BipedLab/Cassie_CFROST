function [conGUI] = load_animation(robot, t, q)

    export_path = fullfile(pwd,'gen','anim');
    if ~exist(export_path,'dir')
        mkdir(export_path);
    end
    addpath(export_path);
    options = {'UseExported', true, 'ExportPath', export_path, 'SkipExporting', true};

    f = figure(1000); clf;
    cassie_disp = frost.Animator.Display(f, robot, options{:});
    
    % Add Pelvis Sphere
    pelvis = robot.Links(getLinkIndices(robot,'pelvis'));
    torso = frost.Animator.LinkSphere(cassie_disp.axs, robot, pelvis, 'torso', options{:});
    torso.radius = 0.1;
    cassie_disp.addItem(torso);

    % Add Right Toe
     right_toe_anim_frame = CoordinateFrame(...
         'Name','RightToeAnim',...
         'Reference',robot.ContactPoints.RightToeBottom,...
         'Offset',[0,0,0],...
         'R',Angles.Rz(pi/2));
    top_offset = [0,0,0.05];
    wf = 0.05; % toe width
    lt = 0.075; % length to front
    lh = 0.075; % length to back
    bottom_offset = [lt,-wf/2,0;
                     lt, wf/2,0;
                    -lh, wf/2,0;
                    -lh,-wf/2,0];
    right_toe = frost.Animator.Pyramid(cassie_disp.axs, robot, right_toe_anim_frame, top_offset, bottom_offset, 'RightToe', options{:});
    cassie_disp.addItem(right_toe);
    
    
    % Add Left Toe
    left_toe_anim_frame = CoordinateFrame(...
         'Name','LeftToeAnim',...
         'Reference',robot.ContactPoints.LeftToeBottom,...
         'Offset',[0,0,0],...
         'R',Angles.Rz(pi/2));
    top_offset = [0,0,0.05];
    wf = 0.05; % toe width
    lt = 0.075; % length to front
    lh = 0.075; % length to back
    bottom_offset = [lt,-wf/2,0;
                     lt, wf/2,0;
                    -lh, wf/2,0;
                    -lh,-wf/2,0];
    left_toe = frost.Animator.Pyramid(cassie_disp.axs, robot, left_toe_anim_frame, top_offset, bottom_offset, 'LeftToe', options{:});
    cassie_disp.addItem(left_toe);

    % Display
    anim = frost.Animator.AbstractAnimator(cassie_disp, t, q);
    anim.isLooping = true;
    anim.speed = 0.5;
    anim.pov = frost.Animator.AnimatorPointOfView.Free;
    anim.Animate(true);
    conGUI = frost.Animator.AnimatorControls();
    conGUI.anim = anim;
    
end