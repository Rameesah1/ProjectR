#include <stdio.h>
#include <stdlib.h>
#include "sample.h"

int main(int argc, char *argv[]) {
    // Check for the correct number of command-line arguments
    if (argc != 2) {
        printf("Usage: %s <maze file>\n", argv[0]);
        return EXIT_ARG_ERROR;
    }

    // Try to open the specified file; exit with an error if it fails
    FILE *file = fopen(argv[1], "r");
    if (file == NULL) {
        printf("Error: file does not exist\n");
        return EXIT_FILE_ERROR;
    }

    // Allocate memory for the maze structure
    Maze *maze = malloc(sizeof(Maze));
    if (maze == NULL) {
        fclose(file);
        printf("Error: Not enough memory\n");
        return EXIT_MAZE_ERROR;
    }

    // Read the maze design from the file
    if (read_maze(maze, file) != 0) {
        fclose(file);
        free(maze);
        printf("Failed to load the maze from the file\n");
        return EXIT_FILE_ERROR;
    }

    fclose(file);

    // Validate the maze after it's loaded
    validateMaze(maze);

    // Initialize the player at the start position
    Coord player;
    initializePlayer(maze, &player);

    // Start game logic
    startGame(maze);

    // Main game loop
    playGame(maze, &player);

    // End game logic
    endGame(maze);

    // Clean up and free allocated memory
    free(maze);

    return EXIT_SUCCESS;
}

