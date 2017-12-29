#!/bin/bash

E_BADARGS=65

case $# in
	0|1 )	echo "Usage: `basename $0` old_suffix new_suffix"
			exit $E_BADARGS
		;;
esac

old=$1
new=$2

old=${old#.}
new=${new#.}

for i in *.$old; do
	mv ${i} ${i%$old}$new
done

exit 0