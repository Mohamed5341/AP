clc
clearvars
close all

%% Read Derivatives

Aircraft = "boeing747";
FC = 2;

run("ReadDerivatives");
%ReadDerivatives("boeing747", 2);

%% define roblem

% Calculate variables
N = (tFinal-t0)/dt + 1;

% Solving equation
t = t0:dt:tFinal;

X = zeros(length(X0), N);
X(:,1) = X0;



%% Solving nonlinear

% for i = 2:N
%     % previous state
%     Xprev = X(:, i-1);
%     
%     % delta states
%     DU = Xprev(1) - X0(1);
%     DV = Xprev(2) - X0(2);
%     DW = Xprev(3) - X0(3);
%     DP = Xprev(4) - X0(4);
%     DQ = Xprev(5) - X0(5);
%     DR = Xprev(6) - X0(6);
%     WD = (Xprev(3) - Wprev)/dt;
%     DWD = WD - WD0;
%     Wprev = Xprev(3);
% 
%     F0 = m*g*[            sin(X0(8));...
%               -cos(X0(8))*sin(X0(7));...
%               -cos(X0(8))*cos(X0(7))];
%     M0 = [0; 0; 0];
% 
%     DX = m*(XU*DU+XW*DW+XDE*dC(3)+XDTH*dC(4));
%     DY = m*(YV*DV+YP*DP+YR*DR+YDA*dC(1)+YDR*dC(2));
%     DZ = m*(ZU*DU+ZW*DW+ZWD*DWD+ZQ*DQ+ZDE*dC(3)+ZDTH*dC(4));
%     DL = Ixx*(LV*DV+LP*DP+LR*DR+LDA*dC(1)+LDR*dC(2));
%     DM = Iyy*(MU*DU+MW*DW+MWD*DWD+MQ*DQ+MDE*dC(3)+MDTH*dC(4));
%     DN = Izz*(NV*DV+NP*DP+NR*DR+NDA*dC(1)+NDR*dC(2));
% 
%     F = F0 + [DX; DY; DZ];
%     M = M0 + [DL; DM; DN];
% 
%     % Solve using RK4
%     X(:, i) = RK4Step(X(:, i-1), F, M, m, I, dt);
% end

%% Linearized equations
run('LinearizedEquations')

%% Plot graphs
%NLSimPlotGraphs(t, X);
%run('LinearizedEquationsPlot')

%% Export design transfer functions
servo = tf(10,[1 10]);
integrator = tf(1,[1 0]);
differentiator = tf([1 0],1);
engine_timelag = tf(0.1 , [1 0.1]);