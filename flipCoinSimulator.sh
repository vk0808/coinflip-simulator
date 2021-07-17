#! /bin/bash -x

echo "Welcome to Coin Flip Simulator Program"


# Simulate multiple coin flips
function coinGame(){

	# Variable
	headCount=0
	tailCount=0

	MAX_PLAY=21
	HEAD=1


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


	# Calculate difference of the scores
	diff=$((tailCount - headCount))


	# Select winner
	if [ $headCount -eq $tailCount ]; then
		echo "It's a tie. Game will restarts"
		coinGame

	elif [ ${diff#-} -eq 1 ]; then
		echo "It's a close call. Game restarts"
		coinGame

	elif [ $headCount -gt $tailCount ]; then
		echo "Winner is Head, won by ${diff#-} times"

	else
		 echo "Winner is Tail, won by ${diff#-} times"
	fi

}


# Function call
coinGame
