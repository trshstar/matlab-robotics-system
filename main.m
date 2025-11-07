% main.m
% Entry point for Phase 1 - Differential Drive Simulation

addpath(genpath(pwd));
params = robot_params();
sensor = sensor_params();
ctrl   = controller_params();

map = zeros(sensor.map.size);
map(40:60,70:72)=1; map(20:25,20:40)=1;
start = [2 2]/sensor.map.resolution;
goal  = [80 80]/sensor.map.resolution;

path = astar_planner(map, start, goal);
traj = trajectory_planner(path, sensor);

pose = [2 2 0];
pose = navigation_loop(pose, traj, ctrl, params);

visualize_map(map, pose, [], sensor); 
