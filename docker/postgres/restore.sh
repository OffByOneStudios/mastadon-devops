#!/bin/bash
# https://stackoverflow.com/questions/5885934/bash-function-to-find-newest-file-matching-pattern/5886002#5886002
unset -v latest
for file in /backup/*; do
  [[ $file -nt $latest ]] && latest=$file
done
echo Selected Backup: $latest
cp $latest /tmp/backup.gz
gunzip /tmp/backup.gz

cat /tmp/backup | psql --username "$POSTGRES_USER"
rm /tmp/backup