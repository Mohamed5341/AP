function NLSimPlotGraphs(t, X)
%NLSimPlotGraphs This function plots outputs from non-linear simulator
%Call    :NLSimPlotGraphs(t, X)
%Inputs
%   t   : vector of time values
%   X   : 12 states calculated at each time instance

% TODO: You need to check if input is a valid inputs

dC = evalin("base", "dC");

% Plot all results
% *************************Position****************************
figure
plot3(X(10,:), X(11,:), X(12,:))
grid on
title(strcat('Trajectory for inputs \delta_{a} = ', num2str(dC(1)*180/pi), ' deg ',...
                                   '\delta_{r} = ', num2str(dC(2)*180/pi), ' deg ',...
                                   '\delta_{e} = ', num2str(dC(3)*180/pi), ' deg ',...
                                   '\delta_{th} = ', num2str(dC(4))))
xlabel("x (ft)")
ylabel("y (ft)")
zlabel("z (ft)")

figure
sgtitle(strcat('States for inputs \delta_{a} = ', num2str(dC(1)*180/pi), ' deg ',...
                                 '\delta_{r} = ', num2str(dC(2)*180/pi), ' deg ',...
                                 '\delta_{e} = ', num2str(dC(3)*180/pi), ' deg ',...
                                 '\delta_{th} = ', num2str(dC(4))))

% *************************Velocity****************************
subplot(4, 3, 1)
plot(t, X(1,:))
grid on
title("u (ft/sec)")
xlabel("time (sec)")


subplot(4, 3, 2)
plot(t, atan2(X(2,:), X(1,:))*180/pi)
grid on
title("\beta (deg/sec)")
xlabel("time (sec)")


subplot(4, 3, 3)
plot(t, atan2(X(3,:), X(1,:))*180/pi)
grid on
title("\alpha (deg/sec)")
xlabel("time (sec)")


% **********************Angular Velocity*************************
subplot(4, 3, 4)
plot(t, X(4,:)*180/pi)
grid on
title("p (deg/sec)")
xlabel("time (sec)")


subplot(4, 3, 5)
plot(t, X(5,:)*180/pi)
grid on
title("q (deg/sec)")
xlabel("time (sec)")


subplot(4, 3, 6)
plot(t, X(6,:)*180/pi)
grid on
title("r (deg/sec)")
xlabel("time (sec)")


% **********************Euler Angles*************************
subplot(4, 3, 7)
plot(t, wrapToPi(X(7,:))*180/pi)
grid on
title("\phi (deg)")
xlabel("time (sec)")


subplot(4, 3, 8)
plot(t, wrapToPi(X(8,:))*180/pi)
grid on
title("\theta (deg)")
xlabel("time (sec)")


subplot(4, 3, 9)
plot(t, wrapToPi(X(9,:))*180/pi)
grid on
title("\psi (deg)")
xlabel("time (sec)")

% **************************Position*****************************
subplot(4, 3, 10)
plot(t, X(10,:))
grid on
title("x (ft)")
xlabel("time (sec)")


subplot(4, 3, 11)
plot(t, X(11,:))
grid on
title("y (ft)")
xlabel("time (sec)")


subplot(4, 3, 12)
plot(t, X(12,:))
grid on
title("z (ft)")
xlabel("time (sec)")


end

