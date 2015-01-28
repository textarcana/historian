#!/usr/bin/env bash

chsum1=""

while [[ true ]]
do
    chsum2=`find bin/ -type f -exec md5 {} \;`
    if [[ $chsum1 != $chsum2 ]] ; then
        echo

        tests/run.sh

        echo # tests don't necessarily exit cleanly with a final line break

        date

        chsum1=$chsum2
    fi
    sleep 1
    echo -n '.'
done
