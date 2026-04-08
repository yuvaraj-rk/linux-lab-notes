#!/bin/bash

#https://labex.io/labs/shell-interstellar-cargo-manifest-388869?course=shell-for-beginners

# Define arrays for each cargo bay's inventory
forward_bay=()
midship_bay=()
aft_bay=()

forward_bay+=("Space Suits")
forward_bay+=("Oxygen Tanks")
forward_bay+=("Repair Kits")

midship_bay+=("Food Supplies")
midship_bay+=("Water Containers")
midship_bay+=("Medical Equipment")

aft_bay+=("Spare Parts")
aft_bay+=("Fuel Cells")
aft_bay+=("Scientific Instruments")

# Check if an argument is provided
if [ $# -eq 0 ]; then
    echo "Please specify a cargo bay: forward, midship, or aft"
    exit 1
fi

# Display inventory based on the argument
if [ "$1" = "forward" ]; then
    echo "Forward Bay Inventory:"
    count=1
    for item in "${forward_bay[@]}"; do
        echo "${count}. $item"
        count=$((count+1))
    done
elif [ "$1" = "midship" ]; then
    echo "Midship Bay Inventory:"
        count=1
    for item in "${midship_bay[@]}"; do
        echo "${count}. $item"
        count=$((count+1))
    done
elif [ "$1" = "aft" ]; then
    echo "Aft Bay Inventory:"
        count=1
    for item in "${aft_bay[@]}"; do
        echo "${count}. $item"
        count=$((count+1))
    done
else
    echo "Invalid cargo bay. Choose forward, midship, or aft."
    exit 1
fi
