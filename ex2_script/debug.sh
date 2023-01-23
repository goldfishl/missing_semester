#!/usr/bin/env bash

count=1
./error.sh > output 2>&1  # firstly, redirect STDIN to 'output' file, then redirect STDERR to STDIN.
while [ $? -eq 0 ]
do
((count+=1))  # Condition Construct:Shell Arithmetic
./error.sh >> output 2>&1
done
echo "it took $count times for the script to fail."
