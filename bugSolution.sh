#!/bin/bash

# This script demonstrates a solution to the race condition bug using file locking.

# Create two files.
touch file1.txt
touch file2.txt

# Function to write to a file with locking
write_to_file() {
  local file=$1
  local message=$2
  flock -n -x "$file.lock" || exit 1 # Acquire exclusive lock
  echo "$message" >> "$file"
  flock -u "$file.lock" # Release lock
}

# Start two processes simultaneously with locking
(while true; do write_to_file file1.txt "Process 1 writing to file1.txt"; write_to_file file1.txt "Process 1"; sleep 1; done) &
(while true; do write_to_file file2.txt "Process 2 writing to file2.txt"; write_to_file file2.txt "Process 2"; sleep 1; done) &

# Wait for a few seconds.
sleep 5

# Attempt to compare file contents (this should now work correctly)
kill %1
kill %2
diff file1.txt file2.txt

# Cleanup
rm file1.txt file2.txt
rm file1.txt.lock
rm file2.txt.lock