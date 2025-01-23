# Shell Script Race Condition Bug

This repository demonstrates a race condition bug in a simple bash script. Two processes write to separate files concurrently, leading to unpredictable results when comparing the files afterward. The solution involves using locking mechanisms to synchronize access to the files.

## Bug Description:
The `bug.sh` script uses two background processes that write to files simultaneously.  The script then tries to compare the contents of the files using `diff`. Because of the race condition, the `diff` command may report differences even if no differences were expected or produce an unpredictable output.

## Solution:
The `bugSolution.sh` demonstrates the use of file locking to resolve the race condition.  Proper synchronization ensures consistent results when the files are compared.

## How to Run:
1. Clone the repository.
2. Run the buggy script: `bash bug.sh`
3. Run the solution script: `bash bugSolution.sh`

Observe the differences in the output of both scripts.  The solution script will produce consistent and predictable results.