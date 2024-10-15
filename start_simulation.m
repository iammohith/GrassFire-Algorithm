function start_simulation(m, n, startCell, goalCell, obstacles)
    % First output for the grid display
    display_grid(m, n, startCell, goalCell, obstacles);
    title('Problem Statement');
    pause(5); % Pause for 5 seconds to view the grid

    % Second output for the distances from Grassfire Algorithm
    display_distances(m, n, startCell, goalCell, obstacles);
    title('Distances from Grassfire Algorithm');
    hold on; % Keep the figure from changing
    pause(5); % Pause for 5 seconds to view the distances

    % Third output for the shortest path simulation 
    shortest_path(m, n, startCell, goalCell, obstacles);
    title('Shortest Path Simulation');
end