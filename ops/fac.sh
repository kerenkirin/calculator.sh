#!/bin/bash

if [ ! -x ./ops/local_lib.sh ]; then
    echo "Run this program either via calc... or from the directory that contains the ops folder."
    exit 2
fi

source ./ops/local_lib.sh

end=

for end in "$@"; do
	checking_the_of_validity_1 "$end" "=~" "^[0-9]+$"
	d=0
	i=0
	e="$end"
	while [ ! "$e" -eq 0 ]; do
		es[$i]="$e"
		((e = e - 1))
		((i++))
		((d++))
	done
	i=0
	e=1
	while [ "$i" -lt "$d" ]; do 
		((e = e * es[$i])) 
		((i++)) 
	done 
	echo "$e" 
	i=0
	while [ "$i" -lt "$d" ]; do
		es[$i]=0
		((i++))
	done
done
