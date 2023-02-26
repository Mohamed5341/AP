%% Longiudinal equations

% No approximation
disp("/********************************************/")
disp("|       Longitudinal No approximation        |")
disp("/********************************************/")

A_long=[XU                  ,XW                  ,XQ-W0                    ,-g*cos(theta0)            ;...
        ZU/(1-ZWD)          ,ZW/(1-ZWD)          ,(ZQ+U0)/(1-ZWD)          ,-g*sin(theta0)/(1-ZWD)    ;...
        MU+(MWD*ZU)/(1-ZWD) ,MW+(MWD*ZW)/(1-ZWD) ,MQ+(MWD*(ZQ+U0))/(1-ZWD) ,-MWD*g*sin(theta0)/(1-ZWD);...
        0                   ,0                   ,1                        ,0                         ];
B_long=[XDE                 ,XDTH                  ;...
        ZDE/(1-ZWD)         ,ZDTH/(1-ZWD)          ;...
        MDE+MWD*ZDE/(1-ZWD) , MDTH+MWD*ZDTH/(1-ZWD);...
        0                   ,0                     ];
C_long=[1 0 0 0 ;...
        0 1 0 0 ;...
        0 0 1 0 ;...
        0 0 0 1 ];
D_long=[0 0 ;...
        0 0 ;...
        0 0 ;...
        0 0 ];
TF_long=tf(ss(A_long,B_long,C_long,D_long));


% Transfer functions
U_DE_TF=TF_long(1,1)
U_DTH_TF=TF_long(1,2)
W_DE_TF=TF_long(2,1)
W_DTH_TF=TF_long(2,2)
Q_DE_TF=TF_long(3,1)
Q_DTH_TF=TF_long(3,2)
theta_DE_TF=TF_long(4,1)
theta_DTH_TF=TF_long(4,2)

% Short period
disp("/********************************************/")
disp("|         Longitudinal Short period          |")
disp("/********************************************/")

A_long_SP=[ZW/(1-ZWD)        ,(ZQ+U0)/(1-ZWD)        ;...
           MW+ZW*MWD/(1-ZWD) ,MQ+MWD*(ZQ+U0)/(1-ZWD) ];
B_long_SP=[ZDE                 ,ZDTH                 ;...
           MDE+MWD*ZDE/(1-ZWD) ,MDTH+MWD*ZDTH/(1-ZWD)];
C_long_SP=[1 0;0 1];
D_long_SP=[0 0;0 0];

TF_SP=tf(ss(A_long_SP,B_long_SP,C_long_SP,D_long_SP));

W_DE_TF_SP=TF_SP(1,1)
W_DTH_TF_SP=TF_SP(1,2)
Q_DE_TF_SP=TF_SP(2,1)
Q_DTH_TF_SP=TF_SP(2,2)


% long period
disp("/********************************************/")
disp("|          Longitudinal Long period          |")
disp("/********************************************/")

A_long_LP=[ XU         ,-g*cos(theta0)        ;...
          -ZU/(ZQ+U0) , g*sin(theta0)/(ZQ+U0)];
B_long_LP=[ XDE         , XDTH;...
          -ZDE/(ZQ+U0) ,-ZDTH/(ZQ+U0)];
C_long_LP=[1 0;0 1];
D_long_LP=[0 0;0 0];

TF_LP=tf(ss(A_long_LP,B_long_LP,C_long_LP,D_long_LP));

U_DE_TF_LP=TF_LP(1,1)
U_DTH_TF_LP=TF_LP(1,2)
theta_DE_TF_LP=TF_LP(2,1)
theta_DTH_TF_LP=TF_LP(2,2)

%% Lateral Equations
disp("/********************************************/")
disp("|          Lateral No approximation          |")
disp("/********************************************/")

% Lateral no approximation
I_n=1-(Ixz^2)/Ixx/Izz;
LV_d =(LV+Ixy*NV/Ixx)/I_n;    NV_d =(NV+Ixy*LV/Izz)/I_n;
LB_d =(LB+Ixy*NB/Ixx)/I_n;    NB_d =(NB+Ixy*LB/Izz)/I_n;
LP_d =(LP+Ixy*NP/Ixx)/I_n;    NP_d =(NP+Ixy*LP/Izz)/I_n;
LR_d =(LR+Ixy*NR/Ixx)/I_n;    NR_d =(NR+Ixy*LR/Izz)/I_n;
LDA_d=(LDA+Ixy*NDA/Ixx)/I_n;  NDA_d=(NDA+Ixy*LDA/Izz)/I_n;
LDR_d=(LDR+Ixy*NDA/Ixx)/I_n;  NDR_d=(NDR+Ixy*LDA/Izz)/I_n; 
A_lat=[YV   ,YP+W0 ,YR-U0       ,g*cos(theta0),0;...
       LV_d ,LP_d  ,LR_d        ,0            ,0;...
       NV_d ,NP_d  ,NR_d        ,0            ,0;...
       0    ,1     ,tan(theta0) ,0            ,0;...
       0    ,0     ,sec(theta0) ,0            ,0];
