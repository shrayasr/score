#!/bin/bash

# initialize the "db" file (so to speak :P)
if ! [ -f matches ]
then
	`touch matches`
fi

if [ "$1" = "-a" ] 
then
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
	#curl -s http://www.espncricinfo.com/asia-cup-2012/engine/current/match/535798.html |  grep -e "<title>" | sed -n 1p | cut -d "|" -f1 | cut -d ">" -f2
	#curl -s http://www.espncricinfo.com/world-twenty20-qualifier-2012/engine/current/match/546439.html |  grep -e "<title>" | sed -n 1p | cut -d "|" -f1 | cut -d ">" -f2
	done
fi