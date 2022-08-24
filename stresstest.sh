#!/bin/bash
# Used https://github.com/tsenart/vegeta

is_number () {
    re='^[0-9]+$'
    if ! [[ $1 =~ $re ]] ; then
       echo "Error: Argument is not a number" >&2;
       exit 1
    fi
    return 0
}

echo -e "Set attacked URL:"
read URL

echo -e "\nSet attack rate"
read RATE
is_number $RATE

echo -e "\nSet attack duration (s)"
read DURATION
is_number $DURATION

DURATION="${DURATION}s"

echo -e "\nAttacking $URL...\n\n"

echo "GET $URL" | vegeta attack -rate=$RATE -duration=$DURATION | vegeta report --type=text

