clc
clearvars
close all

% Problem
Fdot = @(t, y) [sin(t) + cos(y(1)) + sin(y(2)); cos(t) + sin(y(2))];
t0 = 0;
y0 = [-1; 1];
tFinal =  20;
N = 100;
dt = (tFinal-t0)/N;

% TODO: Solve using Euler method

% TODO: Solve using Euler improved

% TODO: Solve using RK4
RK4Solution = zeros(3, N);

RK4Solution(:, 1) = [t0; y0];

for i = 2:N
    [RK4Solution(1, i), RK4Solution(2:3, i)] = RK4Step(Fdot, RK4Solution(1, i-1), RK4Solution(2:end, i-1), dt);
end

% TODO: Solve using RKF

% TODO: Solve using ode45
[ODE45Solutionx, ODE45Solutiony] = ode45(Fdot, linspace(t0, tFinal, N), y0);


% TODO: Plot all results
figure;
hold on
plot(RK4Solution(1,:), RK4Solution(2,:));
plot(ODE45Solutionx, ODE45Solutiony(:, 1));
grid on
xlabel("t")
ylabel("y_1")
legend("RK4", "ODE45")
hold off


figure;
hold on
plot(RK4Solution(1,:), RK4Solution(3,:));
plot(ODE45Solutionx, ODE45Solutiony(:, 2));
grid on
xlabel("t")
ylabel("y_2")
legend("RK4", "ODE45")
hold off