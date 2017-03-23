%*************************************************************************%
% @BeginVerbatim
% Title: RunEmergencyUnit
% Description: Run the Emergency Unit Genetic Algorithm. Hehehehehehehehe..
% Version: v00.01
% Author: Kurl Angelo D. Palaganas
% Yr&Sec: 3-3
% @EndVerbatim
%*************************************************************************%

% Initialize City Matrix
cityMatrix = ...
    [5, 2, 4, 8, 9, 0, 3, 3, 8, 7;
     5, 5, 3, 4, 4, 6, 4, 1, 9, 1;
     4, 1, 2, 1, 3, 8, 7, 8, 9, 1;
     1, 7, 1, 6, 9, 3, 1, 9, 6, 9;
     4, 7, 4, 9, 9, 8, 6, 5, 4, 2;
     7, 5, 8, 2, 5, 2, 3, 9, 8, 2;
     1, 4, 0, 6, 8, 4, 0, 1, 2, 1;
     1, 5, 2, 1, 2, 8, 3, 3, 6, 2;
     4, 5, 9, 6, 3, 9, 7, 6, 5, 10;
     0, 6, 2, 8, 7, 1, 2, 1, 5, 3];
 
 % Initialize populatin
 population = Population(10, cityMatrix);
 
 % Initialize generation
 generation = 1;
 
 % xAxis and yAxis
 xAxis = [];
 yAxis = [];
 
 % Start 
 while generation ~= 1000
    % Print Coordinate
    fprintf('Coordinate : [%d, %d]\n', population.getFittest()...
                   .getX(), population.getFittest().getY());
    % Print fitness of the Coordinate
    fprintf('Fitness : %d\n', population.getFittest()...
        .getFitness());
    % Print response time
    fprintf('Response Time : %d\n', 1.7 + (3.4 * population.getFittest()...
        .getFitness())); 
    % Print the current generation
    fprintf('Generation : %d\n', generation);
    
    % Evolve the population
    population = population.setCoordinates(population.evolvePopulation(population));
    
    % Population xAxis and yAxis
    xAxis = [xAxis, generation];
    yAxis = [yAxis, population.getFittest().getFitness()];
    
    % Increment the generation
    generation = generation + 1;
 end
 
hold on
plot(xAxis, yAxis); % plot the original points
title('Emergency Unit Shit');
xlabel('Generations');
ylabel('Fitness');
hold off