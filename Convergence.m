function [] = Convergence(L, M0, P0)
% Plot convergence by error norm to number of elements.

h_c = 0.2;
n_low = 20; n_high = 200;
y = cell(1,n_high - n_low + 1); x = cell(1, n_high - n_low + 1);
yd = cell(1, n_high - n_low + 1);
e_y = zeros(1, n_high - n_low - 1); e_theta = zeros(1, n_high - n_low - 1);
n_e = zeros(1, n_high - n_low - 1);

[x{1},y{1},yd{1},EI] = Galerkin(h_c,L,M0,P0,19,"Partial");
for i = n_low:n_high
    % Calculate Galerkin approximation by iterative number of elements.
    [x{i},y{i},yd{i},EI] = Galerkin(h_c,L,M0,P0,i,"Partial");
    
    % Calculate log(e).
    e_y(i - 19) = log10(sqrt(sum((interp1(transpose(round(x{i},10)), y{i}, transpose(round(x{i - 1},10))) - y{i - 1}).^2)));
    %e_theta(i - 19) = log10(round(sqrt(sum((interp1(transpose(round(x{i},10)), yd{i}, transpose(round(x{i - 1},10))) - yd{i - 1}).^2)),6));
    e_theta(i - 19) = round(sqrt(sum((interp1(transpose(round(x{i},10)), yd{i}, transpose(round(x{i - 1},10))) - yd{i - 1}).^2)),5);
    n_e(i - 19) = i;
end

%plot deflection and angle convergence.
tcl = tiledlayout(1,2);
nexttile
plot(n_e, e_y,'b', 'lineWidth', 0.6);
title ('Deflection'); xlabel('number of elements'); ylabel('log(e)');
nexttile
plot(n_e, e_theta,'b', 'lineWidth', 0.6);
title ('Slope'); xlabel('number of elements'); ylabel('e');
title(tcl,'Error - Number of elements (h/l = 0.2)');
end

