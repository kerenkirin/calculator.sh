#!/bin/bash

i=0
end=0
num=0

for num in "$@"; do
    end=$(awk -v e="$end" -v n="$num" 'BEGIN {print e + n}')
    ((i++))
done

echo $end

