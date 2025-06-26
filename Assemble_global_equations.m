function [K,F] = Assemble_global_equations(Ke,n, P0, M0, EI)
% Returns global K, F matrices.

K=zeros(2*n+2,2*n+2); % global stiffness matrix
F=zeros(2*n+2,1); % global forces vector
for indx=0:n-1
 for i=1:4
    for j=1:4
        K(2*indx+i,2*indx+j)=K(2*indx+i,2*indx+j)+Ke(i, j);
    end
 end
end
F(end - 1) = M0/EI; F(end) = -P0/EI;
K = Boundery_conditions(K);
end

