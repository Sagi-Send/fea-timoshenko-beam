function [] = Dev_Galerkin(n, L, M0, P0, Integration)
% Plot deflection,angles and forces diagram for Timoshenko beam
% for different h/l values and in comparison to Euler-Bernoulli deflections.

h_c = [0.01, 0.1, 0.2, 0.5];

y = cell(1,n+1); x = cell(1, n+1);
yd = cell(1, n+1);
M = cell(1, n+1);
S = cell(1, n+1);
y_EB = cell(1, n + 1);

for i = 1:length(h_c)
    % Calculate Galerkin approximation by iterative number of elements.
    [x{i},y{i},yd{i},EI] = Galerkin(h_c(i),L,M0,P0,n, Integration);
    [M{i},S{i}] = Generate_forces(x{i},yd{i},EI);
    y_EB{i} = EB_deflection(x{i}, P0, M0, EI, L);
end

figure(1);
%plot deflections.
tcl = tiledlayout(2,2);
for i=1:length(h_c)
    nexttile
    plot (x{i},y{i} , 'r', 'lineWidth', 0.6);
    hold on;
    plot(x{i}, y_EB{i},'b', 'lineWidth', 0.6);
    title (['h/l = ', num2str(h_c(i), '%.2f')]);
    xlabel('x'); ylabel('U');
end
legend('Timoshenko','Euler-Bernoulli')
title(tcl,'Timoshekno beam h/l comparison - Deflection');

figure(2);
% plot angle diagrams.
tcl = tiledlayout(2,2);
for i=1:length(h_c)
    nexttile
    plot (x{i},yd{i} , 'r');
    title (['h/l = ', num2str(h_c(i), '%.2f')]);
    xlabel('x'); ylabel('theta');
end
title(tcl,'Timoshekno beam h/l comparison - Angles');

figure(3);
%plot Moment diagrams.
tcl = tiledlayout(2,2);
for i=1:length(h_c)
    nexttile
    plot (x{i},M{i} , 'r');
    title (['h/l = ', num2str(h_c(i), '%.2f')]);
    xlabel('x'); ylabel('Moment');
end
title(tcl,'Timoshekno beam h/l comparison - Moments');

figure(4);
%Plot shear diagrams.
tcl = tiledlayout(2,2);
for i=1:length(h_c)
    nexttile
    plot (x{i},S{i} , 'r');
    title (['h/l = ', num2str(h_c(i), '%.2f')]);
    xlabel('x'); ylabel('Shear');
end
title(tcl,'Timoshekno beam h/l comparison - Shear');
