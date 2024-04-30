// sample.h
#ifndef SAMPLE_H
#define SAMPLE_H

#define EXIT_SUCCESS 0
#define EXIT_ARG_ERROR 1
#define EXIT_FILE_ERROR 2
#define EXIT_MAZE_ERROR 3

typedef struct Coord {
    int x;
    int y;
} Coord;

typedef struct Maze {
    char **map;
    int height;
    int width;
    Coord start;
    Coord end;
} Maze;

void validateMaze(Maze *maze);
void startGame(Maze *maze);
void initializePlayer(Maze *maze, Coord *player);
void playGame(Maze *maze, Coord *player);
void endGame(Maze *maze);

#endif  // SAMPLE_H
