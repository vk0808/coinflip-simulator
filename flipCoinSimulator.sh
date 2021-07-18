#! /bin/bash -x

echo "Welcome to Coin Flip Simulator Program"


# Simulate multiple coin flips
function coinGame(){

        # Variable
        headCount=0
        tailCount=0
	toss=0

	local tie=$1

        MAX_PLAY=20
        HEAD=1


        while [ $toss -lt $MAX_PLAY ]
        do
                # Generate Head/Tail
                coinFlip=$(( $RANDOM %2 ))


                # Check if it's Head or Tail
                if [ $coinFlip -eq $HEAD ]; then
                        (( headCount++ ))
                else
                        (( tailCount++ ))
                fi

		((toss++))
        done


        # Print the final score
        echo "Head $headCount"
        echo "Tail $tailCount"


        # Calculate difference of the scores
        diff=$((tailCount - headCount))


        # Select winner
        if [ $headCount -eq $tailCount ]; then
                echo "It's a tie. Game will restart"
                coinGame 1

	# If it's a tie then difference in the score has to be more than 1 or else restart
        elif [ ${diff#-} -eq 1 -a $tie -eq 1 ]; then
                echo "It's a close call. Game will restart"
                coinGame 0

        elif [ $headCount -gt $tailCount ]; then
                echo "Winner is Head, won by ${diff#-} times"

        else
                 echo "Winner is Tail, won by ${diff#-} times"
        fi

}


# Function call
coinGame 0

