#!/bin/bash

ARG=$1				# Search string
SEARCH_RESULT=()		# Array for storing the hits
COUNTER=0			# Counter for the hits
INPUT=0				# Input from user when selecting the file to play

# The $# variable will tell you the number of input arguments the script was passed.
if [ $# -eq 0 ]
	then
    		echo "No arguments supplied"
		exit
	else
		# Search for the file
		# Sore result in tmp file 
		find . -iname '*'$ARG'*' >> .tmp
		
		# Add elements to array
		while read -r line
		do
			SEARCH_RESULT+=("$line")
		done < ".tmp"
		# Remove file
		rm .tmp	

		# Display result for user
		for element in "${SEARCH_RESULT[@]}"
		do
   			echo -e "["$COUNTER"]" ' \t ' "$element"
			COUNTER=$((COUNTER+1))
   		done	

		# Check if we had hits
		if [ "$COUNTER" -gt "0" ]
			then
				echo -n "Enter id for file to play: "	
				read INPUT
				
				if [ $COUNTER -gt $INPUT ]
					then	
						mplayer "${SEARCH_RESULT[$INPUT]}"
					else
						echo "Dude wrong index..."
				fi
		fi
		
fi
