#!/bin/bash

MY_MSG="Hello World"
echo $MY_MSG

MY_NUMBER=2
expr $MY_NUMBER + 2
MY_NUMBER="3"
expr $MY_NUMBER + 1

echo "MY_MSG:$MY_MSG"

a=1
A=2
echo "a = $a"
echo "A = $A"

#var3 unset
var1=1
var2=2
echo ${var1-$var2}
echo ${var3-$var2}
# Echoes the result of `whoami`, 
#if variable $username is still unset.
echo ${username-`whoami`}

#${parameter-default} and ${parameter:-default} are almost equivalent. 
#The extra : makes a difference only when parameter has been declared, 
#but is null.
username1=
echo ${username1:-`whoami`}

#If parameter not set, set it to default.
vv=
echo ${v=1}
echo ${v=2}
echo ${vv:=3}

#If parameter set, use alt_value, else use null string.
p1=${param+5}
echo $p1
param=2
p1=${param+4}
echo $p1

#If parameter set, use it, 
#else print err_msg and abort the script with an exit status of 1.
${variable1?"is not set"}

#readonly
declare -r v=2
(( v++ ))
#same as declare -r
readonly v1=2
(( v1++ ))

#-a array
declare -a arr=( 1 2 3 )
for i in 0 1 2; do
	echo "${arr[$i]}"
done

echo_func(){
	echo "hello func"
	declare -i np=5
}
## Lists the function above.
declare -f

#Using the declare builtin restricts the scope of a variable.
echo $np

#This declares a variable as available for exporting 
#outside the environment of the script itself.
declare -x hehe
unset hehe

#The declare command can be helpful in identifying variables, 
#environmental or otherwise. 
#This can be especially useful with arrays.
declare | grep arr

#a variable declared or typed 
#as an integer is no longer available for string operations
declare -i intvar
intvar="string"
echo "$intvar"

let "t1 = (( 1+2, 2+4, 3+3 ))"
echo $t1

let "t1 = (( a=5, 2+4, 3+3 ))"
echo $a " " $t1

let a=16+5
echo "$a"

b=BB34

#-i integer
declare -i b
echo "$b"

c=${b/BB/12}
echo "$c"

arch=$(uname -m)
echo "$arch"

NAME=$MY_MSG
#must have {}, in case have space between string
touch "${NAME}_file"
rm "${NAME}_file"

#pid of the currently running shell
echo "$$"
#pid of the last run background process
echo "$!"

#internal variable
echo "\$BASH = $BASH"
echo "\$BASH_VERSION = $BASH_VERSION"
echo "\$BASH_ENV = $BASH_ENV"
echo "\$BASHPID = $BASHPID"
echo "\$BASH_SUBSHELL = $BASH_SUBSHELL"

( 	echo "in (), the\$\$ = $$"
	echo "\$BASH_SUBSHELL = $BASH_SUBSHELL"
	echo "\$BASHPID = $BASHPID" )

for i in 0 1 2 3 4 5; do
	echo "BASH_VERSINFO[$i] = ${BASH_VERSINFO[$i]}"
done

echo "\$HOME = $HOME"
echo "\$HOSTNAME = $HOSTNAME"
echo "\$OSTYPE = $OSTYPE"
echo "\$MACHTYPE = $MACHTYPE"

#IFS is the internal field separator.
#default value is SPACE TAB NEWLINE
#only effect things you type in
#example:typed hello:world:today
#result:x is hello y is world z is today
old_IFS="$IFS"
IFS=:
#process substitution
read x y z < <(echo "hello:world:today")
echo "x is $x y is $y z is $z"
IFS=$old_IFS

#If the $TMOUT environmental variable is set to a non-zero value time, 
#then the shell prompt will time out after $time seconds. 
#This will cause a logout.
echo "$TMOUT"

#Special variable set to final argument of previous command executed.
echo "$_"

exit 0