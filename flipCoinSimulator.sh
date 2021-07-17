#! /bin/bash -x

echo "Welcome to Coin Flip Simulator Program"


# Variable
headCount=0
tailCount=0

MAX_PLAY=21
HEAD=1


# Simulate multiple coin flips
while [ $headCount -lt $MAX_PLAY -a $tailCount -lt $MAX_PLAY ]
do

	# Generate Head/Tail
        coinFlip=$(( $RANDOM %2 ))


	# Check if it's Head or Tail
        if [ $coinFlip -eq $HEAD ]; then
                (( headCount++ ))
        else
                (( tailCount++ ))
        fi

done


# Print the final score
echo "Head $headCount"
echo "Tail $tailCount"


# Select winner
if [ $headCount -eq $tailCount ]; then
	echo "It's a tie"
elif [ $headCount -gt $tailCount ]; then
	echo "Winner is Head, won by $((headCount - tailCount)) times"
else
	echo "Winner is Tail, won by $((tailCount - headCount)) times"
fi
