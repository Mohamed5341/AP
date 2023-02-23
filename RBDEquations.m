function [Xdot] = RBDEquations(F, L, X, Inertia, m)
%RBDEquations This function calculates values of RBD differential equations.
%Call    :[Xdot] = RBDEquations(F, L, X, I, M)
%Inputs
%   F   : Applied forces [Fx, Fy, Fz] in (N)
%   L   : Applied moments [Mx, My, Mz] in (N.m)
%   X   : current value of RBD states [u, v, w, p, q, r, phi, theta, psi, x, y, z]
%                                     [1, 2, 3, 4, 5, 6,  7 ,   8  ,  9 ,10,11,12]
%   I   : Inertia matrix in (Kg.m^2)
%   M   : Mass in (Kg)
%Outputs
%   Xdot: value for RBD differental equations

% TODO: You need to check if input is a valid inputs

g = 9.81;
Xdot = zeros(12, 1);

RotMatrix = [cos(X(8))*cos(X(9)),sin(X(7))*sin(X(8))*cos(X(9))-cos(X(7))*sin(X(9)),cos(X(7))*sin(X(8))*cos(X(9))+sin(X(7))*sin(X(9));
             cos(X(8))*sin(X(9)),sin(X(7))*sin(X(8))*sin(X(9))+cos(X(7))*cos(X(9)),cos(X(7))*sin(X(8))*sin(X(9))-sin(X(7))*cos(X(9));
                  -sin(X(8))    ,                sin(X(7))*cos(X(8))              ,                  cos(X(7))*cos(X(8))             ];

% Velocities
Xdot(1:3) = (F + m*transpose(RotMatrix)*[0;0;g])/m - cross(X(4:6), X(1:3));

% angular velocities 
Xdot(4:6) = inv(Inertia)*(L - cross(X(4:6), Inertia*X(4:6)));

% angles
Xdot(7:9) = [ 1, sin(X(7))*tan(X(8)), cos(X(7))*tan(X(8));
              0,    cos(X(7))       ,     -sin(X(7))     ;
              0, sin(X(7))/cos(X(8)), cos(X(7))/cos(X(8))]*X(4:6);

% position
Xdot(10:12) = RotMatrix*X(1:3);
    
end
