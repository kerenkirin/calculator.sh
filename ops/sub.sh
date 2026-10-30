#!/bin/bash

if [ ! -x ./ops/local_lib.sh ]; then
    echo "Run this program either via calc... or from the directory that contains the ops folder."
    exit 2
fi

source ./ops/local_lib.sh

checking_the_number_of_arguments "$#" 2 

end="$1"
num=0
shift

for num in "$@"; do
    end=$(awk -v e="$end" -v n="$num" 'BEGIN {print e - n}')
done

echo $end
