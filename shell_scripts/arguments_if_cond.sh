#!/bin/bash

#https://labex.io/labs/shell-passing-arguments-to-the-script-388811?course=shell-for-beginners

#Numerical comparison
if [ $# -eq 0 ]; then
  echo "No arguments provided"
elif [ $# -eq 1 ]; then
  echo "One argument provided: $1"
elif [ $# -eq 2 ]; then
  echo "Two arguments provided: $1 and $2"
else
  echo "More than two arguments provided:"
  echo "Script name: $0"
  echo "First argument: $1"
  echo "Second argument: $2"
  echo "Third argument: $3"
  echo "Total number of arguments: $#"
fi

#This script introduces numeric comparison operators:
#-lt: less than
#-eq: equal to
#-gt: greater than

#There are also others you can use:
#-le: less than or equal to
#-ge: greater than or equal to
#-ne: not equal to

#String comparison
STRING1="hello"
STRING2="world"
NUMBER1=5
NUMBER2=10

if [ "$STRING1" = "hello" ] && [ "$STRING2" = "world" ]; then
  echo "Both strings match"
fi

if [ $NUMBER1 -lt 10 ] || [ $NUMBER2 -gt 5 ]; then
  echo "At least one of the number conditions is true"
fi

if [[ "$STRING1" != "$STRING2" ]]; then
  echo "The strings are different"
fi

if [[ -z "$STRING3" ]]; then
  echo "STRING3 is empty or not set"
fi

#Also, notice the use of double square brackets [[ ]] in some of the if statements. 
#These are an enhanced version of the single square brackets and are preferred in Bash scripts when possible. 
#They allow for more complex expressions and have fewer surprises with regard to word splitting and pathname expansion.

