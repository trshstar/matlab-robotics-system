function visualize_map(map, pose, ranges, sensor)
% Plot occupancy map + robot + LiDAR beams
clf; hold on; axis equal; colormap(gray);
imagesc(flipud(map)); xlabel('X cells'); ylabel('Y cells');

% Robot marker
plot(pose(1)/sensor.map.resolution, ...
     size(map,1)-pose(2)/sensor.map.resolution, ...
     'ro','MarkerFaceColor','r');

% LiDAR beams
angles = linspace(-sensor.lidar.fov/2, sensor.lidar.fov/2, sensor.lidar.numBeams);
for i=1:length(ranges)
    a = pose(3)+angles(i);
    xE = pose(1)+ranges(i)*cos(a);
    yE = pose(2)+ranges(i)*sin(a);
    plot([pose(1) xE]/sensor.map.resolution, ...
         [size(map,1)-pose(2) size(map,1)-yE]/sensor.map.resolution, 'b');
end
title('LiDAR Mapping Simulation');
drawnow;
end
