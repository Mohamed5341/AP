% Get required transfer functions for design process

% Servo Transfer Function
servo = tf(10,[1 10]);
integrator = tf(1,[1 0]);
differentiator = tf([1 0],1);
engine_timelag = tf(0.1 , [1 0.1]);

%% Pitch controller 
% input  : elevator
% output : theta

ol_theta_tf = -servo*theta_DE_TF;
ol_u_dth_tf = servo*engine_timelag*U_DTH_TF;