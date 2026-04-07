echo "Hello, World!"
id

Identify current user name
whoami

Display the kernel name:
uname

Display all system information
uname -a

Find Related Commands
apropos <cmd name> 
Optionally search inside to filter the result

apropos <cmd name> | grep <keyword to search & filter results>

Display System uptime and load average
uptime

To View active processes and resource usage.
top

employees.txt 
1001 John Engineering
1002 Sarah Marketing
1006 Alex IT
salaries.txt 
1001 75000
1002 65000
departments.txt 
Engineering ENG
Marketing MKT

join employees.txt salaries.txt
1001 John Engineering 75000
1002 Sarah Marketing 65000
join -o 1.2,1.3,2.2,1.1 employees.txt salaries.txt
John Engineering 75000 1001
Sarah Marketing 65000 1002

join -a 1 employees.txt salaries.txt
1001 John Engineering 75000
1002 Sarah Marketing 65000
1006 Alex IT

The -a 1 option tells join to include unpairable lines from the first file (employees.txt).

>>join based on a different field?
join -1 3 -2 1 employees.txt departments.txt
Engineering 1001 John ENG
Marketing 1002 Sarah MKT
-1 3 tells join to use the third field from the first file (employees.txt) as the join field
-2 1 tells it to use the first field from the second file (departments.txt) as the join field

Add a new user:
sudo useradd joker
sudo useradd -d /home/gotham joker
with default home directory creation with user name as folder name
sudo useradd -m joker

Set/Change Password for a user:
sudo passwd joker

Status of the Password:
sudo passwd -S joker

Change Home directory of a user:
sudo usermod -d /home/arkham joker

Change default shell of a user:
sudo usermod -s /bin/bash joker

Add user to a particular group
sudo usermod -aG <group-name> <username>
sudo usermod -aG developers joker

id <username>
groups <username>
grep 'group-name:' /etc/group

See changes to the user:
sudo grep -E '(joker|batman):' /etc/passwd
>>joker:x:5001:5001::/home/arkham:/bin/sh
>>batman:x:5002:5003::/home/gotham:/bin/bash

Word Count in a text file

wc -l -w -m file.txt
l, w, m - no. of lines, words and characters respectively

Display contents Pagewise (cmd is lightweight but loads entire file -> use only if the file size is not too large 100s of MB or GBs)
more filename.txt

From Nth line
more +100 filename.txt

To display only N lines of the page:
more -10 filename.txt

Start line with searched text:
more +/"2023-07-15" weather_data.txt

Display large files efficiently (use if files are large as it loads contents on demand)
Display with line numbers
less -N filename.txt 
less -N +/"search pattern" filename.txt

Jump straight to the last line in the file
less +G filename.txt

from the pages -> Press
= to see current line number
Space to move next pages
b to show prev. pages
Enter to show next line
q to quit n return to terminal

Line numbering command
nl -b a -n rz -s ': ' -w 3 config.txt

Case insensitive count of matching words in the file
grep -ic "ERROR" logs/server.log


Display N lines before and after the matched lines
grep -B 2 -A 2 "CRITICAL" logs/server.log

Print all except the match word "ERROR" (option -v)
grep -v "ERROR" logs/server.log

combine two keywords in same line (AND)
grep -i "WARNING" application.log | grep -i "query" > filtered_results.txt

Extended RegEx  (OR)
grep -E "word1|word2 " file


Cut command (extract column 2 from csv file): f -field/column, d - delimiter
cut -d ',' -f 2 customers.txt
cut -d ',' -f 2-3,4 customers.txt | tail -n+2

Combine grep n cut command
grep -E ',[2-9][0-9]\.[0-9]{2}$' /home/labex/project/books.txt | cut -d ',' -f 2

regex match: ,29.99

AWK command 

Only search action
awk '{print $3, $5}' server_logs.txt | head -n 5

With condition and action
awk '$4 == "POST" {print $0}' server_logs.txt
Multiple conditions and action
awk '$4 == "POST" && $6 >= 400 {print $0}' server_logs.txt

count the number of requests for each HTTP status code.
2023-08-01 23:09:24 192.168.1.140 POST /submit_form.php 404
2023-08-01 14:10:23 192.168.1.123 POST /api/data 400
2023-08-02 01:47:59 192.168.1.185 POST /api/data 500

awk '{count[$6]++} END {for (code in count) print code, count[code]}' server_logs.txt | sort -n

Find the top 5 most frequently accessed resources
awk '{count[$5]++} END {for (resource in count) print count[resource], resource}' server_logs.txt | sort -rn | head -n 5

Count the number of requests per IP address
awk '{count[$3]++} END {for (ip in count) print ip, count[ip]}' server_logs.txt

