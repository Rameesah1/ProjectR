#!/bin/bash

# removed read permissions from a maze file to test for bad permissions
chmod -r data/bad_perms.txt 

#Complile the skeleton code
gcc maze.c -o maze

echo -e "Argument tests"

# Testing no file argument entered
echo -n "Testing no arguments - "
./maze > tmp
if grep -q "Usage: maze <filename>" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing excess file arguments entered 
echo -n "Testing two arguments -"
./maze a b > tmp
if grep -q "Usage: studentData <filename>" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -e "\n~~ Successful File Handling Tests~~"

# Testing if a valid standard maze loads
echo -n "Testing a standard maze- "
./maze data/16x8_maze.txt > tmp
if grep -q "Maze file loaded successfully" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

#Testing if a very large maze (within the valid range) loads successfully
 echo -n "Testing loading a very large maze - "
./maze data/large_maze.txt > tmp
if grep -q "Maze loaded successfully" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

#Testing if a very small maze (within the valid range) loads successfully
 echo -n "Testing loading a very small maze - "
./maze data/5x5_standard_maze.txt > tmp
if grep -q "Maze loaded successfully" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -e "\n~~ Unsuccessful File Handling Tests~~"

#Testing if invalid large maze loads 
 echo -n "Testing loading large maze beyond game limits - "
./maze data/too_big_maze.txt > tmp
if grep -q "Error : maze too big." tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

#Testing if invalid small maze loads 
 echo -n "Testing loading small maze under game limits - "
./maze data/narrow_maze.txt > tmp
if grep -q "Error : maze too small." tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing File Handling of an invalid maze file format
echo -n "Testing an invalid file type - "
timeout 0.2s ./maze data/invalidfiletype.pdf > tmp
if grep -q "Error : Wrong file format" tmp;
then
    echo "PASS"
else 
    echo "FAIL"
fi

# Testing a maze file with bad permissions
echo -n "Testing bad permissions - "
timeout 0.2s ./maze data/bad_perms.txt > tmp
if grep -q "Error: Bad filename" tmp; 
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing for a non existent file in the repository
echo -n "Testing the file exists -"
./maze non_existent_file.txt > tmp
if grep -q "Error: File not found." tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing an empty file
if [ ! -s /workspaces/ProjectR/data/emptyfile.txt ]; then
echo "The maze cannot load as the file 'emptyfile.txt' is empty."
fi

# Testing for missing data 

# Testing for missing Start sign in a maze file
echo -n "Testing bad data (Start sign missing) - "
timeout 0.2s ./maze data/no_start_maze.txt > tmp
if grep -q "Error: File does not have expected format" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing for missing End sign in a maze file
echo -n "Testing bad data (End sign missing) - "
timeout 0.2s ./maze data/no_exit_maze.txt > tmp
if grep -q "Error: File does not have expected format" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing for multiple Start signs in a maze file
echo -n "More than one 'S' sign in file - "
timeout 0.2s ./maze data/excess_S_maze.txt > tmp
if grep -q "Error: File does not have correct format" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

#Testing for multiple Exit signs in a maze file
echo -n "More than one 'E' sign in file - "
timeout 0.2s ./maze data/excess_E_maze.txt > tmp
if grep -q "Error: File does not have correct format" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing for incorrect characters in a maze file
echo -n "Incorrect characters in the maze - "
timeout 0.2s ./maze data/incorrect_characters_maze.txt > tmp
if grep -q "Error: Maze file does not have correct format" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing if the height of the maze file is above the maximum range
echo -n "Testing bad data ( Exceeding Height range ) - "
timeout 0.2s ./maze data/exceeding_height_maze.txt > tmp
if grep -q "Error: File does not have the expected format" tmp;
then 
    echo "PASS"
else
    echo "FAIL"
fi

# Testing if the width of the file is above the maximum range
echo -n "Testing bad data ( Exceeding Width range ) - "
timeout 0.2s ./maze data/exceeding_width_maze.txt > tmp
if grep -q "Error: File does not have the expected format" tmp;
then 
    echo "PASS"
else
    echo "FAIL"
fi

# Testing if the height of the maze data is below the minimum range
echo -n "Testing bad data ( Below Height range ) - "
timeout 0.2s ./maze data/below_minHeightmaze.txt > tmp
if grep -q "Error: File does not have the expected format" tmp;
then 
    echo "PASS"
else
    echo "FAIL"
fi

# Testing if the width of the maze data is below the mimimum range
echo -n "Testing bad data ( Below width range ) - "
timeout 0.2s ./maze data/below_minWidthmaze.txt > tmp
if grep -q "Error: File does not have the expected format" tmp;
then 
    echo "PASS"
