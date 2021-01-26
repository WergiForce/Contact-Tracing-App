#!/bin/bash
#This is the script for removing entries from the contactDetails file.
. ./functions.sh # Allows for use of functions from the specified file

while [ "$#" -ne 1 ];
do
	valid=false
	until [ "$valid" == "true" ]; do	# Until loop used to ensure application does not progress before user is ready to remove a contact
		echo "Do you wish to search for a contact to remove? Yes/No"	# Gives users options to search for a user to remove or continue straight to removal if the email address is already known. Invalid inputs restart the loop.
		read searching
		case $searching in
			[yY] | [yY][Ee][Ss] )
				search		# Implements search function from the functions.sh shell script

				echo ""
			        echo "Would you like to remove one of these contacts? Yes or No"
			        read option
			        while [[ -z $option ]]; do      # Ensures an option is chosen, does not allow a null entry
			                echo "Please choose an option"
			                read option
			        done
			        case $option in         # Checks if the user would like to return to the main menu or continue using the search function. Invalid inputs restart the loop.
			                [yY] | [yY][Ee][Ss] )
						valid=true	# Sets value of ̈́'valid' to true, ending the loop.
			                        ;;

			                [nN] | [nN][Oo] )
						echo "Returning to the main menu"
			                        ./menu.sh	# Returns the user to the main menu.
						;;
					* ) echo "Invalid input"
					   ;;
		        	esac
				;;
			[nN] | [nN][Oo] )
				valid=true
				;;
			* ) echo "Invalid input"
			    ;;
		esac
	done

	echo ""
	echo "Please enter the email of the contact you wish to remove."
	validatemail	# Uses the validatemail funciton from the functions.sh file to ensure the value entered matches the required format.

	isInDB=$(grep -i -c $email contactDetails.csv)	# Searches the contactDetails.csv file to ensure that the email entered is in the database.
	while [[ $isInDB = 0 ]]; do	# If the email entered is not in the database, it must be entered again.
		echo "Invalid input, please enter an email for a contact that is stored in the database"
		validatemail
		isInDB=$(grep -i -c $email contactDetails.csv)
	done

	sure=no		# Double checking the user wishes to remove the specified email address. Blanks and invalid inputs restart the loop.
	until [ "$sure" == "yes" ]; do
		echo "Are you sure you want to remove $email from the database? Please answer yes or no. No will return you to the main menu"
		read check
		case $check in
			[yY] | [yY][Ee][Ss] )
				sed -i "/${email,,}/d" contactDetails.csv	# Removes the details associated with the email entered. Email is set to lower case to avoid errors
				sure=yes
				;;
			[nN] | [nN][Oo] )
				echo "Returning to the main menu"
				./menu.sh
				;;
			* ) echo "Invalid input"
			    ;;
		esac
	done

	echo ""
	echo "$email has been removed from the system. Would you like to remove another record? Yes/No"         # Asks the user if they would like to remove another contact, allowing several contacts to be removed without returning to the main menu.
	another=false
	until [ "$another" = "true" ]; do	# Loop ensures a valid input is used. This menu can restart the removal process or return the user to the main menu. Invalid input restarts the loop.
		read response
		while [[ -z $response ]]; do
			echo "Please enter a response, yes or no"
			read response
		done

		case $response in
			[yY] | [yY][Ee][Ss] )
				another=true	# Starts remove process again, allowing user to search for the next user to remove or move straight to removal.
				;;
			[nN] | [nN][Oo] )
				echo "Returning you to the main menu"
				./menu.sh
				;;
			*) echo "Invalid input, please input a valid response"
			   ;;
		esac
	done
done
