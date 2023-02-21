function [X, Y] = ODEMethodSolver(Fdot, Xinterval, Y0, N, Method)
%ODEMethodSolver This function solves given ODE using specified method
%Call        :[X, Y] = ODEMethodSolver(Fdot, Xinterval, Y0, N, Method)
%Inputs
%   Fdot     : Function handler of derivative function that wants its integral
%              Inputs to it are X, Y in order where X is function variable and
%              Y is the function itself (implicit function)
%   xInterval: start value and end value of variable x in solution
%   Y0       : Initial value for Y function
%   N        : Number of points required
%   Method   : Used method in solution (available: Euler, Euler Improved,
%              RK4)
%Outputs
%   X    : New value for X variable
%   Y    : New calculated value for function

% TODO: You need to check if input is a valid inputs


% Calculate variables
x0 = Xinterval(1);
xf = Xinterval(2);
dx = (xf-x0)/(N-1);

% Solving equation
X = zeros(1, N);
X(1) = x0;

Y = zeros(length(Y0), N);
Y(:,1) = Y0;

for i = 2:N
    if(Method == "Euler")
        [X(i), Y(:, i)] = EulerStep(Fdot, X(i-1), Y(:, i-1), dx);
    elseif(Method == "Euler Improved")
        [X(i), Y(:, i)] = EulerImprovedStep(Fdot, X(i-1), Y(:, i-1), dx);
    elseif(Method == "RK4")
        [X(i), Y(:, i)] = RK4Step(Fdot, X(i-1), Y(:, i-1), dx);
    end
end

end

