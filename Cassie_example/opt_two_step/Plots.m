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
        v = ones(size(t)).*GaitLibrary{i}.velocity(1);
        if j <= 3
            plot3(axs(j), t, GaitLibrary{i}.opt.states{1}.x(j, :), v);
        else
            plot3(axs(j), t, rad2deg(GaitLibrary{i}.opt.states{1}.x(j, :)), v);
        end
    end
end
