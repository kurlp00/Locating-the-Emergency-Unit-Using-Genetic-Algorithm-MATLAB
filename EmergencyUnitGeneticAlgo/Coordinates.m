classdef Coordinates
    % Coordinates class
    
    properties(Access = private)
        xCoordinate % x Coordinate of the Coordinate
        yCoordinate % y Coordinate of the Coordinate
        cityMatrix  % 10 x 10 matrix of the city
        fitness     % fitness of this coordinate
    end
    
    methods
        function obj = Coordinates(xCoordinate, yCoordinate, cityMatrix)
            % Coordinates class constructor
            obj.xCoordinate = xCoordinate;
            obj.yCoordinate = yCoordinate;
            obj.cityMatrix = cityMatrix;
            obj.fitness = obj.calculateFitness();
        end
        
        function xCoordinate = getX(obj)
            % Get the x-coordinate
            xCoordinate = obj.xCoordinate;
        end
        
        function yCoordinate = getY(obj)
            % Get the y-coordinate
            yCoordinate = obj.yCoordinate;
        end
        
        function cityMatrix = getCityMatrix(obj)
            % Get the city matrix
            cityMatrix = obj.cityMatrix;
        end
        
        function fitness = getFitness(obj)
            % Get the fitness of the coordinate
            fitness = obj.fitness;
        end
        
        function fitness = calculateFitness(obj)
            % Calculate the fitness of the coordinate
            fitness = 0;
            MAX_ROW = 10;
            MAX_COL = 10;
            
            for i = 1 : MAX_ROW
                for j = 1 : MAX_COL
                    fitness = fitness + obj.cityMatrix(i, j)...
                        * (sqrt((i - obj.xCoordinate) ^ 2)...
                        + sqrt((j - obj.yCoordinate) ^ 2));
                end
            end
        end
        
        function retCoordinate = crossOver(obj, partner)
            % Crossover method for the coordinate
            CROSSOVER_RATE = 0.5;
            
            if rand() <= CROSSOVER_RATE; xCoord = obj.xCoordinate; 
            else xCoord = partner.getX();
            end
            
            if rand() <= CROSSOVER_RATE; yCoord = obj.yCoordinate; 
            else yCoord = partner.getY();
            end
            
            retCoordinate = Coordinates(xCoord, yCoord, obj.cityMatrix);
        end
        
        function retCoordinate = mutate(obj)
            % Mutation method for the coordinate
            MUTATION_RATE = 0.015;
            
            if rand() <= MUTATION_RATE; xCoord = Coordinates.randomNumber(); 
            else xCoord = obj.getX();
            end
            
            if rand() <= MUTATION_RATE; yCoord = Coordinates.randomNumber(); 
            else yCoord = obj.getY();
            end
            
            retCoordinate = Coordinates(xCoord, yCoord, obj.cityMatrix);
        end
    end
    
    methods(Static)
        function number = randomNumber()
            %Generate random number
            
            MAX = 10;
            number = randi(MAX);
        end
    end
end

