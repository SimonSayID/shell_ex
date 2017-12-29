#!/bin/bash

#return 0 (success)
#return 1 (failed)
(( 0 && 1))
echo $?
(( 0 || 1))
echo $?
#the exit status of an arithmetic expression is not an error value
let "num = (( 0 && 1 ))"
echo $num
let "num = (( 0 && 1 ))"
echo $?

#command execute successful $? is 0
/usr/hehe
if [[ "$?" -ne "0" ]]; then
	echo "/usr/hehe command doesn't exist"
fi

[[ $i -ne 3 ]] && echo "i isn't three" || echo "i is three"

if [[ ! -n "$g" ]]; then
	echo "g is none"
fi

# the & indicates a file descriptor.
echo $i | read
echo $i | grep "[^a-zA-Z]" > /dev/null 2>&1
if [[ "$?" -eq "0" ]]; then
	echo "$i isn't an alphabet. (a-z A-Z)"
fi

#will not echo $num
num=-2 && (( num+=2 )) && echo $num

#if can test any command
f1="ch2output.txt"
f2="ch2output.txt"
if cmp "${f1}" "${f2}" &> /dev/null; then
	echo "f1 and f2 are identical"
else
	echo "f1 and f2 differ"
fi

f1="Linux"
f2="inu"
if echo "$f1" | grep -q "$f2"; then
	echo "$f2 found in $f1"
else
	echo "$f2 not found in $f1"
fi

for i in -1 0 1 xyz; do
	if [[ $i ]]; then
		echo "$i is true"
	else
		echo "$i is false"
	fi
done
#does not allow if [[  ]]
#tips:Using the [[ ... ]] test construct, 
#rather than [ ... ] can prevent many logic errors in scripts. 
#For example, the &&, ||, <, and > operators work within a [[ ]] test, 
#despite giving an error within a [ ] construct
if [  ]; then
	echo "NULL is true"
else
	echo "NULL is false"
fi

if [[ $xyz ]]; then
	echo "uninitialized variable is true"
else
	echo "uninitialized variable is false"
fi

#initialized, but set to null value.
xyz=
if [[ -n $xyz ]]; then
	echo "NULL variable is true"
else
	echo "NULL variable is false"
fi

var1=5
var2=4

if (( var1 < var2 )); then
	echo "var1 < var2"
else
	echo "var1 > var2"
fi

if (( var1 > var2 )); then
	echo "var1 > var2"
else
	echo "var1 < var2"
fi

var3=$(( var1 + var2 ))
echo $var3

#-o logical or exp1 -o exp2
if [ 2 -gt 1 -o 2 -eq 1 ]; then
	echo "true"
else
	echo "false"
fi
#-a logical and exp1 -a exp2
if [ 2 -gt 1 -a 2 -eq 1 ]; then
	echo "true"
else
	echo "false"
fi

exit 0