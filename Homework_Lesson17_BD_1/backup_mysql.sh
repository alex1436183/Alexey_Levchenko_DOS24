#!/bin/bash

DB_USER="root"
DB_PASS="1111"
DB_NAME="cours"
BACKUP_DIR="/home/avl/backup"
BACKUP_FILE="${BACKUP_DIR}/cours_backup_$(date +%F_%H-%M-%S).sql"
REMOTE_SERVER="avl1@192.168.1.213:/home/avl1/backup"

mysqldump -u $DB_USER -p$DB_PASS $DB_NAME > $BACKUP_FILE

rsync -az $BACKUP_FILE $REMOTE_SERVER
