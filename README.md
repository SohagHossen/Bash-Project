## Bash-Project  


### Installation  

Follow these steps to clone and install the project on your local machine.  

Prerequisites  

Ensure you have the following installed:  

- Git  

- Bash (for executing scripts)

### Clone the Repository
`git clone https://github.com/SohagHossen/Bash-Project.git`  

### Navigate to the Project Directory  
`cd Bash-Project`  

### Make the Script Executable  
* Give the script execute permissions:  
 `chmod +x /path/to/backup_script.sh`  

### Schedule the Backup with Cron  
* Use cron to schedule the script to run daily. Open the crontab editor:  
`crontab -e`  
- Add the following line to run the script every day at a specific time (e.g., 2 AM):  
`0 2 * * * /path/to/backup_script.sh`  
