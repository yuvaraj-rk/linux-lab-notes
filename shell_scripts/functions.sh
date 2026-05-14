#!/bin/bash

#https://labex.io/labs/shell-shell-functions-388818?course=shell-for-beginners

# This is a simple function
greet() {
  echo "Hello, World!"
}

# This line calls (runs) the function
greet

###### Functions with Parameters ######
# Function with a parameter
greet() {
  echo "Hello, $1!"
}

# Function with multiple parameters
calculate() {
  echo "The sum of $1 and $2 is $(($1 + $2))"
}

# Call functions with arguments
greet "Alice"
calculate 5 3

###### Return Values from Functions ######

# Function that echoes a result
get_square() {
  echo $(($1 * $1))
}

# Function that modifies a global variable
RESULT=0
set_global_result() {
  RESULT=$(($1 * $1))
}

# Capture the echoed result
square_of_5=$(get_square 5)
echo "The square of 5 is $square_of_5"

# Use the function to modify the global variable
set_global_result 6
echo "The square of 6 is $RESULT"

###### Understanding Variable Scope ######

# Global variable
GLOBAL_VAR="I'm global"

# Function with a local variable
# Use the local keyword to create variables that are only accessible within a function.
demonstrate_scope() {
  local LOCAL_VAR="I'm local"
  echo "Inside function: GLOBAL_VAR = $GLOBAL_VAR"
  echo "Inside function: LOCAL_VAR = $LOCAL_VAR"
}

# Call the function
demonstrate_scope

echo "Outside function: GLOBAL_VAR = $GLOBAL_VAR"
echo "Outside function: LOCAL_VAR = $LOCAL_VAR"

#-----------------
#Inside function: GLOBAL_VAR = I'm global
#Inside function: LOCAL_VAR = I'm local
#Outside function: GLOBAL_VAR = I'm global
#Outside function: LOCAL_VAR =


##### Advanced Function #####
#This function will take three arguments: two numbers and an operation (plus, minus, or times).

ENGLISH_CALC() {
  local num1=$1
  local operation=$2
  local num2=$3
  local result

  case $operation in
    plus)
      result=$((num1 + num2))
      echo "$num1 + $num2 = $result"
      ;;
    minus)
      result=$((num1 - num2))
      echo "$num1 - $num2 = $result"
      ;;
    times)
      result=$((num1 * num2))
      echo "$num1 * $num2 = $result"
      ;;
    *)
      echo "Invalid operation. Please use 'plus', 'minus', or 'times'."
      return 1
      ;;
  esac
}

# Test the function
ENGLISH_CALC 3 plus 5
ENGLISH_CALC 5 minus 1
ENGLISH_CALC 4 times 6
ENGLISH_CALC 2 divide 2 # This should show an error message

#-----------------
#3 + 5 = 8
#5 - 1 = 4
#4 * 6 = 24
#Invalid operation. Please use 'plus', 'minus', or 'times'.
