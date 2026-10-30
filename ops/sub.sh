#!/bin/bash

float=()
int=()
b=0
i=0
r=0
index=0
int_end="${int[$b]}"
float_end="${float[$v]}"
v=0
end=0

{
read -r -a float
read -r -a int
} < ./dependencies/-.txt

i=0

while [ -n "${int[$i]}" ]; do
int[$i]="${int[$i]##--}"
((i++))
done

i=0

while [ -n "${float[$i]}" ]; do
float[$i]="${float[$i]##---}"
((i++))
done

i=1

while [ -n "${int[$i]}" ]; do	
	if [ "${int[$b]}" -gt "${int[$i]}" ]; then
		r="${int[$b]}"
		int[$b]="${int[$i]}"
		int[$i]=$r
	fi
	((b++))
	((i++))
done

int_end="${int[$b]}"
float_end="${float[$v]}"


while [ -n "${float[$index]}" ]; do
	float_end=$(awk -v total="$float_end" -v num="${float[$index]}" 'BEGIN {print total - num}')
	((index++))
done

index=0

while [ -n "${int[$index]}" ]; do
	((int_end = int_end - int[$index]))
	((index++))
done

end=$(awk -v i="$int_end" -v f="$float_end" 'BEGIN {print i - f}')

echo $end > ./dependencies/-.txt
