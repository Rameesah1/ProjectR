#include <stdio.h>
#include <stdlib.h>

//defines
#define MAX_DIM 100
#define MIN_DIM 5

// defines for the required autograder exit codes
#define EXIT_SUCCESS 0
#define EXIT_ARG_ERROR 1
#define EXIT_FILE_ERROR 2
#define EXIT_MAZE_ERROR 3


// Created a Struct for a Maze game file which includes its layout and dimensions 
typedef struct { 
    int numberRows;  //stores the number of rows in the maze file
    int numberColumns; //stores the number of rows in the maze file
    char maze[100][100]; // 2D array for different characters of a maze ( that represents paths, walls start, and end points)
} mazeGame;

// Created a structure that tracks the player's position in the maze
typedef struct {
    int x_pos;  //represents current horizontal position
    int y_pos;  //represents current vertical position
} playerPosition;

/*Declaring Basic Functions for the game (with no parameters as it is not implementable code yet)*/

// Before starting the game, the maze files must be validated
void validateMaze(){ //no parameters filled in yet 
    // Checks including valid maze dimensions (max 100x100 and min 5x5), ensuring the maze contains only valid characters (inc '#', 'S', 'E' ' '),
    // Confirming there is exactly one start ('S') and one end ('E') character, otherwise the game cannot start.    
}

// Starts the game by loading the maze from a file and initializing the game state.
void startGame(){
    // Sets up initial conditions required to start the game.   
}

// This function is designed to initializes the player's starting position.
void initializePlayer(){
    // Will be used to set the player's initial position (usually at 'S' in the maze)
}

// A function that handles the core gameplay.
void playGame(){
    // Implementation ncludes processing player inputs (WASDM) and updating their movement positions in the new game state.
    // These inputs by by the users would call the potential functions :
    // moveUp() - W
    // moveToLeft() - A
    // moveDown() - S
    // moveToRight() -D
    // displayMap() - M
    // Another function to print out a map and then displayed the current location with an 'X' can be designed here.
    // Checks until the player reaches the exit ('E') and returns 1 or chooses to quit. If so endGame function is triggered. 
}

// Concludes the game session.
void endGame(){
    // This function is called once the game is over, either when the user completes the maze (When user is on E), or terminates the game.
    // Can also display the relevant Win/Lose message to the player.
    // Closes the file
}

//Main function where the first argument argc is the program name and argv[1] is the filename entered by user.
int main(int argc, char *argv[]) {   
     if (argc != 2) {  // Condition to check that if exactly two arguments are not provided by the user, then  
        printf("Usage: maze <filename>\n");  // A message informing user how to use the program. 
        return 1; // An error occured is indicated as no. of arguments entered are incorrect 
    }
    // Implementation will include calling of functions and appropriate return statuses.

   
    return 0;
}