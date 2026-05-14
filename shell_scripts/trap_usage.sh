#!/bin/bash

#https://labex.io/labs/linux-bash-trap-command-388820?course=shell-for-beginners

cleanup_and_exit() {
  echo -e "\nSignal received! Cleaning up..."
  echo "Performing cleanup tasks..."
  # Add any necessary cleanup code here
  echo "Cleanup completed."
  echo "Exiting script gracefully."
  exit 0
}

trap cleanup_and_exit SIGINT SIGTERM

echo "This script will run until you press Ctrl+C."
echo "Press Ctrl+C to see the trap in action and exit gracefully."

count=1
while true; do
  echo "Script is running... (iteration $count)"
  sleep 1
  ((count++))
done

#-----------------------------------------------------------
$ ./trap_example.sh
This script will run until you press Ctrl+C.
Press Ctrl+C to see the trap function in action and exit gracefully.
Script is running... (iteration 1)
Script is running... (iteration 2)
Script is running... (iteration 3)
^C
Signal received! Cleaning up...
Performing cleanup tasks...
Cleanup completed.
Exiting script gracefully.
