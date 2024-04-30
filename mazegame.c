// mazegame.c
#include "sample.h"
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

void validateMaze(Maze *maze) {
    // Validation logic goes here
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

