function path = astar_planner(map, start, goal)
% Compute shortest path from start → goal on occupancy map
% map: binary grid (0=free, 1=obstacle)
% start, goal: [x y] in grid coordinates

start = round(start); goal = round(goal);
[rows,cols] = size(map);
closed = false(rows,cols);
cameFrom = zeros(rows,cols,2);
g = inf(rows,cols); g(start(2),start(1)) = 0;
f = inf(rows,cols); f(start(2),start(1)) = norm(goal-start);

moves = [0 1;1 0;0 -1;-1 0; 1 1;1 -1;-1 1;-1 -1];
while true
    [~,idx] = min(f(:)); [y,x] = ind2sub(size(f),idx);
    if isinf(f(y,x)), path=[]; return; end
    if all([x y]==goal), break; end
    closed(y,x)=true; f(y,x)=inf;
    for m=1:size(moves,1)
        nx=x+moves(m,1); ny=y+moves(m,2);
        if nx<1||ny<1||nx>cols||ny>rows, continue; end
        if map(ny,nx)==1||closed(ny,nx), continue; end
        tentative = g(y,x)+norm(moves(m,:));
        if tentative<g(ny,nx)
            cameFrom(ny,nx,:)=[x y];
            g(ny,nx)=tentative;
            f(ny,nx)=tentative+norm(goal-[nx ny]);
        end
    end
end

% reconstruct
path=[goal];
while ~all(path(1,:)==start)
    p=path(1,:);
    prev=squeeze(cameFrom(p(2),p(1),:))';
    path=[prev; path];
end
end
