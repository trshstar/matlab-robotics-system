% kinematics_model.m
% Compute new pose from current pose and wheel speeds

function poseNext = kinematics_model(pose, wL, wR, params)
% pose = [x, y, theta]

r = params.wheelRadius;
L = params.trackWidth;
dt = params.sampleTime;

% Velocity in body frame
v = (r/2) * (wR + wL);
omega = (r/L) * (wR - wL);

% Update pose
x_next = pose(1) + v * cos(pose(3)) * dt;
y_next = pose(2) + v * sin(pose(3)) * dt;
theta_next = pose(3) + omega * dt;

poseNext = [x_next, y_next, theta_next];
end
