#!/bin/bash

# removed read permissions from this file 
chmod -r data/bad_perms.txt 

gcc mazeGame.c -o mazeGame

echo -e "Argument tests"

# no file argument entered tested 
echo -e "Argument tests"

# testing no file argument entered
echo -n "Testing no arguments - "
./mazeGame  > tmp
if grep -q "mazeGame <filename>" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

# excess file arguments entered tested

echo -n "Testing two arguments -"t
./mazeGame a b > tmp
if grep -q 
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -e "File tests"
 
# testing file format

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

# testing for a non existent file in the repository

echo -n "Testing the file exists -"
./mazeGame non_existent_file.txt > tmp
if grep -q "Error: File not found" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi

#empty file

if [ ! -s /workspaces/ProjectR/data/emptyfile.txt ]; then
echo "The maze cannot load as the file 'emptyfile.txt' is empty."
fi

echo -n "Testing bad data (missing) - "
timeout 0.2s ./mazeGame data/bad_data_missing.csv > tmp
if grep -q "Error: CSV file does not have expected format" tmp;
then
    echo "PASS"
else
    echo "FAIL"
fi