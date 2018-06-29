close all

N = size(GaitLibrary{1}.opt.states{1}.x, 1);

axs = [];
for i = 1:N
    f = figure(i);
    axs = [axs, axes(f)];
    hold(axs(i), 'on');
end

for i = 1:length(GaitLibrary)
    for j = 1:N
        t = linspace(0, 0.4, 21);
        if j <= 3
            plot(axs(j), t, GaitLibrary{i}.opt.states{1}.x(j, :));
        else
            plot(axs(j), t, rad2deg(GaitLibrary{i}.opt.states{1}.x(j, :)));
        end
    end
end
