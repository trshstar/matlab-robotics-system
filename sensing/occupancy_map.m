function map = occupancy_map(map, pose, ranges, sensor)
% Update occupancy grid based on LiDAR hits
angles = linspace(-sensor.lidar.fov/2, sensor.lidar.fov/2, sensor.lidar.numBeams);

for i = 1:length(ranges)
    r = ranges(i);
    if r<=0 || isnan(r), continue, end
    a = pose(3) + angles(i);
    xE = pose(1) + r*cos(a);
    yE = pose(2) + r*sin(a);
    mxE = round(xE / sensor.map.resolution);
    myE = round(yE / sensor.map.resolution);
    if mxE>0 && myE>0 && mxE<=size(map,2) && myE<=size(map,1)
        map(myE,mxE)=1;  % mark occupied
    end
end
end
