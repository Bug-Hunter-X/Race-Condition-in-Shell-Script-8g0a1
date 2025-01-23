#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files.
touch file1.txt
touch file2.txt

# Start two processes simultaneously.
(while true; do echo "Process 1 writing to file1.txt"; echo "Process 1" >> file1.txt; sleep 1; done) &
(while true; do echo "Process 2 writing to file2.txt"; echo "Process 2" >> file2.txt; sleep 1; done) &

# Wait for a few seconds.
sleep 5

# Attempt to compare file contents (this might fail due to race condition)
kill %1
kill %2
diff file1.txt file2.txt

# Cleanup
rm file1.txt file2.txt