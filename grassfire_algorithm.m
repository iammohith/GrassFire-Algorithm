function distances = grassfire_algorithm(m, n, goalCell, obstacles)
    % Initialize the distances matrix with Inf
    distances = Inf(m, n);
    
    % Convert goalCell to row and column indices
    [goalRow, goalCol] = ind2sub([m, n], goalCell);
    
    % Set the goal cell distance to 0
    distances(goalRow, goalCol) = 0;
    
    % Mark obstacles in the distances matrix as -1 initially
    for i = 1:length(obstacles)
        [obsRow, obsCol] = ind2sub([m, n], obstacles(i));
        distances(obsRow, obsCol) = -1; % Mark obstacles as -1
    end
    
    % Create a queue (list) and add the goal cell
    queue = [goalRow, goalCol];
    
    % Directions for moving up, down, left, right
    directions = [0, 1; 0, -1; -1, 0; 1, 0]; 
    
    while ~isempty(queue)
        % Get the current cell and remove it from the queue
        current = queue(1, :);
        queue(1, :) = [];
        currRow = current(1);
        currCol = current(2);
        
        % Check all 4 adjacent cells
        for i = 1:size(directions, 1)
            newRow = currRow + directions(i, 1);
            newCol = currCol + directions(i, 2);
            
            % Check if the new cell is within bounds
            if newRow >= 1 && newRow <= m && newCol >= 1 && newCol <= n
                % Check if the new cell is not marked and is not an obstacle
                if distances(newRow, newCol) == -1
                    continue; % Skip obstacles (remain -1)
                end
                
                % Update distance for unmarked cells
                if distances(newRow, newCol) > distances(currRow, currCol) + 1
                    distances(newRow, newCol) = distances(currRow, currCol) + 1; % Update distance
                    queue(end + 1, :) = [newRow, newCol]; % Add to the queue
                end
            end
        end
    end
    
    % After everything, convert -1 back to Inf for output
    distances(distances == -1) = Inf;
end