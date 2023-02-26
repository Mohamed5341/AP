function [F, M] = AirframeModel(dC, X)
%AirframeModel This function gets input control actuators and outputs
%              forces and moments
%Call    : [F, M] = AirframeModel(dC)
%Inputs
% dC     : actuators control action delta(Aliron, Rudder, Elevator, Thrust)
% X      : current states of system
%Outputs
% F      : Forces affecting model (without gravity)
% M      : Moments affecting model


% store W from previous call
persistent Wprev;
if(isempty(Wprev))
    % First time to call function
    Wprev = X(3);
end
WD0 = 0;

% Read Derivatives from workspace
dt = evalin("base", "dt");
m = evalin("base", "m");
g = evalin("base", "g");
Ixx = evalin("base", "Ixx");
Iyy = evalin("base", "Iyy");
Izz = evalin("base", "Izz");
I = evalin("base", "I");
X0 = evalin("base", "X0");
LongDrv = evalin("base", "LongDrv");
LatDrv = evalin("base", "LatDrv");


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

% delta states
DU = X(1) - X0(1);
DV = X(2) - X0(2);
DW = X(3) - X0(3);
DP = X(4) - X0(4);
DQ = X(5) - X0(5);
DR = X(6) - X0(6);
WD = (X(3) - Wprev)/dt;
DWD = WD - WD0;

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

% Store W value
Wprev = X(3);
end
