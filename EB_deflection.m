function [y] = EB_deflection(x, P0, M0, EI, L)
%Calculate array of beam deflection by Euler-Bernouli. 

y = (-P0 .* x.^2 .* (3*L - x)) ./ (6*EI) + (M0 .* x.^2) ./ (2*EI);
end

