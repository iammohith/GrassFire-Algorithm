function shortest_path(m, n, startCell, goalCell, obstacles)
    % Display the grid with distances
    display_distances(m, n, startCell, goalCell, obstacles);
    
    % Generate the distance matrix using the Grassfire algorithm
    distances = grassfire_algorithm(m, n, goalCell, obstacles);
    
    % Convert goalCell to row and column indices
    [goalRow, goalCol] = ind2sub([m, n], goalCell);
    
    % Initialize current position at the start cell
    [currentRow, currentCol] = ind2sub([m, n], startCell);
    
    % Hold on to overlay the path on top of the existing grid
    hold on;
    
    % Mark the start cell as a robot shape
    draw_robot(currentCol - 0.5, m - currentRow + 0.5);
    
    % Path tracking
    path = [currentRow, currentCol]; % Initialize path with start cell
    
    % Shortest path logic: follow the neighbor with the smallest distance
    while true
        if currentRow == goalRow && currentCol == goalCol
            break; % Exit if we reach the goal cell
        end
        
        % Directions for moving up, down, left, right
        directions = [0, 1; 0, -1; -1, 0; 1, 0]; 
        
        % Initialize variables to find the next cell
        minDistance = Inf;
        nextCell = [currentRow, currentCol]; % Default to current cell
        
        % Check all 4 adjacent cells
        for i = 1:size(directions, 1)
            newRow = currentRow + directions(i, 1);
            newCol = currentCol + directions(i, 2);
            
            % Check if the new cell is within bounds
            if newRow >= 1 && newRow <= m && newCol >= 1 && newCol <= n
                % Only consider valid cells that are not obstacles (Inf)
                if distances(newRow, newCol) < minDistance
                    minDistance = distances(newRow, newCol);
                    nextCell = [newRow, newCol];
                end
            end
        end
        
        % Move to the next cell with the smallest distance
        currentRow = nextCell(1);
        currentCol = nextCell(2);
        
        % Store the path
        path(end + 1, :) = [currentRow, currentCol];
        
        % Plot the path cell as a robot shape
        draw_robot(currentCol - 0.5, m - currentRow + 0.5);
        
        % Pause to visualize the movement
        pause(0.75); % Adjust pause time as needed for better visibility
    end
    
    % Mark the goal cell in robot shape
    draw_robot(goalCol - 0.5, m - goalRow + 0.5); % Keep goal as a robot shape
    
    % Display the distance value at the goal cell (0 in black)
    text(goalCol - 0.5, m - goalRow + 0.5, '0', ...
        'HorizontalAlignment', 'center', 'Color', 'k', ... % Change to black
        'FontSize', 12, 'FontWeight', 'bold');
    
    % Display values for the path
    for idx = 1:size(path, 1)
        row = path(idx, 1);
        col = path(idx, 2);
        
        % Get the distance value
        distanceValue = distances(row, col);
        
        % Display the distance at the center of each path cell in black
        text(col - 0.5, m - row + 0.5, num2str(distanceValue), ...
            'HorizontalAlignment', 'center', 'Color', 'k', ... % Change to black
            'FontSize', 12, 'FontWeight', 'bold');
    end
    
    hold off; % Release the plot
end