#!/bin/bash

#https://labex.io/labs/shell-special-variables-in-shell-388819?course=shell-for-beginners

echo "Script Name: $0"
echo "First Argument: $1"
echo "Second Argument: $2"
echo "All Arguments: $@"
echo "Number of Arguments: $#"
echo "Process ID: $$"

#$? gives the exit status of the last executed command. 0 typically means success, while non-zero values indicate various error conditions.
#$! gives the process ID of the last background command.
echo "Running a successful command:"
ls /home
echo "Exit status: $?"

echo "Running a command that will fail:"
ls /nonexistent_directory
echo "Exit status: $?"

echo "Running a background process:"
sleep 2 &
echo "Process ID of last background command: $!"

#--------------------------------------------------
#$ ./exit_status.sh
#Running a successful command:
#labex
#Exit status: 0
#Running a command that will fail:
#ls: cannot access '/nonexistent_directory': No such file or directory
#Exit status: 2
#Running a background process:
#Process ID of last background command: 6189

#Using Special Variables in Functions
#$0 still refers to the script file name, not the function name.
#$1, $2, $@, and $# work for function arguments just like they do for script arguments.

function print_args {
  echo "Function Name: $0"
  echo "First Argument: $1"
  echo "Second Argument: $2"
  echo "All Arguments: $@"
  echo "Number of Arguments: $#"
}

echo "Calling function with two arguments:"
print_args hello world

echo "Calling function with four arguments:"
print_args one two three four

#--------------------------------------------------
#$ ./special_variables.sh
#Calling function with two arguments:
#Function Name: ./special_variables.sh
#First Argument: hello
#Second Argument: world
#All Arguments: hello world
#Number of Arguments: 2
#Calling function with four arguments:
#Function Name: ./special_variables.sh
#First Argument: one
#Second Argument: two
#All Arguments: one two three four
#Number of Arguments: 4

#Understanding the Difference Between $@ and $*
#With "$@", each argument is treated as a separate entity. Arguments with spaces are preserved as single units.
#With "$*", all arguments are combined into a single string, separated by the first character of the IFS (Internal Field Separator) variable, which is usually a space.

echo "Using \$@:"
for arg in "$@"; do
  echo "Argument: $arg"
done

echo "Using \$*:"
for arg in "$*"; do
  echo "Argument: $arg"
done


#-----------------------------------------------------------
#$ ./at_vs_star.sh "arg with spaces" another_arg "third arg"
#Using $@:
#Argument: arg with spaces
#Argument: another_arg
#Argument: third arg
#Using $*:
#Argument: arg with spaces another_arg third arg
