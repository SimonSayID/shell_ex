#!/bin/bash

#array members need not be consecutive or contiguous.
array[11]=23
array[12]="Hello"

if [[ ${array[10]} != "" ]]; then
	echo "array[10] have value"
else
	echo "array[10] doesn't have value"
fi
echo "array[11] is ${array[11]}"
echo "array[12] is ${array[12]}"
if [[ ${array[13]} != "" ]]; then
	echo "array[13] have value"
else
	echo "array[13] doesn't have value"
fi

array=( 1 2 3 4 )
for i in 0 1 2 3; do
	echo "array[$i] = ${array[$i]}"
done

array=( {a..d} )
for i in 0 1 2 3; do
	echo "array[$i] = ${array[$i]}"
done

array=( zero one two )

#parameter expansion (first element)
echo ${array:0}
echo ${array:1}

#length of element
echo ${#array}
echo ${#array[0]}
echo ${#array[1]}

#number of elements
echo ${#array[*]}
echo ${#array[@]}

array=([0]=1 [2]=2)
for i in 0 1 2; do
	echo "array[$i] = ${array[$i]}"
done

array2=123abc
echo ${array2}
echo ${array2[0]}
echo ${array2[@]}
echo ${array2[*]}
echo ${array2[1]}
if [[ ${array2[1]} != "" ]]; then
	echo "array2[1] have value"
else
	echo "array2[1] doesn't have value"
fi