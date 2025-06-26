function [Ke,EI, he] = Assemble_element_equations(h_c, L, n, integration)
% Returns cell arrays of local Ke matrix, element length and EI.

ks = 0.85;
he = L/n;
EI = ((L*h_c)^3) / 12; area = L*h_c;
G = 1/(2*(1+ 0.3));
% Define Ke.
A = 1/he .* [1, -1 ; -1, 1]; C = 0.5 .* [-1, 1 ; -1, 1];
B1 = he/4 .* ones(2); B2 = he/6 .* [2, 1 ; 1, 2];
if integration == "Partial"
    B = B1;
else
    B = B2;
end
alpha = ks*G*area/EI;
Ke = [A, zeros(2); zeros(2), zeros(2)] + alpha .* [B , -C ; -transpose(C), A];

% Switch order of D.O.Fs.
Ke(:,[2, 3]) = Ke(:,[3, 2]); % columns
Ke([2, 3],:) = Ke([3, 2],:); % rows

end

