function sensor = sensor_params()
% sensor_params.m — LiDAR / IMU / Camera configuration

% LiDAR
sensor.lidar.numBeams   = 30;
sensor.lidar.maxRange   = 5.0;        % meters
sensor.lidar.fov        = pi;         % 180°
sensor.lidar.stepSize   = 0.05;       % ray-cast increment (m)

% Map
sensor.map.size        = [100 100];   % cells
sensor.map.resolution  = 0.1;         % 10 cm per cell

end
