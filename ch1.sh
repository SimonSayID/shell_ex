#!/bin/bash

echo "Hello      World"
echo "Hello World"
echo "Hello * World"
# the * will list current file
echo Hello * World
echo Hello      World
echo "Hello" World
echo Hello "     " World
echo "Hello "*" World"
# the `hello` will be treat as program
echo `hello` world
echo 'hello' world
echo "Hello 			\"World\""

string=abc0c2@c3cc1
#string length
echo "${#string}"
echo `expr length $string`
echo `expr "$string" : '.*'`

#length of matching substring at beginning of string
echo `expr match "$string" '[a-z]*.0' `
echo `expr "$string" : '[a-z]*.0' `

#index (1-based indexing)
echo `expr index "$string" @`
echo `expr index "$string" 2@`
#'c' (first one) matches before '2'
echo `expr index "$string" c2`

#extract (0-based indexing)
echo ${string:5}
echo ${string:1:3}
echo ${string:(-2)}
echo ${string: -2}

#Deletes shortest match of $substring from front of $string.
echo ${string#a*c}
#Deletes longest match of $substring from front of $string.
echo ${string##a*c}

#Deletes shortest match of $substring from back of $string.
echo ${string%c*1}

#Deletes longest match of $substring from back of $string.
echo ${string%%c*1}

#Replace first match of $substring with $replacement.
echo ${string/a*0/A*C}

#Replace all matches of $substring with $replacement.
echo ${string//c/p}

string=abc123abc

#If $substring matches front end of $string, 
#substitute $replacement for $substring.
echo ${string/#abc/XYZ}

#If $substring matches back end of $string,
#substitute $replacement for $substring.
echo ${string/%abc/XYZ}

echo "file name example\n"
touch o\ n\ e\?.txt
touch t\ w\ o\*.txt
echo "std out example\n"
echo "Hello" > o\ n\ e\?.txt
echo "World" > t\ w\ o\*.txt
cat o\ n\ e\?.txt >> t\ w\ o\*.txt
echo "cat command\n"
cat t\ w\ o\*.txt
echo "std in example\n"
wc -c < t\ w\ o\*.txt
rm o\ n\ e\?.txt
rm t\ w\ o\*.txt

echo "${name:-`whoami`}"
echo "${name:=john}"

read name < <(echo "tom")
echo "${name:=john}"

read name < <(echo "tom")
echo "${name:-`whoami`}"

echo `ls -l [re]*`
echo `ls -l '[re]*'`

grep '[Dd]ata' ch1output.txt
grep [Dd]ata ch1output.txt

echo $(ls -l)
echo "$(ls -l)"

#preserves whitespace in a single variable
words="one two three"
for i in "$words"; do
	echo "$i"
done

#single quotes do not permit referencing variables
echo '\\\\$words'

#escaped spaces prevent argument splitting
ls -l ../\ ./

exit 0