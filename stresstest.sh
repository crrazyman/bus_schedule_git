#!/bin/bash


echo "Set attacked URL [GUI|API]"
read ATTACKED

if [ "$ATTACKED" = "GUI" ]; then
	URL = "http://127.0.0.1:55001"
elif [ "$ATTACKED" = "API" ]; then
	URL = "http://127.0.0.1:55001/buses"
else
	echo "Only GUI or API are permitted"
	exit 1
fi

echo "Set attack rate"
read RATE

re='^[0-9]+$'
if ! [[ $RATE =~ $re ]] ; then
   echo "Error: Rate is not a number" >&2;
   exit 1
fi

echo "Set attack duration (s)"
read DURATION

echo "GET $URL" | vegeta attack -rate=$RATE -duration=$DURATIONs | vegeta report --type=text

