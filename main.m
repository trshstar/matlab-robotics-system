% main.m
% Entry point for Phase 1 - Differential Drive Simulation

addpath(genpath(pwd));

% Load configs
params  = robot_params();
sensor  = sensor_params();

% Initial setup
map  = zeros(sensor.map.size);
map(40:60,70:72)=1;  % sample obstacles
map(20:25,20:40)=1;

pose = [2 2 0];
t = 0:params.sampleTime:params.simTime;

for i=1:length(t)
    % --- Motion ---
    pose = kinematics_model(pose, params.wL, params.wR, params);

    % --- Sensing ---
    ranges = lidar_sim(pose, map, sensor);

    % --- Mapping ---
    map = occupancy_map(map, pose, ranges, sensor);

    % --- Visualization ---
    visualize_map(map, pose, ranges, sensor);
end
