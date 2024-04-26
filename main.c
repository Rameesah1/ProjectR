#include "maze.h"

int main(int argc, char *argv[]) {
    // Ensure the correct number of command-line arguments are provided.
    if (argc != 2) {
        printf("Usage: %s <maze file>\n", argv[0]);
        return EXIT_ARG_ERROR;
    }

    // Try to open the specified file; exit with an error if it fails.
    FILE *file = fopen(argv[1], "r");
    if (!file) {
        perror("Error opening file");
        return EXIT_FILE_ERROR;
    }

    // Allocate memory for the maze structure and attempt to initialize it.
    maze *m = malloc(sizeof(maze));
    if (!create_maze(m, MAX_DIM, MIN_DIM)) {  // Initialize maze with predefined maximum and minimum dimensions.
        printf("Failed to create maze\n");
        fclose(file);
        free(m);
        return EXIT_MAZE_ERROR;
    }

    // Read the maze structure from the file; handle failure to read.
   
    
    // Close the file as it is no longer needed after loading the maze.

    // Initialize the player's starting position as defined in the maze structure.
    coord player = {m->start.x, m->start.y};

    // Game loop: continue asking for prompts  until the player wins.
   

    // Congratulate the player for solving the maze.
    printf("Congratulations, you solved the maze!\n");
    free_maze(m);  // Clean up dynamically allocated memory for the maze.
    free(m);       // Free the memory allocated for the maze structure.

    return EXIT_SUCCESS;  // Return success upon the completion of the game.
}

