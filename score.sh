#!/bin/bash

if ! [ -f matches ]
then
	`touch matches`
fi

if [ "$1" = "-h" ]
then
	echo ""
	echo "Usage: ./score [options]"
	echo "       Just calling ./score.sh would show you scores for currently tracked matches"
	echo ""
	echo "       [options]"
	echo "       -a <cricinfo url> <key> : Track a match"
	echo "       -r <key>                : Stop tracking the match represented by <key>"
	echo "       -l                      : Lists currently tracking matches"
	echo ""
fi

if [ "$1" = "-a" ] 
then
	lineCount=`cat matches | grep -e "|$3" | wc -l | cut -d " " -f8`;

	if ! [ "$lineCount" = "0" ]
	then
		echo "Sorry, that key already exists . Use another key , run ./score -h for more information"
		# figure out how to exit here
	fi

	echo $2"|"$3 >>	matches

elif [ "$1" = "-r" ] 
then
	mv matches matches.old
	awk -v rem=$2 'match($1,rem) == 0 {print $0}' matches.old > matches
	rm matches.old

elif [ "$1" = "-l" ]
then
	cat matches | while read LINE
	do
		key=`echo $LINE | cut -d "|" -f2`
		value=`echo $LINE | cut -d "|" -f1`

		echo $key ":" $value
	done

elif [ "$#" = 0 ]
then
	cat matches | while read LINE
	do
		url=`echo $LINE | cut -d "|" -f1`
		curl -s $url |  grep -e "<title>" | sed -n 1p | cut -d "|" -f1 | cut -d ">" -f2	
	done
fi