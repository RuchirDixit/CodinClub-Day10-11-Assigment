#!/bin/bash

isHeads=1
headsWinCount=0
tailsWinCount=0

#for (( i=1;i<=10;i++ )) for UC2
#for UC3
while [[ $headsWinCount -ne 10 && $tailsWinCount -ne 10 ]]
do
	tossRandom=$((RANDOM%2))
	if [[ $tossRandom -eq $isHeads ]]
	then
		echo "Heads wins"
		(( headsWinCount++ ))
	else
		echo "Tails wins"
		(( tailsWinCount++ ))
	fi
done

if [[ $headsWinCount -eq $tailsWinCount ]]
then
	echo "Its a Tie!"
	# for UC4
	while [[ ($(( $headsWinCount-$tailsWinCount )) -lt 2) && ($(( $tailsWinCount-$headsWinCount )) -lt 2) ]]
	do
   	tossRandom=$((RANDOM%2))
   	if [[ $tossRandom -eq $isHeads ]]
   	then
      	echo "Heads wins"
      	(( headsWinCount++ ))
   	else
      	echo "Tails wins"
      	(( tailsWinCount++ ))
   	fi
	done
	if [[ $headsWinCount -gt $tailsWinCount ]]
	then
   	echo "Heads Win. Total wins:"$headsWinCount
   	echo "Heads won by "$(( $headsWinCount-$tailsWinCount ))" points."
	else
   	echo "Tails Win. Total wins:"$tailsWinCount
   	echo "Tails won by "$(( $tailsWinCount-$headsWinCount ))" points."
	fi

elif [[ $headsWinCount -gt $tailsWinCount ]]
then
	echo "Heads Win. Total wins:"$headsWinCount
	echo "Heads won by "$(( $headsWinCount-$tailsWinCount ))" points."

else
   echo "Tails Win. Total wins:"$tailsWinCount
   echo "Tails won by "$(( $tailsWinCount-$headsWinCount ))" points."
fi
