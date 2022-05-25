```shell
Docker image for IDrive. 

PREREQUISITES
 - Docker installed
 - Own an account on IDrive. 

INSTALLATION
 - Docker compose example: 

  idrive:
    container_name: idrive
    image: idrive:latest
    restart: unless-stopped  
    networks:
      - t2_proxy
    volumes:      
      - $DOCKERDIR/idrive/config:/work/IDriveForLinux/idriveIt
      - $BACKUPDIR:/home/backup:ro       
    environment:
      - TZ=$TZ
      - PGID=$PGID
      - PUID=$PUID   

 - $DOCKERDIR points to your local path for idrive config files. Necessary for persist account settings. 
 - $BACKUPDIR points to the local path you need to backup. 

FIRST RUN -> CONFIGURATION
 - Open a bash console into the container (or docker exec -it "container" "command"). 
 - Execute ./account_setting.pl
   Enter user and password and other stuff. 
 - Execute ./edit_supported_files.pl
   Add to file paths to backup (one path per line and relative to container tree -> /home/backup/xxx)

BACKUP
 - Execute ./Backup_Script.pl
 - For more commands and help open readme.txt file into container

SECOND RUN AND SUCCESSIVES
 - IDrive CRON and dashboard daemon don't persist when you stop and run again the container. 
   It's necessary to execute again ./account_setting.pl (no need to reconfigure, only restart services). 
   Update: this workaround isn't necessary now. 
```
