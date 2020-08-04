#!/bin/bash

read -p "Enter num1" a
read -p "Enter num2" b
read -p "Enter num3" c

declare -A computeDict

computeDict[Cal1]=$(( $a+$b*$c ))
computeDict[Cal2]=$(( $a*$b+$c ))
computeDict[Cal3]=$(( $c+$a/$b ))
computeDict[Cal4]=$(( $a%$b+$c ))

echo "Dictionary :"${computeDict[@]}

lengthOfDict=${#computeDict[@]}

counter=0
for value in "${computeDict[@]}"
do
		arrayCompute[$counter]=$value
		(( counter++ ))
done

echo "Array is:"${arrayCompute[*]}


sortA=` for item in ${arrayCompute[@]}; do echo $item; done | sort -n`
echo "Sort in ascending: "$sortA

sortD=` for item in ${arrayCompute[@]}; do echo $item; done | sort -n -r`
echo "Sort in descending: "$sortD