Count requests by both method and status
awk '{key=$4"-"$6; count[key]++} END {for (k in count) print k, count[k]}' server_logs.txt

Run an awk script file and generate a report as a html file
awk -f log_report.awk server_logs.txt > log_report.html

Create an awk script file: log_report.awk
cat << 'EOF' > log_report.awk
BEGIN {
    print "<html><body>"
    print "<h1>Server Log Summary</h1>"
    total = 0
    errors = 0
}

{
    total++
    if ($6 >= 400) errors++
    ip_count[$3]++
    resource_count[$5]++
}

END {
    print "<p>Total requests: " total "</p>"
    print "<p>Error rate: " (errors/total) * 100 "%</p>"
    
    print "<h2>Top 5 IP Addresses</h2>"
    print "<ul>"
    for (ip in ip_count) {
        top_ips[ip] = ip_count[ip]
    }
    n = asort(top_ips, sorted_ips, "@val_num_desc")
    for (i = 1; i <= 5 && i <= n; i++) {
        for (ip in ip_count) {
            if (ip_count[ip] == sorted_ips[i]) {
                print "<li>" ip ": " ip_count[ip] " requests</li>"
                break
            }
        }
    }
    print "</ul>"
    
    print "<h2>Top 5 Requested Resources</h2>"
    print "<ul>"
    for (resource in resource_count) {
        top_resources[resource] = resource_count[resource]
    }
    n = asort(top_resources, sorted_resources, "@val_num_desc")
    for (i = 1; i <= 5 && i <= n; i++) {
        for (resource in resource_count) {
            if (resource_count[resource] == sorted_resources[i]) {
                print "<li>" resource ": " resource_count[resource] " requests</li>"
                break
            }
        }
    }
    print "</ul>"
    
    print "</body></html>"
}
EOF

To Create directories
mkdir dir1 dir2 ...

To move files/directories
mv src dest

To create copies
cp src(fullpath) dest(fullpath)

List contents of directories
ls
ls -a
ls -F (display directories with / suffix to indicate they are directories)

ls -l (display all properties of the file)

To Remove/delete
rm files

sort -nr -t: -k2 filename.ext
-n: Performs a numeric sort
-r: Reverses the sort order (descending instead of ascending)
-t:: Specifies that fields are separated by colons
-k2: Uses the second field (the grade) as the sorting key

sort -t: -k2n -k3nr ~/project/student_records.txt
-t: specifies that fields are separated by colons
-k2n sorts based on the second field (age) numerically
-k3nr then sorts based on the third field (grade) numerically in reverse order

sort -u filename.ext
-u display unique entris (remove duplicates)

uniq command
first sort the file
sort file sorted_file
uniq sorted_file
uniq -c sorted_file (display count of the lines)
uniq -d sorted_file (display only duplicated lines)


Search for files:
find . -name 'file.ext'
More files:
find <path> -name '*.ext1' -o -name '*.ext2'

Searching / Finding Files by Size:
find . -type f -size +1M

Finding Recently Modified Files (less than 1 day)
find . -type f -mtime -1

Executing Commands on Found Files
find . -name "*.txt" -exec cat {} \;
-exec cat {} \; is new. 
It tells "find" to execute the cat command on each file it finds
cat is a command that displays the contents of a file
{} is a placeholder that find replaces with each filename it finds
\; marks the end of the -exec command


cat ~/project/punctuated.txt | tr -d '[:punct:]'
cat ~/project/encoded.txt | tr 'b-za-a' 'a-z'
tr 'b-za-a' 'a-z':
The first set 'b-za-a' consists of:
'b-z': letters b through z
'a-a': the letter a
So the complete first set is: b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z,a
The second set 'a-z' is: a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,q,r,s,t,u,v,w,x,y,z
This creates a mapping where each letter in the first set is replaced by the corresponding letter in the second set:
b (1st in first set) → a (1st in second set)
c (2nd in first set) → b (2nd in second set)
...
a (26th in first set) → z (26th in second set)
This effectively shifts each letter in the input back by one position in the alphabet (Caesar cipher decryption)

cat ~/project/log_entry.txt | tr -cd '[:digit:]'
>>tr -cd '[:digit:]':
The -c option complements the set (meaning "not in this set").
The -d option deletes the specified characters.
[:digit:] is a character class that represents all digits (0-9).
Together, -cd '[:digit:]' means "delete all characters that are not digits".
	
cat ~/project/spaced.txt | tr -s ' '
>>tr -s ' ':
The -s option squeezes repeats of the specified character into a single occurrence.
' ' specifies that we want to squeeze space characters.

