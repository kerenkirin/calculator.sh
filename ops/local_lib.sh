#!/bin/bash

checking_the_number_of_arguments () {
    if [ $1 -lt $2 ]; then
        echo "not enough arguments"
        exit 2
    fi
}




checking_the_of_validity_1 () {
	if eval "! [[ \$1 $2 \$3 ]]"; then
		echo "the provided numbers are not supported"
		exit 2
	fi
}
