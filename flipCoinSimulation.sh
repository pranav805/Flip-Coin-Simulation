#!/bin/bash -x
echo "Welcome to Flip Coin Simulation"
declare -A coin
read -p "Enter number of times you want to flip a coin " noOfFlips
echo -e "1. Singlet Combination\n2. Doublet Combination"
read -p "Enter your choice " choice

case $choice in
   1) noOfCoins=1
      ;;
   2) noOfCoins=2
      ;;
   *) echo "Invalid choice!"
      ;;
esac

function FlipCoin()
{
	for(( i=1; i<=$1; i++ ))
	do
		flipSide=""
		for((j=1; j<=$2; j++))
		do
			randomCheck=$(( RANDOM%2 ))
			if [ $randomCheck -eq 1 ]
			then
				flipSide+=H
			else
				flipSide+=T
			fi
		done
		updateCount $flipSide
	done
}

function updateCount()
{
	coin[$1]=$((${coin[$1]}+1))
}

function calculatePercentage()
{
	for i in ${!coin[@]}
	do
		coin[$i]=`echo "scale=2; ${coin[$i]}*100/$noOfFlips" | bc`
	done
	echo "Keys      : ${!coin[@]}"
	echo "Percentage: ${coin[@]}"
}
FlipCoin $noOfFlips $noOfCoins
calculatePercentage
