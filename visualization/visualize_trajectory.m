% visualize_trajectory.m
% Animate or plot the robot trajectory

function visualize_trajectory(poses)
    figure('Name','Differential Drive Trajectory');
    plot(poses(:,1), poses(:,2), 'b', 'LineWidth', 2); hold on;
    plot(poses(1,1), poses(1,2), 'go', 'MarkerFaceColor','g');
    plot(poses(end,1), poses(end,2), 'rx', 'MarkerSize',10);
    xlabel('X (m)');
    ylabel('Y (m)');
    title('Differential Drive Path');
    axis equal; grid on;
end
