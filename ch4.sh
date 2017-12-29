#!/bin/bash

# This notation only works for a limited range (2 - 64) of ASCII characters.
# 10 digits + 26 lowercase characters + 26 uppercase characters + @ + _
let "b32 = 32#77"
echo $b32

let "b64 = 64#@_"
echo $b64

let "bin = 2#100"
echo $bin
echo $((2#100))

let "dec = 32"
echo $dec
echo $((10#32))

let "oct = 032"
echo $oct
echo $((8#032))

let "hex = 0x32"
echo $hex

echo $((0x9abc)) #Expresses result in decimal.

#  Using a digit out of range of the specified base notation
#+ gives an error message.
let "error_oct = 081"

declare -i b
(( a = 10 ))

(( a++ ))
b=$a
echo $a
echo $b
(( a-- ))
b=$a
echo $a
echo $b
(( ++a ))
b=$a
echo $a
echo $b
(( --a ))
b=$a
echo $a
echo $b

(( t = a < 45 ? 7 : 11 ))
echo $t

# These work only with version 2.04 or later of Bash.

# $RANDOM returns a different random integer at each invocation.
# Nominal range: 0 - 32767 (signed 16-bit integer).
r_num=$RANDOM
echo $r_num

# If you need a random int within a certain range, use the 'modulo' operator.
# This returns the remainder of a division operation.
RANGE=100
echo $(( RANDOM %= RANGE ))

#  Generate random number between 6 and 30.
rnumber=$(( RANDOM % 25 + 6 ))

#  Generate random number in the same 6 - 30 range,
#+ but the number must be evenly divisible by 3.
rnumber=$(( RANDOM % 27 / 3 * 3 + 6 ))

#reseeds
MAXCOUNT=25
SEED=

random_num()
{
	local count=0
	local number

	while [[ "$count" -lt "$MAXCOUNT" ]]; do
		number=$RANDOM
		echo -n "$number "
		let "count++"
	done
}

SEED=1
RANDOM=$SEED
echo "Random seed = $SEED"
random_num

echo

SEED=1
RANDOM=$SEED
echo "Random seed = $SEED"
random_num

echo

SEED=2
RANDOM=$SEED
echo "Random seed = $SEED"
random_num

echo

# Getting fancy...
SEED=$(head -1 /dev/urandom | od -N 1 | awk '{ print $2 }'| sed s/^0*//)
#  Pseudo-random output fetched
#+ from /dev/urandom (system pseudo-random device-file),
#+ then converted to line of printable (octal) numbers by "od",
#+ then "awk" retrieves just one number for SEED,
#+ finally "sed" removes any leading zeros.
RANDOM=$SEED
echo "Random seed = $SEED"
random_num