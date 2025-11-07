function pose = navigation_loop(pose, traj, ctrl, params)
for i=1:size(traj,1)
    goal = [traj(i,:) 0];
    while true
        [v,omega] = pid_controller(pose, goal, ctrl);
        v = min(v, ctrl.v_max); omega = min(max(omega,-ctrl.w_max), ctrl.w_max);
        pose = kinematics_model(pose, v - omega*params.trackWidth/2, ...
                                      v + omega*params.trackWidth/2, params);
        dist = norm(goal(1:2)-pose(1:2));
        if dist < 0.05, break; end
    end
end
end
