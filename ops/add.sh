#!/bin/bash

float=()
int=()
i=0
index=0
int_end="0"
float_end="0"
end=0

{
read -r -a float
read -r -a int 
} < ./dependencies/+.txt

while [ -n "${int[$i]}" ]; do
int[$i]="${int[$i]##--}"
((i++))
done

i=0

while [ -n "${float[$i]}" ]; do
float[$i]="${float[$i]##---}"
((i++))
done

while [ -n "${float[$index]}" ]; do
	float_end=$(awk -v total="$float_end" -v num="${float[$index]}" 'BEGIN {print total + num}')
	((index++))
done

index=0

while [ -n "${int[$index]}" ]; do
	((int_end = int_end + int[$index]))
	((index++))
done

end=$(awk -v i="$int_end" -v f="$float_end" 'BEGIN {print i + f}')

echo $end > ./dependencies/+.txt

