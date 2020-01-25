#!/bin/bash
echo "Welcome to Flip Coin Simulation"
declare -A coin
read -p "Enter number of times you want to flip a coin " noOfFlips
echo -e "1. Singlet Combination\n2. Doublet Combination\n3. Triplet Combination"
read -p "Enter your choice " choice

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

function winPercentage()
{
	echo "Win Combination Percentage"
	for i in ${!coin[@]}
	do
		echo "$i ${coin[$i]}"
	done | sort -k2 -rn | head -1
}

case $choice in
   1) noOfCoins=1
		FlipCoin $noOfFlips $noOfCoins
		calculatePercentage
      winPercentage
		;;
   2) noOfCoins=2
		FlipCoin $noOfFlips $noOfCoins
		calculatePercentage
		winPercentage
      ;;
	3) noOfCoins=3
		FlipCoin $noOfFlips $noOfCoins
		calculatePercentage
		winPercentage
		;;
	*) echo "Invalid choice!"
      ;;
esac
