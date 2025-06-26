clear all, close all; clc;

L = 1; M0 = -1; P0 = 0;

% Plot all integral deviations for 1-6 n values.
n = 200;
Dev_Galerkin(n,L, M0, P0);
% Free_end_def(n,L, M0, P0);
% Convergence(L, M0, P0);