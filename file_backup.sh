#!/bin/bash

#WARNING:
#Filenames beginning with "-" may cause problems when coupled with the "-" redirection operator. 
#A script should check for this and add an appropriate prefix to such filenames, 
#for example ./-FILENAME, $PWD/-FILENAME, or $PATHNAME/-FILENAME.

BACKUPFILE=backup-$(date +%m-%d-%y)

archive=${1:-$BACKUPFILE}

#-mtime last 24 hour modified
#-1 default query level
#-type f regular file
#-print0 name end with null
find . -mtime -1 -type f -print0 | xargs -0 tar rvf "$archive"

exit 0