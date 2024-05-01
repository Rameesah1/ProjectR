//main.c
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include "maze.h"

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("Usage: %s <maze file>\n", argv[0]);
        return EXIT_ARG_ERROR;
    }

    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        printf("Error: file does not exist\n");
        return EXIT_FILE_ERROR;
    }

    Maze *maze = malloc(sizeof(Maze));
    
    if (maze == NULL) {
        fclose(file);
        printf("Error: Not enough memory\n");
        return EXIT_MAZE_ERROR;
    }

    if (read_maze(maze, file) != 0) {
        fclose(file);
        free(maze);
        printf("Failed to load the maze from the file\n");
        return EXIT_FILE_ERROR;
    }

    fclose(file);

    validateMaze(maze); // Validates the maze after it's loaded
    Coord player;
    initializePlayer(maze, &player); // Initialize the player at the start position
    startGame(maze); // Any initial game setup can be done here

    playGame(maze, &player); // Main game loop should be handled here

    endGame(maze); // Clean up and final messages

    

    free(maze);
    return EXIT_SUCCESS;
}



