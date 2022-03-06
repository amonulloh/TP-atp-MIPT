#!/bin/bash

while [ -n "$1" ]
do
if [ "$1" = "--input_folder" ]
then
in_folder="$2"
elif [ "$1" = "--backup_folder" ]
then
copy_folder="$2"
elif [ "$1" = "--extension" ]
then
exten="$2"
elif [ "$1" = "--backup_archive_name" ]
then
archive_folder="$2"
fi
shift
done
mkdir $copy_folder
for files in $(find $in_folder -type f -name "*.$exten")
do
cp --backup=numbered $files $copy_folder
done
tar -zcf $archive_folder $copy_folder
echo "done"

