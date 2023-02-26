clc
clearvars
close all
clear AirframeModel

%% Read Derivatives
ReadDerivatives("boeing747");

%% define roblem

% Calculate variables
N = (tFinal-t0)/dt + 1;

% Solving equation
t = t0:dt:tFinal;

X = zeros(length(X0), N);
X(:,1) = X0;

%% Solving

% Longitudinal derivatives
XU   = LongDrv(1);
ZU   = LongDrv(2);
MU   = LongDrv(3);
XW   = LongDrv(4);
ZW   = LongDrv(5);
MW   = LongDrv(6);
ZWD  = LongDrv(7);
ZQ   = LongDrv(8);
MWD  = LongDrv(9);
MQ   = LongDrv(10);
XDE  = LongDrv(11);
ZDE  = LongDrv(12);
MDE  = LongDrv(13);
XDTH = LongDrv(14);
ZDTH = LongDrv(15);
MDTH = LongDrv(16);


% Lateral Derivatives
YP  = 0;
YR  = 0;
YV  = LatDrv(1);
YB  = LatDrv(2);
LV  = LatDrv(3);
NV  = LatDrv(4);
LP  = LatDrv(5);
NP  = LatDrv(6);
LR  = LatDrv(7);
NR  = LatDrv(8);
YDA = LatDrv(9);
YDR = LatDrv(10);
LDA = LatDrv(11);
NDA = LatDrv(12);
LDR = LatDrv(13);
NDR = LatDrv(14);

% Initial values
U0 = X0(1);
V0 = X0(2);
W0 = X0(3);
P0 = X0(4);
Q0 = X0(5);
R0 = X0(6);
WD0 = 0;
Wprev = W0;

for i = 2:N
    % previous state
    Xprev = X(:, i-1);
    
    % delta states
    DU = Xprev(1) - X0(1);
    DV = Xprev(2) - X0(2);
    DW = Xprev(3) - X0(3);
    DP = Xprev(4) - X0(4);
    DQ = Xprev(5) - X0(5);
    DR = Xprev(6) - X0(6);
    WD = (Xprev(3) - Wprev)/dt;
    DWD = WD - WD0;
    Wprev = Xprev(3);

    F0 = m*g*[            sin(X0(8));...
              -cos(X0(8))*sin(X0(7));...
              -cos(X0(8))*cos(X0(7))];
    M0 = [0; 0; 0];

    DX = m*(XU*DU+XW*DW+XDE*dC(3)+XDTH*dC(4));
    DY = m*(YV*DV+YP*DP+YR*DR+YDA*dC(1)+YDR*dC(2));
    DZ = m*(ZU*DU+ZW*DW+ZWD*DWD+ZQ*DQ+ZDE*dC(3)+ZDTH*dC(4));
    DL = Ixx*(LV*DV+LP*DP+LR*DR+LDA*dC(1)+LDR*dC(2));
    DM = Iyy*(MU*DU+MW*DW+MWD*DWD+MQ*DQ+MDE*dC(3)+MDTH*dC(4));
    DN = Izz*(NV*DV+NP*DP+NR*DR+NDA*dC(1)+NDR*dC(2));

    F = F0 + [DX; DY; DZ];
    M = M0 + [DL; DM; DN];

    % Solve using RK4
    X(:, i) = RK4Step(X(:, i-1), F, M, m, I, dt);
end

%% Plot graphs
NLSimPlotGraphs(t, X);