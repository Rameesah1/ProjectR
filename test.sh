#!/bin/bash

# removed read permissions from this file 
chmod -r data/bad_perms.txt 

gcc mazeGame.c -o mazeGame

echo -e "Argument tests"

# Testing no file argument entered
echo -n "Testing no arguments - "
./mazeGame  > tmp
if grep -q "mazeGame <filename>" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing excess file arguments entered 
echo -n "Testing two arguments -"
./mazeGame a b > tmp
if grep -q 
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -e "\n~~ File Handling~~"
 
# Testing File Handling

echo -n "Testing an invalid file type - "
timeout 0.2s ./mazeGame data/invalidfiletype.pdf > tmp
if grep -q "Error : Wrong file format" tmp;
then
    echo "PASS"
else 
    echo "FAIL"
fi

echo -n "Testing bad permissions - "
timeout 0.2s ./mazeGame data/bad_perms.txt > tmp
if grep -q "Error: Bad filename" tmp; 
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing for a non existent file in the repository

echo -n "Testing the file exists -"
./mazeGame non_existent_file.txt > tmp
if grep -q "Error: File not found" tmp;
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

echo -n "Testing bad data (Start sign missing) - "
timeout 0.2s ./mazeGame data/no_start_maze.txt > tmp
if grep -q "Error: File does not have expected format" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Testing bad data (End sign missing) - "
timeout 0.2s ./mazeGame data/no_exit_maze.txt > tmp
if grep -q "Error: File does not have expected format" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "More than one Start sign in file - "
timeout 0.2s ./mazeGame data/excess_S_maze.txt > tmp
if grep -q "Error: File does not have correct format" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "More than one Exit sign in file - "
timeout 0.2s ./mazeGame data/excess_E_maze.txt > tmp
if grep -q "Error: File does not have correct format" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -n "Incorrect characters in the maze - "
timeout 0.2s ./mazeGame data/incorrect_characters_maze.txt > tmp
if grep -q "Error: Maze file does not have correct format" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# Testing if the height of the maze file is above the maximum range
echo -n "Testing bad data ( Exceeding Height range ) - "
timeout 0.2s ./mazeGame data/exceeding_height_maze.txt > tmp
if grep -q "Error: File does not have the expected format" tmp;
then 
    echo "PASS"
else
    echo "FAIL"
fi

# Testing if the width of the file is above the maximum range
echo -n "Testing bad data ( Exceeding Width range ) - "
timeout 0.2s ./mazeGame data/exceeding_width_maze.txt > tmp
if grep -q "Error: File does not have the expected format" tmp;
then 
    echo "PASS"
else
    echo "FAIL"
fi

# Testing if the height of the maze data is below the minimum range
echo -n "Testing bad data ( Below Height range ) - "
timeout 0.2s ./mazeGame data/below_minHeightmaze.txt > tmp
if grep -q "Error: File does not have the expected format" tmp;
then 
    echo "PASS"
else
    echo "FAIL"
fi

# Testing if the width of the maze data is below the mimimum range
echo -n "Testing bad data ( Below width range ) - "
timeout 0.2s ./mazeGame data/below_minWidthmaze.txt > tmp
if grep -q "Error: File does not have the expected format" tmp;
then 
    echo "PASS"
else
    echo "FAIL"
fi

# Testing if the maze data has irregular height
echo -n "Testing Bad Data ( Irregular height ) - "
timeout 0.2s ./mazeGame data/height_irregular_maze.txt > tmp
if grep -q "Error: File does not have the expected format" tmp;
then 
    echo "PASS"
else
    echo "FAIL"
fi

# Testing if the maze data has irregular width
echo -n "Testing Bad Data ( Irregular width ) - "
timeout 0.2s ./mazeGame data/width_irregular_maze.txt > tmp
if grep -q "Error: File does not have the expected format" tmp;
then 
    echo "PASS"
else
    echo "FAIL"
fi

# Testing if the maze data file has a rectangular shape
echo -n "Testing Bad Data ( Non-Rectangular maze ) - "
timeout 0.2s ./mazeGame data/non_rectangular_maze.txt > tmp
if grep -q "Error: Maze data is not rectangular" tmp;
then 
    echo "PASS"
else
    echo "FAIL"
fi
