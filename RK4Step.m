function [X] = RK4Step(X0, F, M, m, I, dt)
%RK4Step This function calculates next step for runge kutta 4 algorithm
%Call    :[X] = RK4Step(Fdot, X0, F, M, m, I, dt)
%Inputs
%   X0   : Initial value for states variable
%   F    : Forces vector
%   M    : Moments vector
%   m    : mass
%   I    : Inertia matrix
%   dt   : time step
%Outputs
%   X    : New value for X variable

% TODO: You need to check if input is a valid inputs

% Calculate Ki
K1 = dt * RBDEquations(F, M, X0, I, m);
K2 = dt * RBDEquations(F, M, X0 + 0.5*K1, I, m);
K3 = dt * RBDEquations(F, M, X0 + 0.5*K2, I, m);
K4 = dt * RBDEquations(F, M, X0 + K3, I, m);

% Calculate new values
X = X0 + (K1 + 2*K2 + 2*K3 + K4)/6;

end

