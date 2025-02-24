## Bash-Project  


### Installation  

Follow these steps to clone and install the project on your local machine.  

Prerequisites  

Ensure you have the following installed:  

- Git  

- Bash (for executing scripts)

### Clone the Repository as you need.
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

## Backup configuration on the remote server.

- ### Install Required Tools  

- #### Install rsync (if not already installed):  

- #### On Debian/Ubuntu-based systems:  
  `sudo apt-get update`  
  `sudo apt-get install rsync`  

- ####  On Red Hat/CentOS-based systems:

  `sudo yum install rsync`
  
- Set up SSH access to the remote server:  

- Generate an SSH key pair on your local machine (if you don’t already have one):  

  `ssh-keygen -t rsa -b 4096  `

- Copy the public key to the remote server:  
  
  `ssh-copy-id user@remote_server_ip`  
- Test SSH access:  
  `ssh user@remote_server_ip `
 
 - Make the Script Executable and Run the Backup Script if Automate the Backup then run a cron job.
