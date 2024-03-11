#!/bin/bash
# removing read permissions from this file 
chmod -r data/bad_perms.csv

gcc mazeGame.c -o mazeGame

echo -e "Argument tests"

# no file argument entered tested 
echo -e "Argument tests"

# testing no file argument entered
echo -n "Testing no arguments - "
./maze  > tmp
if grep -q "Error: No arguments provided" tmp;
 then
    echo "PASS"
else
    echo "FAIL"
fi

# excess file arguments entered tested 

echo -n "Testing two arguments -"t
./maze x x > out
if grep -q 
then
    echo "PASS"
else
    echo "FAIL"
fi

echo -e "File tests"


# testing when the file doesn't not exist in repository 

echo -n "Testing the file exists -"
./maze hypothetical.txt > out
if grep -q "Error: File not found" out;
then
    echo "PASS"
else
    echo "FAIL"