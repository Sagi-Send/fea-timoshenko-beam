function [] = Free_end_def(n, L, M0, P0)
% Plot maximum deflection for Timoshenko beam with full and partial
% integration and Euler-Bernoulli beam for different h/l values.

h_c = [0.01, 0.1, 0.2, 0.3, 0.4, 0.5];

y = cell(1,n+1); x = cell(1, n+1);
yd = cell(1, n+1);
y_EB = cell(1, n + 1);

max_def = cell(1,3); 

for i = 1:length(h_c)
    % Calculate Galerkin approximation by iterative number of elements.
    [x{i},y{i},yd{i},EI] = Galerkin(h_c(i),L,M0,P0,n, "Partial");
    max_def{1}(i) = y{i}(end);
    [x{i},y{i},yd{i},EI] = Galerkin(h_c(i),L,M0,P0,n, "Full");
    max_def{2}(i) = y{i}(end);
    y_EB{i} = EB_deflection(x{i}, P0, M0, EI, L);
    max_def{3}(i) = y_EB{i}(end);
end

%plot partial integration approximation.
plot (h_c,max_def{1}, 'r','Marker','*', 'lineWidth', 0.6);
hold on;
plot(h_c, max_def{2},'m','Marker','s', 'lineWidth', 0.6);
hold on;
plot(h_c, max_def{3},'k','Marker','o','lineWidth', 0.6);
xlabel('h/l'); ylabel('U');
legend('Timoshenko- Partial integration','Timoshenko- Full integration', 'Euler-Bernoulli')
title('Max. deflection - h/l');
set(gca, "YScale", "log"); ylim([-5*10^6,100]);
end

