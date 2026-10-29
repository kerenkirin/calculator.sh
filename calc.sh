#!/bin/bash

set -u

cd "$(dirname "$0")" || exit

math=
i=1

if ! [ -x ./ops/"$1.sh" ]; then
    echo "there is no such operation"
    exit 2
fi

if [ -x ./ops/"$1.sh" ]; then
	math=$1
	shift
fi

while [ $i -le $# ]; do
    if [[ ! ${!i} =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
	    echo "unsupported characters are present"
        echo "supported"
        echo " - 1 2 3 4 5 6 7 8 9 0 . "
        exit 2
    fi
    ((i++))
done

"./ops/$math.sh" "$@"


