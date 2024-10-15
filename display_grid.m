function display_grid(m, n, startCell, goalCell, obstacles)
    % Check if startCell, goalCell, or obstacles are out of range
    totalCells = m * n;
    if startCell < 1 || startCell > totalCells
        error('Start cell is out of range.');
    end
    if goalCell < 1 || goalCell > totalCells
        error('Goal cell is out of range.');
    end
    if any(obstacles < 1) || any(obstacles > totalCells)
        error('One or more obstacles are out of range.');
    end

    % Create the grid
    figure;
    hold on;
    axis equal;
    grid on;
    xlim([0 n]);
    ylim([0 m]);
    set(gca, 'XTick', [], 'YTick', []); % Hide axis ticks
    axis off; % Hide the axis
    
    % Draw the cells with default white color
    for row = 1:m
        for col = 1:n
            % Draw the rectangle without displaying the number
            rectangle('Position', [col-1, m-row, 1, 1], 'EdgeColor', 'k', 'FaceColor', 'w');
        end
    end

    % Highlight startCell in green
    [startRow, startCol] = ind2sub([m, n], startCell);
    rectangle('Position', [startCol-1, m-startRow, 1, 1], 'EdgeColor', 'k', 'FaceColor', 'g');

    % Highlight goalCell in red
    [goalRow, goalCol] = ind2sub([m, n], goalCell);
    rectangle('Position', [goalCol-1, m-goalRow, 1, 1], 'EdgeColor', 'k', 'FaceColor', 'r');

    % Highlight obstacle cells in black
    for i = 1:length(obstacles)
        [obsRow, obsCol] = ind2sub([m, n], obstacles(i));
        rectangle('Position', [obsCol-1, m-obsRow, 1, 1], 'EdgeColor', 'k', 'FaceColor', 'k');
    end

    % Draw the robot at the start position
    draw_robot(startCol - 0.5, m - startRow + 0.5); % Adjust the position to center the robot

    hold off;
end