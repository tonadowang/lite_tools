mongo_backup.sh
###This tool will leverage 'mongodump' to backup mongodb data.
- Output & Functions
  - Output: e.g. e_lab_inventory_bak-2019-03-05-1040.tgz
  - Also archive your last month's *tgz file to archive_before_2019-03
- How to use:
  - edit below parameter as you want:
    - APP_NAME="e_lab_inventory_bak"
    - MONGO_HOST="10.228.107.21"
    - MONGO_PORT="27017"
    - MONGODUMP_PATH="/usr/bin/mongodump"
    - BACKUPS_FATHER_DIR="/home/_mongodb_bak"
  - manually execute it, or add this script to crontab
    - for manually: ./mongo_backup.sh
    - for crontab:
      - sudo crontab -e
      - add below contents into contab
	```
        #backup mongodb everyday 12:30
        30 12 * * *  /home/_mongodb_bak/mongo_backup.sh
        ```