B_lat=[YDA   ,YDR  ;...
       LDA_d ,LDR_d;...
       NDA_d ,NDR_d;...
       0     ,0    ;...
       0     ,0    ];
C_lat=[1 ,0 ,0 ,0 ,0;...
       0 ,1 ,0 ,0 ,0;...
       0 ,0 ,1 ,0 ,0;...
       0 ,0 ,0 ,1 ,0;...
       0 ,0 ,0 ,0 ,1];
D_lat=[0 ,0;...
       0 ,0;...
       0 ,0;...
       0 ,0;... 
       0 ,0];

TF_lat=tf(ss(A_lat,B_lat,C_lat,D_lat));

V_DA_TF=TF_lat(1,1)
V_DR_TF=TF_lat(1,2)
P_DA_TF=TF_lat(2,1)
P_DR_TF=TF_lat(2,2)
R_DA_TF=TF_lat(3,1)
R_DR_TF=TF_lat(3,2)
phi_DA_TF=TF_lat(4,1)
phi_DR_TF=TF_lat(4,1) 
psi_DA_TF=TF_lat(5,1)
psi_DR_TF=TF_lat(5,2)


% Lateral 3DOF dutch roll
disp("/********************************************/")
disp("|          Lateral 3DOF Dutch Roll           |")
disp("/********************************************/")

A_DR3=[YV   ,YP/U0 ,YR/U0-1;...
       LV_d ,LP_d  ,LR_d   ;...
       NV_d ,NP_d  ,NR_d   ];
B_DR3=[YDA/U0 ,YDR/U0;...
       LDA_d  ,LDR_d ;...
       NDA_d  ,NDR_d ];
C_DR3=[1 0 0;0 1 0;0 0 1];
D_DR3=[0,0;0,0;0,0];
TF_DR3=tf(ss(A_DR3,B_DR3,C_DR3,D_DR3));

V_DA_TF_DR3=    TF_DR3(1,1)
V_DR_TF_DR3=    TF_DR3(1,2)
P_DA_TF_DR3=    TF_DR3(2,1)
P_DR_TF_DR3=    TF_DR3(2,2)
R_DA_TF_DR3=-   TF_DR3(3,1)
R_DR_TF_DR3=    TF_DR3(3,2)


% Lateral 3DOF spiral mode
disp("/********************************************/")
disp("|          Lateral 3DOF spiral mode          |")
disp("/********************************************/")

A_SP3=[LP_d ,LR_d ,0;
       NP_d ,NR_d ,0;
       1    ,0    ,0];
B_SP3=[LDA_d ,LDR_d;
       NDA_d ,NDR_d;
       0     ,0    ];
C_SP3=[1 0 0;0 1 0;0 0 1];
D_SP3=[0,0;0,0;0,0];
TF_SP3=tf(ss(A_SP3,B_SP3,C_SP3,D_SP3));

P_DA_TF_SP3=TF_SP3(1,1)
P_DR_TF_SP3=TF_SP3(1,2)
R_DA_TF_SP3=TF_SP3(2,1)
R_DR_TF_SP3=TF_SP3(2,2)
phi_DA_TF_SP3=TF_SP3(3,1)
phi_DR_TF_SP3=TF_SP3(3,2)

% Lateral 2DOF dutch roll
disp("/********************************************/")
disp("|          Lateral 2DOF Dutch roll          |")
disp("/********************************************/")

A_DR2=[YV   ,YR/U0-1;...
       NV_d ,NR_d   ];
B_DR2=[YDA   ,YDR  ;...
       NDA_d ,NDR_d];
C_DR2=[1 0;0 1];
D_DR2=[0,0;0,0];
TF_DR2=tf(ss(A_DR2,B_DR2,C_DR2,D_DR2));

V_DA_TF_DR2=TF_DR2(1,1)
V_DR_TF_DR2=TF_DR2(1,2)
R_DA_TF_DR2=TF_DR2(2,1)
R_DR_TF_DR2=TF_DR2(2,2)


% Lateral 2DOF spiral mode
disp("/********************************************/")
disp("|          Lateral 2DOF spiral mode          |")
disp("/********************************************/")

A_R2=[LP_d ,0;...
      1    ,0];
B_R2=[LDA_d ,LDR_d;...
      0     ,0];
C_R2=[1,0;0,1];
D_R2=[0,0;0,0];
TF_R2=tf(ss(A_R2,B_R2,C_R2,D_R2));

P_DA_TF_R2=TF_R2(1,1)
P_DR_TF_R2=TF_R2(1,2)
phi_DA_TF_R2=TF_R2(2,1)
phi_DR_TF_R2=TF_R2(2,2)


% Lateral 1DOF roll mode
disp("/********************************************/")
disp("|            Lateral 3DOF roll mode          |")
disp("/********************************************/")

A_R1=LP_d;
B_R1=LDA_d;
C_R1=1;
D_R1=0;
TF_R1=tf(ss(A_R1,B_R1,C_R1,D_R1));

P_DA_TF_R1=TF_R1
