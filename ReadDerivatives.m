% get file name
filename = strcat('.\Derivatives\', Aircraft, '.xlsx');

% check if file exists
if(exist(filename))
    d = xlsread(filename, num2str(FC), "B1:B61");

    dt           = d(1);
    tFinal       = d(2);
    t0           = d(3);
    X0           = d(4:15);
    LongDrv      = d(21:36);
    LatDrv_dash  = d(37:50);
    m            = d(51);
    g            = d(52);
    Ixx          = d(53);
    Iyy          = d(54);
    Izz          = d(55);
    Ixz          = d(56);
    Ixy          = 0;
    Iyz          = 0;
    I = [ Ixx, -Ixy, -Ixz;...
         -Ixy,  Iyy, -Iyz;...
         -Ixz, -Iyz,  Izz];
    dC      = [d(57:59)'*pi/180, d(60)];


    % convert dash derivatives into regular ones
    G = 1/(1-(Ixz^2/(Ixx*Izz)));
    Vto = sqrt(X0(1)^2 + X0(2)^2 + X0(3)^2);

    SolMat = G*[      1, Ixz/Ixx;...
                Ixz/Izz,       1];

    LatDrv = LatDrv_dash;

    LatDrv(3:4)   = inv(SolMat) * LatDrv_dash(3:4)/Vto;    %  LV,  NV
    LatDrv(5:6)   = inv(SolMat) * LatDrv_dash(5:6);        %  LP,  NP
    LatDrv(7:8)   = inv(SolMat) * LatDrv_dash(7:8);        %  LR,  NR
    LatDrv(9:10)  = Vto * LatDrv_dash(9:10);               % YDA, YDR 
    LatDrv(11:12) = inv(SolMat) * LatDrv_dash(11:12);      % LDA, NDA
    LatDrv(13:14) = inv(SolMat) * LatDrv_dash(13:14);      % LDR, NDR

    %% Derivatives

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
    XQ = 0;

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
    LB = LV * Vto;
    NB = NV * Vto;


    % Initial values
    U0 = X0(1);
    V0 = X0(2);
    W0 = X0(3);
    P0 = X0(4);
    Q0 = X0(5);
    R0 = X0(6);
    phi0   = X0(7);
    theta0 = X0(8);
    psi0   = X0(9);
    WD0 = 0;
    Wprev = W0;
    
    
    % I_n=1-(Ixz^2)/Ixx/Izz;
    % LV_d =(LV+Ixy*NV/Ixx)/I_n;    NV_d =(NV+Ixy*LV/Izz)/I_n;
    % LB_d =(LB+Ixy*NB/Ixx)/I_n;    NB_d =(NB+Ixy*LB/Izz)/I_n;
    % LP_d =(LP+Ixy*NP/Ixx)/I_n;    NP_d =(NP+Ixy*LP/Izz)/I_n;
    % LR_d =(LR+Ixy*NR/Ixx)/I_n;    NR_d =(NR+Ixy*LR/Izz)/I_n;
    % LDA_d=(LDA+Ixy*NDA/Ixx)/I_n;  NDA_d=(NDA+Ixy*LDA/Izz)/I_n;
    % LDR_d=(LDR+Ixy*NDA/Ixx)/I_n;  NDR_d=(NDR+Ixy*LDA/Izz)/I_n; 

    LV_d = LatDrv_dash(3)*Vto;
    NV_d = LatDrv_dash(4)*Vto;
    LB_d = LatDrv_dash(3);
    NB_d = LatDrv_dash(4);
    LP_d = LatDrv_dash(5);
    NP_d = LatDrv_dash(6);
    LR_d = LatDrv_dash(7);
    NR_d = LatDrv_dash(8);
    YDA_S= LatDrv_dash(9);
    YDR_S= LatDrv_dash(10);
    LDA_d= LatDrv_dash(11);
    NDA_d= LatDrv_dash(12);
    LDR_d= LatDrv_dash(13);
    NDR_d= LatDrv_dash(14);
    
    
    % initial gravity force
    X0_Y0_Z0= m*g*[ sin(theta0)          ;...
                   -cos(theta0)*sin(phi0);...
                   -cos(theta0)*cos(phi0)];

    % States are (all are delta):
    %     delta  [ u, v, w, p, q, r, w_dot] + delta [ a, r, e, th ]
    Stability_Matrix = [XU , 0  , XW , 0  , 0  , 0  , 0   , 0   , 0   , XDE , XDTH ;...
                        0  , YV , 0  , YP , 0  , YR , 0   , 0   , YDR , 0   , 0    ;...
                        ZU , 0  , ZW , 0  , ZQ , 0  , ZWD , 0   , 0   , ZDE , ZDTH ;...
                        0  , LV , 0  , LP , 0  , LR , 0   , LDA , LDR , 0   , 0    ;...
                        MU , 0  , MW , 0  , MQ , 0  , MWD , 0   , 0   , MDE , MDTH ;...
                        0  , NV , 0  , NP , 0  , NR , 0   , NDA , NDR , 0   , 0    ];

end
