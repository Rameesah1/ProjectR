#include "maze.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int read_maze(Maze *maze, FILE *file) {
    // Read maze dimensions
    if (fscanf(file, "%d %d", &(maze->height), &(maze->width)) != 2) {
        return EXIT_FILE_ERROR; // Failed to read dimensions
    }
    
    // Allocate memory for maze map
    maze->map = malloc(maze->height * sizeof(char*));
    if (maze->map == NULL) {
        return EXIT_MAZE_ERROR; // Memory allocation error
    }
    for (int i = 0; i < maze->height; i++) {
        maze->map[i] = malloc((maze->width + 1) * sizeof(char));
        if (maze->map[i] == NULL) {
            // Free previously allocated memory
            for (int j = 0; j < i; j++) {
                free(maze->map[j]);
            }
            free(maze->map);
            return EXIT_MAZE_ERROR; // Memory allocation error
        }
    }
    
    // Read maze map
    for (int i = 0; i < maze->height; i++) {
        if (fscanf(file, "%s", maze->map[i]) != 1) {
            // Free previously allocated memory
            for (int j = 0; j < maze->height; j++) {
                free(maze->map[j]);
            }
            free(maze->map);
            return EXIT_FILE_ERROR; // Failed to read maze map
        }
    }
    
    // Read start and end positions (if needed)
    // This depends on your maze file format
    
    return EXIT_SUCCESS;
}

void startGame(Maze *maze) {
    // Game startup logic
    printf("Welcome to the Maze Game!\n");
}

void initializePlayer(Maze *maze, Coord *player) {
    // Set player's start position
    player->x = maze->start.x;
    player->y = maze->start.y;
}

int move(Maze *maze, Coord *player, char direction) {
    // Your move function remains unchanged
}

void print_maze(Maze *maze, Coord *player) {
    // Print the maze grid
    for (int i = 0; i < maze->height; i++) {
        for (int j = 0; j < maze->width; j++) {
            if (i == player->x && j == player->y) {
                printf("P"); // Print player's position
            } else {
                printf("%c", maze->map[i][j]);
            }
        }
        printf("\n");
    }
}

int has_won(Maze *maze, Coord *player) {
    // Check if the player has reached the end position
    return (player->x == maze->end.x && player->y == maze->end.y);
}

void playGame(Maze *maze, Coord *player) {
    char input;
    printf("Use W, A, S, D to move. Press M to show the maze. Press Q to quit.\n");
    while (!has_won(maze, player)) {
        printf("Enter your move (WASD): ");
        scanf(" %c", &input);
        input = tolower(input);
        switch (input) {
            case 'w': case 'a': case 's': case 'd':
                if (!move(maze, player, input)) {
                    printf("Invalid move! Try a different direction.\n");
                }
                break;
            case 'm':
                print_maze(maze, player);
                break;
            case 'q':
                printf("Quitting game...\n");
                return; // Exit the game loop
            default:
                printf("Invalid input. Please use W, A, S, D, M, or Q.\n");
        }
    }
    printf("Congratulations, you have solved the maze!\n");
}

void endGame(Maze *maze) {
    // Clean up logic
    printf("Thanks for playing!\n");
}
