#if cron package not installed
sudo yum install cronie

#check crond status and start if not already active
sudo systemctl status crond
sudo systemctl start crond
sudo systemctl status crond

#List all cron jobs scheduled to run automatically
sudo crontab -l
#Add new cron jobs in the crontab file
sudo crontab -e
>>
*/5 * * * * echo hello > /tmp/cron_text.txt
:wq
>>
