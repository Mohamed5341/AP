function [X, Y] = EulerImprovedStep(Fdot, X0, Y0, dx)
%EulerImprovedStep This function calculates next step for Euler improved algorithm
%Call    :[X, Y] = EulerImprovedStep(Fdot, X0, Y0, dx)
%Inputs
%   Fdot : Function handler of derivative function that wants its integral
%          Inputs to it are X, Y in order where X is function variable and
%          Y is the function itself (implicit function)
%   X0   : Initial value for X variable
%   Y0   : Initial value for Y function
%   dx   : step size of this iteration
%Outputs
%   X    : New value for X variable
%   Y    : New calculated value for function

% TODO: You need to check if input is a valid inputs

% Calculate Ki
K1 = dx * Fdot(X0, Y0);
K2 = dx * Fdot(X0 + dx, Y0 + K1);

% Calculate new values
X = X0 + dx;
Y = Y0 + (K1 + K2)/2;

end

