# * are files in current directory
for i in words hello 1 2 good * 3.1; do
	echo "Looping .. i is set to $i"
done

#[[ is a keyword, not a command.

num=3
while [[ $num -gt -1 ]]; do
	case $num in
		3 ) echo "num now is three"
			;;
		2 ) echo "num now is two"
			;;
		*)	echo "num now isn't three or two, is $num"
			break
			;;
	esac
	num=$((num-1))
done

mkdir rc{1,2,3,4,5,S}.d

for v in 1 2 3 4 5 S; do
	rmdir rc${v}.d
done

for i in 1 2 3; do
	if [[ $i = 1 ]]; then
		echo "$i is one"
	elif [[ $i = 2 ]]; then
		echo "$i is two"
	else
		echo "$i is neither one nor two"
	fi
done

#break N breaks out of N levels of loop.
for i in a b c; do
	for v in 1 2 3; do
		if [[ $v == 1 ]]; then
			break 2;
		else
			echo $v
		fi
	done
done

#A continue N terminates all remaining iterations
#at its loop level and continues with the next iteration
#at the loop, N levels above.

for i in a b c; do
	for v in 1 2 3; do
		if [[ $v == 1 ]]; then
			continue 2;
		else
			echo $v
		fi
	done
done
