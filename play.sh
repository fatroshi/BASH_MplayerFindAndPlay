#!/bin/bash
# Created by: Farhad Atroshi
# 2016

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
		
		# check if file is not empty
		if [ -s .tmp ]

			then
		
			# Display result for user
			echo 
  			echo -e "---------------------------------------------------------------------"
			echo -e "ID" ' \t ' "File name"
			echo -e "---------------------------------------------------------------------"
			for element in "${SEARCH_RESULT[@]}"
			do
 				echo -e "["$COUNTER"]" ' \t ' "$element"
				COUNTER=$((COUNTER+1))
   			done	
		fi

		# Remove file
		rm .tmp	

		# Check if we had hits
		if [ "$COUNTER" -gt "0" ]
			then
				echo
				echo -n "Enter file id: "	
				read INPUT
				
				if [ $COUNTER -gt $INPUT ]
					then	
						mplayer "${SEARCH_RESULT[$INPUT]}"
					else
						echo "Dude wrong index..."
				fi
		fi
		
fi
