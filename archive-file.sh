#!/bin/bash
#$Revision:001$
#$Mon Jul 29 13:42:37 +06 2024$


#Variables

BASE=/home/sohag/project
DAYS=10
DEPTH=1
RUN=0

#Check if the directory is present or not

if [ ! -d $BASE ]
then
        echo "Directory is not exist: $BASE"
        exit 1
fi

#Create 'archive' folder if not present

if [ ! -d $BASE/archive ]
then
        mkdir $BASE/archive
fi
#Find the list of files larget then 20MB
for i in `find $BASE -maxdepth $DEPTH -type f -size +2M`
do
        if [ $RUN -eq 0 ]
        then
                echo "[$(date "+%Y-%m-%d %H:%M:%S")] archiving $i ==> $BASE/archive"
                gzip $i || exit 1 && echo "faild to zip"
                mv $i.gz $BASE/archive || exit 1 && echo "failt t move"
        fi
done