fruits.txt 
apple
orange
xargs is particularly helpful when you need to take the output of one command and use it as arguments for another command.
cat fruits.txt| xargs echo
apple orange

cat ~/project/books.txt | xargs -I {} touch ~/project/{}.txt
-I {}: This option tells xargs to replace occurrences of {} in the command with each input line. 'This is particularly useful 
when the command you are running needs the input argument in the middle or at the end, rather than just appended to the end.'
touch ~/project/{}.txt: 'This is the command that xargs will execute for each line of input. 
The {} will be replaced with each book title, and .txt will be appended to create the filename.'

cat fruits.txt | xargs -n 2 echo "Processing fruits:"
Processing fruits: apple orange
xargs -n 2: 'This tells xargs to use at most 2 arguments per command execution. This means xargs will group the input lines into sets of two and execute the target command for each group.'

process_book.sh 
#!/bin/bash
echo "Processing $1 at $(date)" > ~/project/processed_$1
sleep 2  # Simulate some processing time

cat ~/project/more_books.txt | xargs -P 3 -I {} ~/project/process_book.sh {}
xargs -P 3: This tells xargs to run up to 3 processes in parallel. xargs will launch up to 3 instances of the target command simultaneously, each processing one or more input items.
-I {}: This defines {} as a placeholder for each input item, which will be passed as an argument to our script.
~/project/process_book.sh {}: This is the command to run for each book, with {} replaced by the book title.

cat ~/project/classic_books.txt | xargs -n 2 -P 3 sh -c 'echo "Processing batch: $@"' _

sh -c 'echo "Processing batch: $@"' _: This is the command that xargs will execute.
sh -c: Executes a command string using the shell.
'echo "Processing batch: $@"': The command string to execute. $@ within the shell script expands to all the positional parameters passed to the script, which in this case are the arguments provided by xargs (the two book titles).
_: This is a dummy argument passed to sh -c. It becomes the value of $0 within the shell script. We use it here because sh -c expects $0 to be set, and it doesn't affect the output when using $@'

change ownership
sudo chown -R user:group directory-path/file-path

Kernel or Device Driver error logs (pipe logs to grep for case-insensitive search and store inside a file)
option -i makes keyword case-insensitive
sudo dmesg | grep -Ei 'fail|error' > boot_issues.txt

difference files & directories

diff file1 file2
diff -r server1_files server2_files > missing_files.txt

Car tar archive:
tar -cvzf home_backup.tar /home

Gzip archive -z option: (use sudo if elevated access required)
tar -cvzf home_backup.tar.gz /home

Bzip2 archive -j option:
tar -cvjf home_backup.tar.bz2 /home

Extract the archive:
tar -xvf home_backup.tar(.gz|.bz2) -C /tmp/my_restore

List contents of archive file:
tar -tvf /home/labex/home.tar.gz

Process and system tracking:
Default 3s once state update
top

Custom update interval
top -d 1

Process by particlar user
top -u user

List only active processes
top -i

Total memory usage
free
Human readable format display
free -h

Sizes display In MB
free -m

Display in human readable format every 3 seconds for 5 updates
free -h -s 3 -c 5

Use below keys for sorting:
R - Sort order change
M - Memory wise
P - Processor usage wise
N - sort by number
h - help window displayn

Disk Space usage:
-----------------
Display disk usage in human readable format
du -h

To see only the current directory,set max-depth to zero
du -h --max-depth=0

Sort the result with max usage at the top
du -h --max-depth=1 | sort -hr

Find files that occupies max space (since du only focus on directories we use find and pass as arg the found files to du command)
find . -type f -exec du -h {} + | sort -hr | head -n 5
>>exec du -h {} +: Executes du -h on each file found. The {} is replaced with the filename, and the + tells find to pass as many filenames as possible to each invocation of du

Filter only files whose size greater than 1MB
find . -type f -size +1M -exec du -h {} + | sort -hr

Monitor Disk Space usage:
df -Th

Inode usahe in filesystem
df -ih

Exclude a filesystem
df -h -x tmpfs

Analyze a particular filesystem with path
df -h /
df -h /home

Total Filesystem size

df -h --total

#Schedule Cron jobs:
#Refer to https://crontab.guru/ to get descriptive output of the schedule configured in crontab file

#<Schedule 5 fields> <Command/script>

#List all the cron jobs:
crontab -l 
#Create/edit the cron jobs in VI Editor
crontab -e

#Sample job to add in crontab file:
*/5 * * * * echo Hello > /tmp/cron_text.txt

#Every 5 minutes print Hello in cron_text.txt file (i keeps overwriting the 'Hello' text in the file every 5 minute.
