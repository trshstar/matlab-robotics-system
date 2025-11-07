function [v, omega] = pid_controller(pose, goal, ctrl)
% Compute velocity commands to drive toward goal pose
dx = goal(1) - pose(1);
dy = goal(2) - pose(2);
dist = hypot(dx, dy);
targetTheta = atan2(dy, dx);
angleErr = wrapToPi(targetTheta - pose(3));

v = ctrl.kp_lin * dist;
omega = ctrl.kp_ang * angleErr;
end
