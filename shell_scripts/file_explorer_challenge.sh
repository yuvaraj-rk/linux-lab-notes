#!/bin/bash

#Task is to complete the check_item function:
#It should take one parameter (the name of a file or directory).
#It should perform the following checks and echo the results:
#	If the item exists
#	If it's a file or a directory
#	If it's readable

check_item() {
    local item="$1"
    echo "Checking: $item"
    
    #Check existence
    if [ -e $item ]; then
        echo "Exists: Yes"

        #Check directory
        if [ -d $item ]; then
            echo "Type: Directory"
        elif [ -f $item ]; then #Check if type is a file
            echo "Type: File"
        else
            echo "Invalid argument passed"
        fi

        #Check readability
        if [ -r $item ]; then
            echo "Readable: Yes"
        else
            echo "Readable: No"
        fi
    else
        echo "Exists: No"
    fi
}

# Main script
if [ $# -eq 0 ]; then
    echo "Please provide a file or directory name as an argument."
    exit 1
fi

check_item "$1"
