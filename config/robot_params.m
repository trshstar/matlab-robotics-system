% robot_params.m
% Configuration for differential drive robot

function params = robot_params()
    params.wheelRadius = 0.1;   % [m]
    params.trackWidth  = 0.5;   % [m]
    params.sampleTime  = 0.05;  % [s]
    params.simTime     = 10;    % [s]
    
    % Example wheel speeds [rad/s]
    params.wL = 5;              % Left wheel angular velocity
    params.wR = 6;              % Right wheel angular velocity
end
