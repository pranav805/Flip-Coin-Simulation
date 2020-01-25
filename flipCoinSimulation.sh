#!/bin/bash
echo "Welcome to Flip Coin Simulation"
declare -A coin
read -p "Enter number of times you want to flip a coin " n
headCount=0
tailCount=0
for(( i=0; i<$n; i++ ))
do
	randomCheck=$(( RANDOM%2 ))
	if [ $randomCheck -eq 1 ]
	then
		coin[H]=$(( ++headCount ))
	else
		coin[T]=$(( ++tailCount ))
	fi
done
echo Keys :	${!coin[@]}
echo Count:	${coin[@]}

echo Percentage of head: `echo "scale=2;${coin[H]}*100/$n" | bc`"%"
echo Percentage of tail: `echo "scale=2;${coin[T]}*100/$n" | bc`"%"

