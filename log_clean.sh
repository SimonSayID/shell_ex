#!/bin/bash

LOG_DIR=/var/log
ROOT_UID=0 #only users with $UID 0 have root privileges
LINES=50 #Default number of lines saved
E_WRONGARGS=85 #non-numberical argument
E_XCD=86 #Can't change directory
E_NOTROOT=87 #Non-root exit error

if [ "$ROOT_UID" -ne "$UID" ]; then
	echo "must be root to run this script"
	exit $E_NOTROOT
fi

case "$1" in
	"" 		) lines=$LINES
		;;
	*[!0-9]*) echo "Usage: `basename $0` lines-to-cleanup"
				exit $E_WRONGARGS
		;;
	*		) lines=$1
		;;
esac


cd /var/log || {
	echo "can't change to $LOG_DIR" >&2
	exit $E_XCDE;
}

tail -n $lines messages > mesg.temp
mv mesg.temp messages

> wtmp

echo "Logs cleaned up"

exit 0