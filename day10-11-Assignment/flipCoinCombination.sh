#!/bin/bash

#for single combination
headsWinCount=0
tailsWinCount=0

#dictionaries

declare -A singleDict
declare -A doubleDict
declare -A tripleDict

totalSingleFlips=0
totalDoubleFlips=0
totalTripleFlips=0

while [[ $headsWinCount -ne 10 && $tailsWinCount -ne 10 ]]
do
	(( totalSingleFlips++ ))
   tossRandom=$((RANDOM%2))
   if [[ $tossRandom -eq 1 ]]
   then
      echo "Heads wins"
      (( headsWinCount++ ))
		singleDict["Chance "$totalSingleFlips]="Heads"
   else
      echo "Tails wins"
      (( tailsWinCount++ ))
		singleDict["Chance "$totalSingleFlips]="Tails"
   fi
done
#heads win percent
headsCal=`echo $headsWinCount $totalSingleFlips | awk '{ print $1/$2 }'`
headsWinPercentage=`echo $headsCal | awk '{ print $1*100 }'`

#tails win percent
tailsCal=`echo $tailsWinCount $totalSingleFlips | awk '{ print $1/$2 }'`
tailsWinPercentage=`echo $tailsCal | awk '{ print $1*100 }'`


chance=`echo $headsWinPercentage $tailsWinPercentage | awk '{ if ($1 > $2) { print "headr" } else { print "tail" } }'`
echo "chance:"$chance

if [[ $chance == headr ]]
then
	echo "Heads Percentage Win:"$headsWinPercentage
else
	echo "Tails Percentage Win:"$tailsWinPercentage
fi

# single combo dictionary

echo "Dictionary: "${singleDict[@]}

#for double combination
headsCountDouble=0
tailsCountDouble=0

while [[ $headsCountDouble -ne 10 && $tailsCountDouble -ne 10 ]]
do
	(( totalDoubleFlips++ ))
	doubleSimulatorToss1=$(( RANDOM%2 ))
	doubleSimulatorToss2=$(( RANDOM%2 ))
	double=`echo $doubleSimulatorToss1$doubleSimulatorToss2`
	if [[ $double -eq 00 ]]
	then
		headsCountDouble=$(( $headsCountDouble+2 ))
		doubleDict["Chance "$totalDoubleFlips]="Heads Heads"
	elif [[ $double -eq 11 ]]
	then
		tailsCountDouble=$(( $tailsCountDouble+2 ))
		doubleDict["Chance "$totalDoubleFlips]="Tails Tails"
	elif [[ $double -eq 01 ]]
	then
		(( headsCountDouble++ ))
		(( tailsCountDouble++ ))
		doubleDict["Chance "$totalDoubleFlips]="Heads Tails"
	elif [[ $double -eq 10 ]]
	then
  		(( headsCountDouble++ ))
 		(( tailsCountDouble++ ))
		doubleDict["Chance "$totalDoubleFlips]="Tails Heads"
	fi
done

#heads win percent
headsCalDouble=`echo $headsCountDouble $totalDoubleFlips | awk '{ print $1/$2 }'`
headsWinPercentage=`echo $headsCalDouble | awk '{ print $1*100 }'`

#tails win percent
tailsCalDouble=`echo $tailsCountDouble $totalDoubleFlips | awk '{ print $1/$2 }'`
tailsWinPercentage=`echo $tailsCalDouble | awk '{ print $1*100 }'`


chance=`echo $headsWinPercentage $tailsWinPercentage | awk '{ if ($1 > $2) { print "headr" } else { print "tail" } }'`
echo "chance:"$chance

if [[ $chance == headr ]]
then
   echo "Heads Double Percentage Win:"$headsWinPercentage
else
   echo "Tails Double Percentage Win:"$tailsWinPercentage
fi

# double combo dictionary

echo "2 combo Dictionary: "${doubleDict[@]}


# for triple combination


headsCountTriple=0
tailsCountTriple=0

while [[ $headsCountTriple -ne 10 && $tailsCountTriple -ne 10 ]]
do
   (( totalTripleFlips++ ))
   tripleSimulatorToss1=$(( RANDOM%2 ))
   tripleSimulatorToss2=$(( RANDOM%2 ))
	tripleSimulatorToss3=$(( RANDOM%2 ))
   triple=`echo $tripleSimulatorToss1$tripleSimulatorToss2$tripleSimulatorToss3`
	case $triple in
		000)
			headsCountTriple=$(( $headsCountTriple+3 ))
			tripleDict["Chance "$totalTripleFlips]="Heads Heads Heads"
			;;
		001)
         headsCountTriple=$(( $headsCountTriple+2 ))
			(( tailsCountTriple++ ))
         tripleDict["Chance "$totalTripleFlips]="Heads Heads Tails"
         ;;
		010)
         headsCountTriple=$(( $headsCountTriple+2 ))
			(( tailsCountTriple++ ))
         tripleDict["Chance "$totalTripleFlips]="Heads Tails Heads"
         ;;
		011)
         tailsCountTriple=$(( $tailsCountTriple+2 ))
			(( headsCountTriple++ ))
         tripleDict["Chance "$totalTripleFlips]="Heads Tails Tails"
         ;;
		100)
			headsCountTriple=$(( $headsCountTriple+2 ))
			(( tailsCountTriple++ ))
         tripleDict["Chance "$totalTripleFlips]="Tails Heads Heads"
         ;;
		101)
         tailsCountTriple=$(( $tailsCountTriple+2 ))
			(( headsCountTriple++ ))
         tripleDict["Chance "$totalTripleFlips]="Tails Heads Tails"
         ;;
		110)
			tailsCountTriple=$(( $tailsCountTriple+2 ))
			(( headsCountTriple++ ))
         tripleDict["Chance "$totalTripleFlips]="Tails Tails Heads"
         ;;
		111)
         tailsCountTriple=$(( $tailsCountTriple+3 ))
         tripleDict["Chance "$totalTripleFlips]="Tails Tails Tails"
         ;;
	esac
done


#heads win percent
headsCalTriple=`echo $headsCountTriple $totalTripleFlips | awk '{ print $1/$2 }'`
headsWinPercentage=`echo $headsCalTriple | awk '{ print $1*100 }'`

#tails win percent
tailsCalTriple=`echo $tailsCountTriple $totalTripleFlips | awk '{ print $1/$2 }'`
tailsWinPercentage=`echo $tailsCalTriple | awk '{ print $1*100 }'`


chance=`echo $headsWinPercentage $tailsWinPercentage | awk '{ if ($1 > $2) { print "headr" } else { print "tail" } }'`
echo "chance:"$chance

if [[ $chance == headr ]]
then
   echo "Heads Triple Percentage Win:"$headsWinPercentage
else
   echo "Tails Triple Percentage Win:"$tailsWinPercentage
fi

# double combo dictionary

echo "3 combo Dictionary: "${tripleDict[@]}

# sorting the dictionary according to requirement UC5
sortSingle=` for item in ${singleDict[@]}; echo $item | sort -n`
sortDouble=` for item in ${doubleDict[@]}; echo $item | sort -n`
sortTriple=` for item in ${tripleDict[@]}; echo $item | sort -n`

combinedTotalHead=$(( $headsWinCount+$headsCountDouble+$headsCountTriple ))
combinedTotalTail=$(( $tailsWinCount+$tailsCountDouble+$tailsCountTriple ))

if [[ $combinedTotalHead -gt $combinedTotalTail ]]
then
	echo "Heads Win overall!!"
else
	echo "Tails Win overall!!"
fi
