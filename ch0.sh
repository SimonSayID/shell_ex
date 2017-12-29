#!/bin/bash

echo "data command"
date
echo "who command"
who
echo "whoami command"
whoami
echo "ls command"
ls
echo "wc command\n"
wc ch1.sh
#number of lines
echo "wc -l command\n"
wc -l ch1.sh
#number of characters
echo "wc -c command\n"
wc -c ch1.sh
#number of words
echo "wc -w command\n"
wc -w ch1.sh
echo "cp command\n"
cp ch1.sh ch-1.sh
echo "mv command\n"
mv "ch-1.sh" "ch0-0.sh"
echo "rm command\n"
rm ch0-0.sh
echo "mkdir command\n"
mkdir mydir
echo "pwd command\n"
pwd
echo "cd command\n"
cd mydir
echo "touch command\n"
touch ex.txt
echo "ln command\n"
ln ex.txt hello
echo "cd ../ command\n"
cd ../
echo "ls -l mydir command\n"
ls -l mydir
echo "rm -r command\n"
rm -r mydir

DIR=`pwd`

cd /; ls -ld {,usr,usr/local}/{bin,sbin,lib}

#~ home directory
cd < <(echo ~)
#~+ current working directory
cd Documents
echo ~+
#~- previous working directory
echo ~-
#same as echo `basename $0`
echo ${0##*/}

name="abc/.rt/"
echo ${name#*.}

echo "pipe example\n"
who | wc -l
echo "ps -f command"
ps -f
echo "find command"
find -name "*.txt"
echo "tr command"
tr 'a-z' 'A-Z' < <(echo "abc")
echo "- option"
echo "test" | cat -

cd $DIR
echo "diff command"
#it lists all of the lines that do not match
#< means the text appear in first file, 
#> means the text appear in second file
#1,6c1 means you could make the files match by modifying lines
#one though six. letter 'c' stands for change
#diff's directions may also contain "a" for "append"
#or "d" for "delete." 
diff ch2output.txt ch3output.txt

exit 0