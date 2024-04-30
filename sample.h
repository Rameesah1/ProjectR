#ifndef MAZE_H
#define MAZE_H

#define MAX_DIM 100
#define MIN_DIM 5

#define EXIT_SUCCESS 0
#define EXIT_ARG_ERROR 1
#define EXIT_FILE_ERROR 2
#define EXIT_MAZE_ERROR 3

typedef struct __Maze
{
    char **map;
    int height;
    int width;
    coord start;
    coord end;
} maze;

typedef struct __Coord
{
    int x;
    int y;
} coord;

void validateMaze(void);

void startGame(void);

void initializePlayer(void);

void playGame(void);

void endGame(void);

#endif // MAZE_H
