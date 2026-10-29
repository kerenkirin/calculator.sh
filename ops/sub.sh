#!/bin/bash

if [ $# -lt 2 ]; then
    echo "not enough arguments"
    exit 2
fi

end="$1"
num=0
shift

for num in "$@"; do
    end=$(awk -v e="$end" -v n="$num" 'BEGIN {print e - n}')
done

echo $end
