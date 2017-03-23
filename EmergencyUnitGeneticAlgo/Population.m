%*************************************************************************%
% @BeginVerbatim
% Title: Population
% Description: This is the Population class that represents the population
% Version: v00.01
% Author: Kurl Angelo D. Palaganas
% Yr&Sec: 3-3
% @EndVerbatim
%*************************************************************************%

classdef Population
    % Population class
    % Represents the population
    
    properties(Access = private)
        coordinates % Coordinates to populate the population
    end
    
    methods
        function obj = Population(populationSize, matrix)
            % Population class constructor
            % Population the population with random coordinates
            
            obj.coordinates = []; % Initialize population
            MAX_ROW         = 10; % Max Row
            MAX_COL         = 10; % Max Col
            
            % Loop through the population size
            for i = 1 : populationSize
                obj.coordinates = [obj.coordinates, ...
                    Coordinates(randi(MAX_ROW), randi(MAX_COL), matrix)];
            end
        end
        
        
        function coordinates = getCoordinates(obj)
            % Returns the population
            coordinates = obj.coordinates;
        end
        
        function obj = setCoordinates(obj, coordinates)
            % Sets the population
            obj.coordinates = [];
            obj.coordinates = [obj.coordinates, coordinates];
        end
        
        function coordinate = getCoordinate(obj, index)
            % Get a single word in the population
            coordinate = obj.coordinates(index);
        end
       
        function popSize = getSize(obj)
            % Get the size of population
            popSize = numel(obj.coordinates);
        end
        
        function fittest = getFittest(obj)
            % Get the fittest in the population
            population = obj.coordinates;
            fittest    = population(1); % Initial fittest
            
            % Loop through the population
            for i = 1 : obj.getSize()
                % In java code, this uses < but here it uses >
                % I don't fucking understand. Hahaha.
                if fittest.getFitness() > population(i).getFitness()
                    fittest = population(i);
                end
            end
        end
        
        function newPopulation = evolvePopulation(obj, population)
            % Evolve the population
            newPopulation = []; 
            
            % Loop through population
            for i = 1 : obj.getSize()
                % Select parentA and parentB via tournament selection
                parentA = Selection.tournamentSelection(population);
                parentB = Selection.tournamentSelection(population);
                % Create child
                child = parentA.crossOver(parentB).mutate();
                % Add the child to the population
                newPopulation = [newPopulation, child];
            end
        end
    end
    
end

