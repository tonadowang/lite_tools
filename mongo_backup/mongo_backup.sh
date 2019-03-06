#!/bin/bash
#this scrip for use 'mongodump' to backup mongodb
APP_NAME="e_lab_inventory_bak"
MONGO_HOST="10.228.107.21"
MONGO_PORT="27017"
#yy-mm-dd-hh-mm,e.g. 2019-03-25-1930
TIMESTAMP=`date +%F-%H%M`
#e.g. 2019-03
TIME_YY_MM=`date +%Y-%m`
MONGODUMP_PATH="/usr/bin/mongodump"
BACKUPS_FATHER_DIR="/home/_mongodb_bak"
BACKUPS_DIR="$BACKUPS_FATHER_DIR/$APP_NAME"
BACKUP_NAME="$APP_NAME-$TIMESTAMP"
ARCHIVE_DIR="$BACKUPS_DIR/archive_before_$TIME_YY_MM"
OPERATION_LOG="$BACKUPS_FATHER_DIR/$APP_NAME-operation.log"

mkdir -p $BACKUPS_DIR
mkdir -p $ARCHIVE_DIR

#/usr/bin/mongodump --hose 10.228.107.21:27017 --out /home/_mongodb_bak/e_lab_inventory_bak/e_lab_inventory_bak-2019-03-04-0350
echo $BACKUP_NAME >> $OPERATION_LOG
$MONGODUMP_PATH --host $MONGO_HOST:$MONGO_PORT --out $BACKUPS_DIR/$BACKUP_NAME >> $OPERATION_LOG 2>&1

# cd /home/_mongodb_bak/e_lab_inventory_bak/
cd $BACKUPS_DIR
# tar -zcvf e_lab_inventory_bak-2019-03-04-0350.tgz e_lab_inventory_bak-2019-03-04-0350
tar -zcvf $BACKUP_NAME.tgz $BACKUP_NAME
#remove foler, only leave tgz
rm -rf $BACKUPS_DIR/$BACKUP_NAME
#start to archive last month's tgz file
for i in `ls *tgz | grep -v $TIME_YY_MM`; do mv $i $ARCHIVE_DIR; done
cd ~/
