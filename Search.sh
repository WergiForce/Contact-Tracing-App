#!/bin/bash
#This is the search function for the COVID Tracing Application

while [ "$#" -ne 1 ];
do
	. ./functions.sh	# Sources the search function from functions.sh file
	search			# Search function to search the contactDetails.csv file

	echo ""
	echo "Would you like to run another search? Yes/No"
	read option
	while [[ -z $option ]]; do	# Ensures an option is chosen, does not allow a null entry
		echo "Please choose an option"
		read option
	done
	case $option in		# Checks if the user would like to return to the main menu or continue using the search function
		[yY] | [yY][Ee][Ss] )	# Restarts the search process
			;;

		[nN] | [nN][Oo] )	# Returns to the main menu
			echo ""
			echo "Now returning you to the main menu."
			break;
			;;
	esac
done
