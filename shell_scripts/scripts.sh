#!/bin/bash

#To Execute the script:
#chmod +x scripts.sh
#./scripts.sh

########### Create and Referencing Shell Variables ###########
PRICE_PER_APPLE=5
MyFirstLetters=ABC
greeting='Hello        world!'

# Escaping special characters
echo "The price of an Apple today is: \$HK $PRICE_PER_APPLE"
#>>The price of an Apple today is: $HK 5


# Avoiding ambiguity
echo "The first 10 letters in the alphabet are: ${MyFirstLetters}DEFGHIJ"
#>>The first 10 letters in the alphabet are: ABCDEFGHIJ

# Preserving whitespace
echo $greeting
echo "$greeting"

#Output
#>>Hello world!
#>>Hello        world!


########### Command Substitution ###########
#This is done by enclosing the command with $() or backticks (``).

CURRENT_DATE=$(date +"%Y-%m-%d")
echo "Today's date is: $CURRENT_DATE"

FILES_IN_DIR=`ls`
echo "Files in the current directory:"
echo "$FILES_IN_DIR"



########### Arithmetic Operations ###########
X=10
Y=5
# Addition
SUM=$((X + Y))
echo "Sum of $X and $Y is: $SUM"


########### Using Environment Variables ###############
#!/bin/bash

# Displaying some common environment variables
echo "Home directory: $HOME"
echo "Current user: $LOGNAME"
echo "Shell being used: $SHELL"
echo "Current PATH: $PATH"

# Creating a new environment variable
export MY_VARIABLE="Hello from my variable"

# Displaying the new variable
echo "My new variable: $MY_VARIABLE"

# Creating a child process to demonstrate variable scope
bash -c 'echo "MY_VARIABLE in child process: $MY_VARIABLE"'

# Removing the environment variable
unset MY_VARIABLE

# Verifying the variable is unset
echo "MY_VARIABLE after unsetting: $MY_VARIABLE"

