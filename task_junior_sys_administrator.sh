#!/bin/bash

#Process Overseer
#Listing Active System Processes
#Task:
#Use a single command to generate a detailed list of all processes running on the system.
#Requirements
#The command must display processes for all users, not just your own, in a user-friendly format, and include processes not attached to a terminal.
#The output format should be user-oriented, showing details like the user who owns the process, CPU/memory usage, and the full command that started it.
ps -aux

#Monitoring Process Resource Usage
#Tasks
#Launch an interactive command-line utility to monitor system processes and their resource usage in real-time.
#Identify the name of the script that is consuming the most CPU.
#Requirements
#You must use a tool that provides a continuously updated, real-time view of system processes.
#The tool should allow you to sort processes by CPU usage by default.
#Once you have identified the top consumer, exit the tool to proceed to the next step.
top

#Tasks
#Find the Process ID (PID) of the critical_service.sh script.
#Verify that the critical service is running properly.
#Requirements
#You must use the pgrep command to find the PID of the process running critical_service.sh.
#The command should successfully locate the running process and display its PID.

pgrep critical

#labex:project/ $ 
pgrep -f "critical_service.sh"
#199

#verify the process details using:
#labex:project/ $ 
ps -p 199 -o pid,ppid,cmd     
#    PID    PPID CMD
#    199       1 /bin/bash /home/labex/project/critical_service.sh

#Terminating a Misbehaving Process
#Tasks
#Terminate the resource_hog.sh process.
#Requirements
#You must use a command that can terminate a process based on its name, without needing to find its PID first.
#Use the pkill command to stop the resource_hog.sh script.
ps aux | grep resource_hog
#labex        198 99.5  0.0   4356  1508 ?        R    04:56  30:04 /bin/bash /home/labex/project/resource_hog.sh
#labex        917  0.0  0.0   3464  1664 pts/3    S+   05:26   0:00 grep --color=auto --exclude-dir=.bzr --exclude-dir=CVS --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn --exclude-dir=.idea --exclude-dir=.tox resource_hog
#pkill resource_hog
#or
pkill -f "resource_hog.sh"

ps aux | grep resource_hog
#labex        977  0.0  0.0   3464  1608 pts/3    S+   05:27   0:00 grep --color=auto --exclude-dir=.bzr --exclude-dir=CVS --exclude-dir=.git --exclude-dir=.hg --exclude-dir=.svn --exclude-dir=.idea --exclude-dir=.tox resource_hog

#Starting and Managing Background Processes

#Tasks
#Start the data_processor.sh script so that it runs in the background and is immune to hangups (i.e., it won't stop if you close your terminal).
#Requirements
#You must be in the ~/project directory.
#Use the nohup command to run the script.
#Use the & operator to send the process to the background.
#Redirect all output (both standard output and standard error) from the script to a file named processor.log.

nohup ./data_processor.sh > processor.log 2>&1 &

ps aux | grep data_processor

#Tasks
#Create a cron job that automatically runs a backup command.
#The job should run every minute (for the purpose of this challenge).
#The command should create a new, compressed tar archive inside the ~/project/backups/ directory.
#To prevent overwriting, each new backup file must have a unique name that includes a timestamp (e.g., backup-2023-10-27_15-30-00.tar.gz).
#The backup command within the cron job must use absolute paths for the output directory and the source directories (e.g., /home/labex/project/backups).

#You must use crontab -e to edit your cron jobs.
#When you run crontab -l, you should see your new backup job

* * * * * tar -czf /home/labex/project/backups/backup-$(date +\%Y-\%m-\%d_\%H-\%M-\%S).tar.gz -C /home/labex/project data config logs

#Add a line to print "Enter the backup filename: " to prompt the user for input.
#Use the read command to capture the user's input into a new variable called BACKUP_FILENAME.
#Add a final echo command to confirm the settings, displaying a message like "Backing up logs to: [filename]", where [filename] is the value entered by the user.

read -p "Enter the backup filename: " BACKUP_FILENAME
echo "Backing up logs to: $BACKUP_FILENAME"

'''
labex:project/ $ ./log_manager.sh 
Enter the backup filename: daily_backup
Backing up logs to: daily_backup
'''

#Tasks
#First, create a directory named backups inside ~/project where the log files will be copied.
#Modify your log_manager.sh script.
#Add an if statement to check if the directory specified by the $LOG_DIR variable exists.
#Inside the if block (where the directory is confirmed to exist), add a for loop.
#The loop should iterate over every file ending in .log inside the $LOG_DIR directory.
#Inside the loop, use the cp command to copy each log file into the ~/project/backups directory.
#For each file copied, print a message like "Copied [filename]".

LOG_DIR="/home/labex/project/app_logs"
 
if [ -d "$LOG_DIR" ]; then
    echo "Log directory found. Proceeding..."
    read -p "Enter the backup filename: " BACKUP_FILENAME
    echo "Backing up logs to: $BACKUP_FILENAME"
    if [ -d "backups" ];then
        rm -r "./backups"
        exit 1
    else
        mkdir backups
    fi
 
    for file in $LOG_DIR/*.log;		#<<<<<<<<<<<<<<<<
    do
        cp $file "./backups/"
        echo "Copied $file"
    done
    echo "Backup complete."
else
    echo "Error: Log directory not found."
    exit 1
fi
