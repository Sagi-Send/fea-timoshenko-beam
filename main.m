clear all, close all; clc;

% Define solution paramters
L = 1; M0 = -1; P0 = 0; Integration = "Full";

% Plot all integral deviations for n values.
n = 100;
Dev_Galerkin(n,L, M0, P0, Integration);
Free_end_def(n,L, M0, P0);
Convergence(L, M0, P0);