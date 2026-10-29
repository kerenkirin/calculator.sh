#!/bin/bash

if [ $# -lt 2 ]; then
    echo "not enough arguments"
    exit 2
fi

end=0
num=0

for num in "$@"; do
    end=$(awk -v e="$end" -v n="$num" 'BEGIN {print e + n}')
done

echo $end
