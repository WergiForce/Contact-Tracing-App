#!/bin/bash
# This is the shell script for the contact tracing app menu

figlet "COVID-19";
figlet "Contact Tracing";

while [ "$#" -ne 1 ];	# Infinite while loop to return to main menu until the user chooses to quit
do
	echo ""
	echo "Please select on of the following options by entering in the corresponding number:";
	echo "1) Add New Contact";
	echo "2) Find Contact";
	echo "3) Remove Contact";
	echo "4) Email Contact";
	echo "5) Quit";
	echo ""
	echo "Please note that at any point in the application you can press Ctrl+C to exit the program. You can then restart it to access the main menu"
	read option

	case $option in
		[1] )
			./AddContact.sh # Add a new contact using the AddContact shell script
			;;
		[2] )
			./Search.sh # Search for a contact using the Search shell script
			;;
		[3] )
			./Remove.sh # Remove a contact using the Remove shell script
			;;
		[4] )
			./Email.sh # Email one or more contacts using the Email shell script
			;;
		[5] )
			echo "Thank you for using the COVID Tracing Application. Stay positive and test negative!";
			kill 0;	# Exits the application
			;;
		*) echo "Invalid input, please choose an option" # Returns a set response if an invalid input is used to avoid crashes or error. Redirects to the main menu.
		   ;;
	esac
done
