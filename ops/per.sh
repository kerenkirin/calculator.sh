#!/bin/bash

if [ ! -x ./ops/local_lib.sh ]; then
    echo "Run this program either via calc... or from the directory that contains the ops folder."
    exit 2
fi

source ./ops/local_lib.sh

checking_the_number_of_arguments "$#" 2 

percent=$(awk -v p="$1" 'BEGIN {print p / 100}')
end=0
num=0
shift

for num in "$@"; do
    end=$(awk -v p="$percent" -v n="$num" 'BEGIN {print p * n}')
    echo $end
done
