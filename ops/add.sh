#!/bin/bash

checking_the_number_of_arguments "$#" 2 

end="$1"
num=0
shift

for num in "$@"; do
    end=$(awk -v e="$end" -v n="$num" 'BEGIN {print e + n}')
done

echo $end