else
    echo "FAIL"
fi

# Testing if the maze data has irregular height
echo -n "Testing Bad Data ( Irregular height ) - "
timeout 0.2s ./maze data/height_irregular_maze.txt > tmp
if grep -q "Error: File does not have the expected format" tmp;
then 
    echo "PASS"
else
    echo "FAIL"
fi

# Testing if the maze data has irregular width
echo -n "Testing Bad Data ( Irregular width ) - "
timeout 0.2s ./maze data/width_irregular_maze.txt > tmp
if grep -q "Error: File does not have the expected format" tmp;
then 
    echo "PASS"
else
    echo "FAIL"
fi

# Testing if the maze data file has a rectangular shape
echo -n "Testing Bad Data ( Non-Rectangular maze ) - "
timeout 0.2s ./maze data/non_rectangular_maze.txt > tmp
if grep -q "Error: Maze data is not rectangular" tmp;
then 
    echo "PASS"
else
    echo "FAIL"
fi

echo -e "\n~~ Testing User Inputs~~"

# Testing when a user enters nothing as an input
echo -n "Testing no input scenario - "
echo "" | timeout 0.2s ./maze data/5x5_standard_maze.txt > tmp
if grep -q "Error: Invalid input." tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing when user enters valid inputs
echo -n "Testing valid user inputs characters - "
timeout 0.2s ./maze inputs/valid_user_inputs.in > tmp
if grep -q "Success: Valid charcters entered." tmp;
then
    echo "PASS"
else 
    echo "FAIL"
fi

# Testing for invalid characters input 
echo -n "Testing a maze that has invalid characters - "
./maze data/5x5_standard_maze.txt < inputs/invalid_inputs.in > tmp
if grep -q "Error: Invalid command. Please use W, A, S, D to navigate the maze." tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing for a collision in a wall. The player is assumed to be at the start position and any movement using WASDM is blocked as there are walls everywhere. 

echo -n "User inputs 'A' into wall - "
echo "A" | timeout 0.2s ./maze data/stuck_maze.txt > tmp
if grep -q "Movement Blocked. You have hit a wall. Try a different direction." tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "User inputs 'S' into wall - "
echo "S" | timeout 0.2s ./maze data/stuck_maze.txt > tmp
if grep -q "Movement Blocked. You have hit a wall. Try a different direction." tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "User inputs 'D' into wall - "
echo "D" | timeout 0.2s ./maze data/stuck_maze.txt > tmp
if grep -q "Movement Blocked. You have hit a wall. Try a different direction." tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "User inputs 'W' into wall - "
echo "W" | timeout 0.2s ./maze data/stuck_maze.txt > tmp
if grep -q "Movement Blocked. You have hit a wall. Try a different direction." tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing a valid sequence for a standard maze
echo -n "Testing a sequence to win a standard maze - "
./maze data/5x5_standard_maze.txt < inputs/win_5X5_standard_maze.in > tmp
if grep -q "Success- You have completed the maze!" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing the access of the map 
echo -n " Testing User inputs 'M' to open the map - "
echo "M" | timeout 0.2s  ./maze data/16x8_maze.txt > tmp
if grep -q "Map:" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing the right movement when the user enters 'D'
echo -n "Testing D ( Movement to the Right ) - "
echo "D" | timeout 0.2s ./maze data/move_right_maze.txt > tmp
if grep -q "Success : Moved right" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing the left movement when the user enters 'A'
echo -n "Testing A ( Movement to the Left ) - "
echo "A" | timeout 0.2s ./maze data/move_left_maze.txt > tmp
if grep -q "Success : Moved left" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing the down movement when the user enters 'S'
echo -n "Testing S ( Movement Down) - "
echo "S" | timeout 0.2s ./maze data/move_down_maze.txt  > tmp
if grep -q "Success : Moved down" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing the up movement when the user enters 'W'
echo -n "Testing W ( Movement Up ) - "
echo "W" | timeout 0.2s ./maze data/move_up_maze.txt > tmp
if grep -q "Success : Moved up" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing edge case when the Start sign is at the top edge and the user tries to move up
echo -n "Testing user movements beyond the border - "
echo "W" | timeout 0.2s ./maze data/corner_edge_maze.txt > tmp
if grep -q "Error: Cannot move outside the maze border." tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# adding read perms back on to bad_perms.txt
chmod +r data/bad_perms.txt
# Tidy up and removing the tmp file
rm -f tmp