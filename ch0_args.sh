#!/bin/bash

#example input: 1 2 3 4 5
#example result:
# I was called with 5 parameters
# My name is ./ch5.sh
# first parameter is 1
# first parameter is 2
# All parameter are 1 2 3 4 5
# My name is ch5.sh
echo "I was called with $# parameters"
echo "My name is $0"
echo "first parameter is $1"
echo "first parameter is $2"
echo "All parameter are $@"

echo "My name is `basename $0`"

while [[ "$#" -gt "0" ]]; do
	echo "\$1 is $1"
	shift
done
