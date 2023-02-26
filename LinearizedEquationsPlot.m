FiguresList = [];

dA = dC(1);
dR = dC(2);
dE = dC(3);
dTH = dC(4);

%% Longiudinal

if(dE ~= 0)
    % elevator input
    FiguresList = [FiguresList figure];
    sgtitle(strcat('Elevator Input \delta_E= ', num2str(rad2deg(dE)),'^o'))
    subplot(2,2,1)   %U_DE
    hold all
    step((U_DE_TF*dE+U0),(-U_DE_TF_LP*dE+U0),tFinal)
    plot(t,X(1,:),'k')
    grid on
    title('u Response')
    legend('Linear','Long Period','Nonlinear')
    ylabel('u')
    hold off  

    subplot(2,2,2)   %W_DE
    hold all
    step((W_DE_TF*dE+W0),(W_DE_TF_SP*dE+W0),tFinal)
    plot(t,X(3,:),'k')
    grid on
    title('w Response')
    legend('Linear','Short Period','Nonlinear')
    ylabel('w')
    hold off  


    subplot(2,2,3)   %Q_DE
    hold all
    step((Q_DE_TF*dE+Q0),(Q_DE_TF_SP*dE+Q0),tFinal)
    plot(t,X(5,:),'k')
    grid on
    title('q Response')
    legend('Linear','Short Period','Nonlinear')
    ylabel('q')
    hold off  


    subplot(2,2,4)   %theta_DE
    hold all
    step((theta_DE_TF*dE+theta0),(-theta_DE_TF_LP*dE+theta0),tFinal)
    plot(t,X(8,:),'k')
    grid on
    title('\theta Response')
    legend('Linear','Long Period','Nonlinear')
    ylabel('\theta')
    hold off  
elseif(dTH ~= 0)
    % Thrust input
    FiguresList = [FiguresList figure];    
    sgtitle(strcat('Thrust Input \delta_t = ' , num2str(dTH), ' lbs'))
    subplot(2,2,1)      %U_DTH
    hold all
    step((U_DTH_TF*dTH+U0),(U_DTH_TF_LP*dTH+U0),tFinal)
    plot(t, X(1,:),'k')
    grid on
    title('u Response')
    legend('Linear','Long Period','Nonlinear')
    ylabel('u')
    hold off

    subplot(2,2,2)      %W_DTH
    hold all
    step((W_DTH_TF*dTH+W0),(W_DTH_TF_SP*dTH+W0),tFinal)
    plot(t, X(3,:),'k')
    grid on
    title('w Response')
    legend('Linear','Short Period','Nonlinear')
    ylabel('w')
    hold off

    subplot(2,2,3)      %Q_DTH
    hold all
    step((Q_DTH_TF*dTH+Q0),(Q_DTH_TF_SP*dTH+Q0),tFinal)
    plot(t, X(5,:),'k')
    grid on
    title('q Response')
    legend('Linear','Short Period','Nonlinear')
    ylabel('q')
    hold off

    subplot(2,2,4)      %theta_DTH
    hold all
    step((theta_DTH_TF*dTH+theta0),(theta_DTH_TF_LP*dTH+theta0),tFinal)
    plot(t, X(8,:),'k')
    grid on
    title('\theta Response')
    legend('Linear','Long Period','Nonlinear')
    ylabel('\theta')
    hold off
end

%% Lateral
if(dA ~= 0)
    % aliron input
    FiguresList = [FiguresList figure];
    sgtitle(strcat(' Aeliron Input \delta_A= ', num2str(rad2deg(dA)), '^o'))
    subplot(2,2,1)        %V_DA
    hold all
    step((V_DA_TF*dA+V0),(V_DA_TF_DR3*dA+V0)*Vto,(V_DA_TF_DR2*dA+V0)*-Vto/5,tFinal)
    plot(t,X(2,:),'k')
    grid on
    title('v Response')
    legend('Linear','Dutch Roll 3DOF','Dutch Roll 2DOF','Nonlinear')
    ylabel('v')
    hold off

    subplot(2,2,2)        %P_DA
    hold all
    step((P_DA_TF*dA+P0),(P_DA_TF_DR3*dA+P0),(P_DA_TF_SP3*dA+P0),(P_DA_TF_R2*dA+P0),(P_DA_TF_R1*dA+P0),tFinal)
    plot(t,X(4,:),'k')
    grid on
    title('p Response')
    legend('Linear','Dutch Roll 3DOF','Spiral 3DOF','Roll 2DOF','Roll 1DOF','Nonlinear')
    ylabel('p')
    hold off

    subplot(2,2,3)        %R_DA
    hold all
    step((R_DA_TF*dA+R0),(R_DA_TF_DR3*dA+R0),(R_DA_TF_SP3*dA+R0),(R_DA_TF_DR2*dA+R0),tFinal)
    plot(t,X(6,:),'k')
    grid on
    title('r Response')
    legend('Linear','Dutch Roll 3DOF','Spiral 3DOF','Dutch Roll 2DOF','Nonlinear')
    ylabel('r')
    hold off

    subplot(2,2,4)        %phi_DA
    hold all
    step((phi_DA_TF*dA+phi0),(phi_DA_TF_SP3*dA+phi0),(phi_DA_TF_R2*dA+phi0),tFinal)
    plot(t,X(7,:),'k')
    grid on
    title('\phi Response')
    legend('Linear','Spiral 3DOF','Roll 2DOF','Nonlinear')
    ylabel('\phi')
    hold off

elseif(dR ~= 0)
    % rudder input
    FiguresList = [FiguresList figure];    
    sgtitle(strcat('Rudder Input \delta_R= ', num2str(rad2deg(dR)), '^o'))
    subplot(2,2,1)         %V_DR
    hold all
    step((V_DR_TF*dR+V0),(V_DR_TF_DR3*dR+V0),(V_DR_TF_DR2*dR+V0),tFinal)
    plot(t,X(2,:),'k')
    grid on
    title('v Response')
    legend('Linear','Dutch Roll 3DOF','Dutch Roll 2DOF','Nonlinear')
    ylabel('v')
    hold off

    subplot(2,2,2)         %P_DR
    hold all
    step((P_DR_TF*dR+P0),(P_DR_TF_DR3*dR+P0),(P_DR_TF_SP3*dR+P0),(P_DR_TF_R2*dR+P0),tFinal)
    plot(t,X(4,:),'k')
    grid on
    title('p Response')
    legend('Linear','Dutch Roll 3DOF','Spiral 3DOF','Roll 2DOF','Nonlinear')
    ylabel('p')
    hold off

    subplot(2,2,3)         %R_DR
    hold all
    step((R_DR_TF*dR+R0),(R_DR_TF_DR3*dR+R0),(R_DR_TF_SP3*dR+R0),(R_DR_TF_DR2*dR+R0),tFinal)
    plot(t,X(6,:),'k')
    grid on
    title('r Response')
    legend('Linear','Dutch Roll 3DOF','Spiral 3DOF','Dutch Roll 2DOF','Nonlinear')
    ylabel('r')
    hold off

    subplot(2,2,4)         %phi_DR
    hold all
    step((phi_DR_TF*dR+phi0),(phi_DR_TF_SP3*dR+phi0),(phi_DR_TF_R2*dR+phi0),tFinal)
    plot(t,X(7,:),'k')
    grid on
    title('\phi Response')
    legend('Linear','Spiral 3DOF','Roll 2DOF','Nonlinear')
    ylabel('\phi')
    hold off
end