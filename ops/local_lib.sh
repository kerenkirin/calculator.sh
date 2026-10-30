#!/bin/bash

checking_the_number_of_arguments () {
    if [ $1 -lt $2 ]; then
        echo "not enough arguments"
        exit 2
    fi
}
