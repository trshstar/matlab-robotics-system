% main.m
% Entry point for Phase 1 - Differential Drive Simulation

addpath(genpath(pwd));  % Add all folders to MATLAB path

params = robot_params();  % Load config
pose = [0 0 0];           % Initial [x y theta]
t = 0:params.sampleTime:params.simTime;

poses = zeros(length(t),3);
poses(1,:) = pose;

for i = 2:length(t)
    pose = kinematics_model(pose, params.wL, params.wR, params);
    poses(i,:) = pose;
end

visualize_trajectory(poses);
