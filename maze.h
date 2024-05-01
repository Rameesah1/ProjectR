#ifndef MAZE_H
#define MAZE_H
#include <stdio.h>

// Define exit codes to handle different scenarios
#define EXIT_SUCCESS 0
#define EXIT_ARG_ERROR 1
#define EXIT_FILE_ERROR 2
#define EXIT_MAZE_ERROR 3

// Struct for coordinate system within the maze
typedef struct Coord {
    int x;
    int y;
} Coord;

// Struct for the maze itself, containing its dimensions, map, and start/end coordinates
typedef struct Maze {
    char **map;
    int height;
    int width;
    Coord start;
    Coord end;
} Maze;

// Function prototypes for operations related to the Maze structure
int read_maze(Maze *maze, FILE *file);
int validateMaze(Maze *maze);
int initializePlayer(Maze *maze, Coord *player);
void freeMaze(Maze *maze);
void startGame(Maze *maze);
void playGame(Maze *maze, Coord *player);
void endGame(Maze *maze);
int move(Maze *maze, Coord *player, char direction);
int has_won(Maze *maze, Coord *player);

#endif

