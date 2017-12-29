add_a_user()
{
	USER=$1
	PASSWORD=$2
	shift; shift;
	COMMENTS=$@
	echo "Adding user $USER"
	if [[ -z "$USER" ]]; then
		echo "\$1 is empty string"
		return 1
	fi
	if [[ -z "$PASSWORD" ]]; then
		echo "\$2 is empty string"
		return 2
	fi
	echo "Added user with $USER ($COMMENTS) with password $PASSWORD"
}

check_return_code()
{
	if [[ "$1" -eq "1" ]]; then
		echo "Something went wrong with the \$1"
	elif [[ "$1" -eq "2" ]]; then
		echo "Something went wrong with the \$2"
	else
		echo "Add user success"
fi
}

echo "start of script...(add_a_user)"
add_a_user tom letmein Bob Holness the presenter
RETURN_CODE=$?
check_return_code RETURN_CODE
add_a_user "" badpass Fred Durst the singer
RETURN_CODE=$?
check_return_code RETURN_CODE
add_a_user bilko "" Sgt. Bilko the role model
RETURN_CODE=$?
check_return_code RETURN_CODE
echo "end of script...(add_a_user)"

func()
{
	echo "called as : $@"
	x=2
}

x=1
echo "x is $x"
func 1 2 3
echo "x is $x"

#x still is 1, because a new shell process called to pipe func
#tee is start first
x=1
echo "x is $x"
func 1 2 3 | tee func.out
echo "x is $x"

#function cannot change the values they have been called with
#this must be done by changing the variables themselves
func_arg()
{
	echo "\$1 is $1"
	echo "\$2 is $2"
	a="test"
}

a=hello
b=world
func_arg $a $b
echo "a is $a"
echo "b is $b"

rec()
{
	if [[ "$1" -gt "1" ]]; then
		i=`expr $1 - 1`
		j=`rec $i`
		k=`expr $1 \* $j`
		echo $k
	else
		echo 1
	fi
}

read x < <(echo "5")
rec $x

. ./rec
echo $STD_MSG
rename_func .out .output

