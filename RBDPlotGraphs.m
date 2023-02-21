function RBDPlotGraphs(t, X, t1, X1)
%RBDPlotGraphs This function plots output from RBD equations solution
%Call    :RBDPlotGraphs(t, X)
%Inputs
%   t   : vector of time values
%   X   : 12 states calculated at each time instance
%   t1  : vector of time values for second output to plot with first value
%   X1  : output from simulink to plot with calculated values

% TODO: You need to check if input is a valid inputs

switch nargin
    case 2
        % Plot all results
        figure;
        hold on
        plot(t, X(1,:));
        plot(t, X(2,:));
        plot(t, X(3,:));
        grid on
        title("Velocity")
        xlabel("t (sec)")
        ylabel("V (m/s)")
        legend("U", "V", "W")
        hold off


        figure;
        hold on
        plot(t, X(4,:));
        plot(t, X(5,:));
        plot(t, X(6,:));
        grid on
        title("Angular Velocity")
        xlabel("t (sec)")
        ylabel("\omega (rad/s)")
        legend("p", "q", "r")
        hold off


        figure;
        hold on
        plot(t, wrapToPi(X(7,:)));
        plot(t, wrapToPi(X(8,:)));
        plot(t, wrapToPi(X(9,:)));
        grid on
        title("Euler Angles")
        xlabel("t (sec)")
        ylabel("Angles (rad)")
        legend("\phi", "\theta", "\psi")
        hold off

        figure;
        hold on
        plot(t, X(10,:));
        plot(t, X(11,:));
        plot(t, X(12,:));
        grid on
        title("Position")
        xlabel("t (sec)")
        ylabel("Position (rad)")
        legend("x", "y", "z")
        hold off
    case 4
        % plot and compare results
        % *************************Velocity****************************
        figure
        hold on
        plot(t, X(1,:));
        plot(t1, X1(:,1));
        grid on
        title("Velocity")
        xlabel("t (sec)")
        ylabel("u (m/s)")
        legend("Matlab Code","Simulink 6DOF")
        hold off
        
        figure
        hold on
        plot(t, X(2,:));
        plot(t1, X1(:,2));
        grid on
        title("Velocity")
        xlabel("t (sec)")
        ylabel("v (m/s)")
        legend("Matlab Code","Simulink 6DOF")
        hold off
        
        figure
        hold on
        plot(t, X(3,:));
        plot(t1, X1(:,3));
        grid on
        title("Velocity")
        xlabel("t (sec)")
        ylabel("w (m/s)")
        legend("Matlab Code","Simulink 6DOF")
        hold off
        
        % *********************Angular Velocity**************************
        figure
        hold on
        plot(t, X(4,:));
        plot(t1, X1(:,4));
        grid on
        title("Angular Velocity")
        xlabel("t (sec)")
        ylabel("p (rad/s)")
        legend("Matlab Code","Simulink 6DOF")
        hold off
        
        figure
        hold on
        plot(t, X(5,:));
        plot(t1, X1(:,5));
        grid on
        title("Angular Velocity")
        xlabel("t (sec)")
        ylabel("q (rad/s)")
        legend("Matlab Code","Simulink 6DOF")
        hold off
        
        figure
        hold on
        plot(t, X(6,:));
        plot(t1, X1(:,6));
        grid on
        title("Angular Velocity")
        xlabel("t (sec)")
        ylabel("r (m/s)")
        legend("Matlab Code","Simulink 6DOF")
        hold off
        
        
        % *********************Euler Angles**************************
        figure
        hold on
        plot(t, wrapToPi(X(7,:)));
        plot(t1, wrapToPi(X1(:,7)));
        grid on
        title("Euler Angles")
        xlabel("t (sec)")
        ylabel("\phi (rad)")
        legend("Matlab Code","Simulink 6DOF")
        hold off
        
        figure
        hold on
        plot(t, wrapToPi(X(8,:)));
        plot(t1, wrapToPi(X1(:,8)));
        grid on
        title("Euler Angles")
        xlabel("t (sec)")
        ylabel("\theta (rad)")
        legend("Matlab Code","Simulink 6DOF")
        hold off
        
        figure
        hold on
        plot(t, wrapToPi(X(9,:)));
        plot(t1, wrapToPi(X1(:,9)));
        grid on
        title("Euler Angles")
        xlabel("t (sec)")
        ylabel("\psi (rad)")
        legend("Matlab Code","Simulink 6DOF")
        hold off
        
        
        % *************************Position******************************
        figure
        hold on
        plot(t, X(10,:));
        plot(t1, X1(:,10));
        grid on
        title("Position")
        xlabel("t (sec)")
        ylabel("x (m)")
        legend("Matlab Code","Simulink 6DOF")
        hold off
        
        figure
        hold on
        plot(t, X(11,:));
        plot(t1, X1(:,11));
        grid on
        title("Position")
        xlabel("t (sec)")
        ylabel("y (m)")
        legend("Matlab Code","Simulink 6DOF")
        hold off
        
        figure
        hold on
        plot(t, X(12,:));
        plot(t1, X1(:,12));
        grid on
        title("position")
        xlabel("t (sec)")
        ylabel("z (m)")
        legend("Matlab Code","Simulink 6DOF")
        hold off
    otherwise
        
end

end

