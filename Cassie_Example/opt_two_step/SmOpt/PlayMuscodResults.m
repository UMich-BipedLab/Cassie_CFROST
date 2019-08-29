function PlayPltFile(fileName)
    %% Init:
    % Define a base directory to make this file easily portable to other computers:
    GaitCreationDir = 'C:\GaitCreation\';
    if ~exist(GaitCreationDir,'dir')
        error('PrismaticMonoped:Main:GaitCreationDirectorNotExist', 'The specified GaitCreation-directory was not found on your computer.  Please adjust this path to match the installiation on your computer')
    end
    % Reset the MATLAB search path to its default value:
    path(pathdef);
    % Set the path to include all library functions:
    path(path,[GaitCreationDir,'\Shared\Graphics\Misc;',...
               GaitCreationDir,'\Shared\Graphics\SeriesElasticActuation;',...
               GaitCreationDir,'\Shared\Graphics\DirectDriveHip;',...
               GaitCreationDir,'\Shared\Utilities;',...
               GaitCreationDir,'\Shared\Graphics;',...
               GaitCreationDir,'\Models\Dissertation - PrismaticBiped\Dynamics\Definitions;',...
               GaitCreationDir,'\Models\Dissertation - PrismaticBiped\Graphics;']);

    %% Read file
   [t, y, u, yName, uName] = ReadPLTfile(fileName,25,4);
    
    %% Extract trajectories
    tVec       = [t(1:end-1,1);t(1:end-1,1)+t(end,1)];
    xVec       = [y(1:end-1,1);y(1:end-1,1)+y(end,1)];
    yVec       = [y(1:end-1,3);y(1:end-1,3)];
    phiVec     = [y(1:end-1,5);y(1:end-1,5)];
    alphaLVec  = [y(1:end-1,7);y(1:end-1,11)];
    ualphaLVec = [y(1:end-1,9);y(1:end-1,13)];
    alphaRVec  = [y(1:end-1,11);y(1:end-1,7)];
    ualphaRVec = [y(1:end-1,13);y(1:end-1,9)];
    lLVec      = [y(1:end-1,15);y(1:end-1,19)];
    ulLVec     = [y(1:end-1,17);y(1:end-1,21)];
    lRVec      = [y(1:end-1,19);y(1:end-1,15)];
    ulRVec     = [y(1:end-1,21);y(1:end-1,17)];
    % Resample
    method = 'linear';
    n = 50;      % # of frames per step
    % to create destinct values:
    tOld       = tVec+linspace(0,1e-10,length(tVec))';
    tVec       = linspace(0,2*t(end,1),n);
    tVec       = tVec(1:end-1);
    xVec       = interp1(tOld, xVec,tVec, method);
    yVec       = interp1(tOld, yVec,tVec, method);
    phiVec     = interp1(tOld, phiVec,tVec, method);
    alphaLVec  = interp1(tOld, alphaLVec,tVec, method);
    ualphaLVec = interp1(tOld, ualphaLVec,tVec, method);
    alphaRVec  = interp1(tOld, alphaRVec,tVec, method);
    ualphaRVec = interp1(tOld, ualphaRVec,tVec, method);
    lLVec      = interp1(tOld, lLVec,tVec, method);
    ulLVec     = interp1(tOld, ulLVec,tVec, method);
    lRVec      = interp1(tOld, lRVec,tVec, method);
    ulRVec     = interp1(tOld, ulRVec,tVec, method);
%     % Plot
%     figure(3)
%     clf
%     hold on
%     plot(tVec,xVec,'r');
%     plot(tVec,yVec,'b');
%     plot(tVec,phiVec,'g');
%     plot(tVec,alphaLVec,'y');
%     plot(tVec,ualphaLVec,'y:');
%     plot(tVec,alphaRVec,'c');
%     plot(tVec,ualphaRVec,'c:');
%     plot(tVec,lLVec,'k');
%     plot(tVec,ulLVec,'k:');
%     plot(tVec,lRVec,'m');
%     plot(tVec,ulRVec,'m:');
    %% Animate:
	% Set up the graphical output:
    graph3DOUTPUT = PrismaticBiped3DCLASS(false);
    xOffset = 0; % This shifts the model forward from step to step
    % If desired, every iteration a rendered picture is saved to disc.  This
    % can later be used to create a animation of the monopod.
    % (un)comment the following lines, if you (don't) want to save the
    % individual frames to disc:
    %frameCount = 0; 
    %mkdir MovieFramesPrismaticBipedRunWalk;
    [y, ~, contStateIndices] = ContStateDefinition();
    z = DiscStateDefinition();
    [u, ~, exctStateIndices] = ExctStateDefinition();
    %  For each step
    for i = 1:2 % Movie is composed of 2*2 strides
        for j = 1:n-1
            y(contStateIndices.x) = xVec(j) + xOffset;
            y(contStateIndices.y) = yVec(j);
            y(contStateIndices.phi) = phiVec(j);
            y(contStateIndices.alphaL) = alphaLVec(j);
            y(contStateIndices.alphaR) = alphaRVec(j);
            y(contStateIndices.lL) = lLVec(j);
            y(contStateIndices.lR) = lRVec(j);
            u(exctStateIndices.ualphaL) = ualphaLVec(j); 
            u(exctStateIndices.ualphaR) = ualphaRVec(j); 
            u(exctStateIndices.ulL) = ulLVec(j); 
            u(exctStateIndices.ulR) = ulRVec(j); 
            graph3DOUTPUT.update(y,z,[],u);
            % (un)comment the following line, if you (don't) want to save the
            % individual frames to disc:
           % fig = gcf; print(fig,'-r600','-djpeg',['MovieFramesPrismaticBipedRunWalk/Frame',num2str(frameCount,'%04d.jpg')],'-zbuffer'); frameCount = frameCount + 1;
        end
        % After each step the model is moved forward:
        xOffset = xOffset + xVec(end);
    end     
end