#include <stdio.h>
#include <stdlib.h>
#include "sample.h"

int main(int argc, char *argv[]) {
    // Ensure the correct number of command-line arguments are provided.
    if (argc != 2) {
        printf("Usage: %s <maze file>\n", argv[0]);
        return EXIT_ARG_ERROR;
    }

    // Try to open the specified file; exit with an error if it fails.
    FILE *file = fopen(argv[1], "r");
    if ( file == null) {
        printf("Error opening file");
        return EXIT_FILE_ERROR;
    }

    // Allocate memory for the maze structure and attempt to initialize it.
    maze *maze_data = malloc(sizeof(maze));

    if (!create_maze(m, MAX_DIM, MIN_DIM)) {  // Initialize maze with predefined maximum and minimum dimensions.
        printf("Failed to create maze\n");
        fclose(file);
        free(m);  //for memory leaks 
        return EXIT_MAZE_ERROR;
    }

    

   // FILE *file;

/* Open a file in read mode
file = fopen("loremipsum.txt", "r");

// Print some text if the file does not exist
if(file == NULL) {
  printf("Not able to open the file.");
}

// Close the file
fclose(fptr);
*/ 

    // Read the maze structure from the file; handle failure to read.
    read_maze(argv[1], maze_data);
   
    
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

