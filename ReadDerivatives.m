function ReadDerivatives(Aircraft)
%ReadDerivatives This function reads derivatives from excel file and put
%                these variables into workspace, all units are according
%                excel sheet.
%Call        : ReadDerivatives(Aircraft)
%Inputs
% Aircraft   : name for aircraft to read its derivatives
%Outputs
%            : It does not output variables directly, but instead it puts
%              variables into workspace like: 
%                              - t0       : initial time for simulation
%                              - tFinal   : final time for simulation
%                              - dt       : time step
%                              - X0       : Initial States
%                              - LongDrv  : longitudinal derivatives
%                                           (according to excel file)
%                              - LatDrv   : lateral derivatives
%                                           (according to excel file)
%                              - m        : mass
%                              - I        : Inertia Matrix
%                              - dC       : delta of control inputs (delta
%                                           aliron, delta rudder, delta
%                                           elvator and delta thrust)



filename = strcat('.\Derivatives\', Aircraft, '.xlsx');

% check if file exists
if(exist(filename))
    d = xlsread(filename, "5", "B1:B61");
    
    dt      = d(1);
    tFinal  = d(2);
    t0      = d(3);
    X0      = d(4:15);
    LongDrv = d(21:36);
    LatDrv  = d(37:50);
    m       = d(51);
    g       = d(52);
    Ixx     = d(53);
    Iyy     = d(54);
    Izz     = d(55);
    Ixz     = d(56);
    Ixy     = 0;
    Iyz     = 0;
    I = [ Ixx, -Ixy, -Ixz;...
         -Ixy,  Iyy, -Iyz;...
         -Ixz, -Iyz,  Izz];
    dC      = [d(57:59)'*pi/180, d(60)];


    % convert dash derivatives into regular ones
    G = 1/(1-(Ixz^2/(Ixx*Izz)));
    Vto = sqrt(X0(1)^2 + X0(2)^2 + X0(3)^2);

    SolMat = G*[      1, Ixz/Ixx;...
                Ixz/Izz,       1];
    
    LatDrv(3:4)   = inv(SolMat) * LatDrv(3:4)/Vto;    %  LV,  NV
    LatDrv(5:6)   = inv(SolMat) * LatDrv(5:6);        %  LP,  NP
    LatDrv(7:8)   = inv(SolMat) * LatDrv(7:8);        %  LR,  NR
    LatDrv(9:10)  = Vto * LatDrv(9:10);               % YDA, YDR 
    LatDrv(11:12) = inv(SolMat) * LatDrv(11:12);      % LDA, NDA
    LatDrv(13:14) = inv(SolMat) * LatDrv(13:14);      % LDR, NDR

    % ouput all required data to workspace
    assignin("base", "t0", t0)
    assignin("base", "dt", dt)
    assignin("base", "tFinal", tFinal)
    
    assignin("base", "X0", X0)
    
    assignin("base", "LongDrv", LongDrv)
    
    assignin("base", "LatDrv", LatDrv)
    
    assignin("base", "m", m)
    assignin("base", "g", g)
    
    assignin("base", "Ixx", Ixx);
    assignin("base", "Iyy", Iyy);
    assignin("base", "Izz", Izz);
    assignin("base", "I", I);
    
    assignin("base", "dC", dC)
end

end

