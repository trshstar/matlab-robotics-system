function traj = trajectory_planner(path, sensor)
if isempty(path), traj=[]; return; end
traj = (path - 1) * sensor.map.resolution; % convert to meters
end
