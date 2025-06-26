function [K] = Boundery_conditions(K)
% Returns cell arrays of global Ke after boundery conditions definition.

K(:,1) = 0; K(1,:) = 0;
K(1,1) = 1;
K(:,2) = 0; K(2,:) = 0;
K(2,2) = 1;
end

