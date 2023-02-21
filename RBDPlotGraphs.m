function RBDPlotGraphs(t, X)
%RBDPlotGraphs This function plots output from RBD equations solution
%Call    :RBDPlotGraphs(t, X)
%Inputs
%   t   : vector of time values
%   X   : 12 states calculated at each time instance

% TODO: You need to check if input is a valid inputs

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

end

