function [M,S] = Generate_forces(x,yd, EI)
% Generate moment and shear diagrams by derivatives of approximate y
% solution.
ydd = gradient(yd,x);
M = round(ydd*EI,5);
S = round(gradient(M, x),5);

S(1) = S(3); S(2) = S(3);
S(end) = S(end-3); S(end - 1) = S(end - 3);
end

