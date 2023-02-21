clc
clearvars
close all

% Problem
t0 = 0;
tFinal = 15;
F = [10; 5; 9];
L = [10; 20; 5];
m = 15;
Inertia = [ 1, -2, -1;
           -2,  5, -3;
           -1, -3, 0.1];
N = 10001;
X0 = [10, 2, 0, 2*pi/180, 1*pi/180, 0, 20*pi/180, 15*pi/180, 30*pi/180, 2, 4, 7]';

Fdot = @(t, X) RDBEquations(F, L, X, Inertia, m);

% Solve using RK4
[t, X] = ODEMethodSolver(Fdot, [t0 tFinal], X0, N, "RK4");

% Plot graphs
RBDPlotGraphs(t, X);