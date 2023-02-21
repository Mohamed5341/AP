clc
clearvars
close all

% Problem
Fdot = @(t, y) [sin(t) + cos(y(1)) + sin(y(2)); cos(t) + sin(y(2))];
t0 = 0;
y0 = [-1; 1];
tFinal =  20;
N = 100;

% Solve using Euler method
[EulerSolutionx, EulerSolutiony] = ODEMethodSolver(Fdot, [t0 tFinal], y0, N, "Euler");


% Solve using Euler improved
[EulerImprovedSolutionx, EulerImprovedSolutiony] = ODEMethodSolver(Fdot, [t0 tFinal], y0, N, "Euler Improved");

% Solve using RK4
[RK4Solutionx, RK4Solutiony] = ODEMethodSolver(Fdot, [t0 tFinal], y0, N, "RK4");

% TODO: Solve using RKF

% Solve using ode45
[ODE45Solutionx, ODE45Solutiony] = ode45(Fdot, linspace(t0, tFinal, N), y0);


% Plot all results
figure;
hold on
plot(EulerSolutionx, EulerSolutiony(1,:));
plot(EulerImprovedSolutionx, EulerImprovedSolutiony(1,:));
plot(RK4Solutionx, RK4Solutiony(1,:));
plot(ODE45Solutionx, ODE45Solutiony(:, 1));
grid on
xlabel("t")
ylabel("y_1")
legend("Euler", "Euler Improved", "RK4", "ODE45")
hold off


figure;
hold on
plot(EulerSolutionx, EulerSolutiony(2,:));
plot(EulerImprovedSolutionx, EulerImprovedSolutiony(2,:));
plot(RK4Solutionx, RK4Solutiony(2,:));
plot(ODE45Solutionx, ODE45Solutiony(:, 2));
grid on
xlabel("t")
ylabel("y_2")
legend("Euler", "Euler Improved", "RK4", "ODE45")
hold off