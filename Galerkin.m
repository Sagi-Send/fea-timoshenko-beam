function [x,cy,cd,EI] = Galerkin(h_c,L,M0,P0,n, integration)
% Returns approxiamte solution by Galerkin by N local quadrupal elements.

% Assemble local systems of equations for all elements.
[Ke, EI, he] = Assemble_element_equations(h_c, L, n, integration);

% Assemble global system of equations.
[K, F] = Assemble_global_equations(Ke, n,P0,M0, EI);

% Calculate c vector.
c = K\F;

% Assemble approxiamte solution.
xe = 0;
x = []*(n + 1);
for i = 1:n + 1
    x(i) = xe;
    xe = xe + he;
end
cy = c(2:2:end); cd = c(1:2:end);

end
