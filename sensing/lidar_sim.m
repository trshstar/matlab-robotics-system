function ranges = lidar_sim(pose, map, sensor)
% Simulated 2-D LiDAR scan using ray-casting
numBeams = sensor.lidar.numBeams;
maxR     = sensor.lidar.maxRange;
step     = sensor.lidar.stepSize;
angles   = linspace(-sensor.lidar.fov/2, sensor.lidar.fov/2, numBeams);

ranges = zeros(1,numBeams);
for i = 1:numBeams
    a = pose(3) + angles(i);
    for r = 0:step:maxR
        x = pose(1) + r*cos(a);
        y = pose(2) + r*sin(a);
        mx = round(x / sensor.map.resolution);
        my = round(y / sensor.map.resolution);
        if mx<=0 || my<=0 || mx>size(map,2) || my>size(map,1)
            break
        end
        if map(my,mx)==1, break, end   % hit obstacle
    end
    ranges(i)=r;
end
end
