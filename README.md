## Bash-Project  


### Make the Script Executable  
* Give the script execute permissions:  
 `chmod +x /path/to/backup_script.sh`  

### Schedule the Backup with Cron  
* Use cron to schedule the script to run daily. Open the crontab editor:  
`crontab -e`  
- Add the following line to run the script every day at a specific time (e.g., 2 AM):  
`0 2 * * * /path/to/backup_script.sh`  
