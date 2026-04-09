#!/bin/bash

#https://labex.io/labs/shell-arithmetic-operations-in-shell-388813?course=shell-for-beginners

# Define costs
COST_PINEAPPLE=50
COST_BANANA=4
COST_WATERMELON=23
COST_BASKET=1

TOTAL=$((COST_PINEAPPLE + (COST_BANANA * 2) + (COST_WATERMELON * 3) + COST_BASKET))

echo "Total cost is $TOTAL cents"
