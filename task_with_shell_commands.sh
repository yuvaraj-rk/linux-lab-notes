#!/bin/bash

#1. Sort plain numbers file and list top 10 numbers and print output to a file
sort -rn numbers.txt | head -n 10 > task1_output.txt
cat task1_output.txt 
'
999
999
997
997
995
991
991
988
987
986
'
#

#2. Counting Words Across Multiple Files
wc -w documents/*.txt | tail -n 1 | awk '{print $1}' > task2_output.txt
cat task2_output.txt
'526'

#Finding Frequent Patterns with sort and uniq
#3. Find the top 5 most frequent IP addresses in the access log file
cut -d' ' -f1 | sort | uniq -c | sort -rn | head -n 5 | awk '{print $2}' > task3_output.txt

cat task3_output.txt
255.1.2.3
255.4.2.9
255.4.1.9
255.4.1.1
255.1.4.5

#4. Count the number of lines in the access log file
wc -l < access.txt > task4_output.txt
cat task4_output.txt
1562

#5. Use the join command to combine data from two files: employees.txt and departments.txt 
#The final output should be saved in a file named employee_departments.txt.
#The output should be sorted alphabetically by the employee's last name.
#Display the result in custom format
#employees.txt
1 John Doe
2 Jane Smith
3 Bob Johnson
#departments.txt:
...
1 Sales
2 Marketing
3 Engineering
...

#Expected output in employee_departments.txt
Allen Barbara works in Marketing
Anderson Emily works in Resources
Bailey Michelle works in Marketing
...

join employees.txt departments.txt | sort -k3 | awk '{print $3 " " $2 " works in " $4}' > employee_departments.txt

