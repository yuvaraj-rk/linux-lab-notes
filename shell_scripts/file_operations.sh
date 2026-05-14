#!/bin/bash

#https://labex.io/labs/shell-file-system-operations-in-shell-388821?course=shell-for-beginners

#Testing File Existence

filename="test_file.txt"
if [ -e "$filename" ]; then
  echo "$filename exists"
else
  echo "$filename does not exist"
fi

#Testing Directory Existence

dirname="test_directory"
if [ -d "$dirname" ]; then
  echo "$dirname exists"
else
  echo "$dirname does not exist"
fi

#Testing File Permissions

filename="test_file.txt"
if [ -r "$filename" ]; then
  echo "You have read permission for $filename"
else
  echo "You do not have read permission for $filename"
fi
