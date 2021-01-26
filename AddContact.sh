#!/bin/bash
# This is the AddContact function for the COVID-19 Tracing Application

echo ""
echo "Now adding a new contact. Please follow the prompts and ensure all fields are completed"

echo "Please enter the new contact's full name:";
read contactName
while [[ -z $contactName ]]; do		# Preventing blank value from being entered. This method is used thoughout the application.
	echo "Cannot leave blank, please enter the contact name"
	read contactName
done

echo "Please enter contact address";
read address
while [[ -z $address ]]; do
	echo "Cannot leave blank, please enter the contact address"
	read address
done

echo "Please enter contact phone number";
. ./functions.sh	# Sources functions from the functions.sh shell script.
checknum		# Reads in the phone number and checks that it is a number, does not accept blanks or entries that are not numbers

echo "Please enter contact email address";
validatemail		# Reads in the email address, ensuring it follows the format example@example.domain

while [ "$#" -ne 1 ];	#Infinite loop to allow for multiple corrections to be made until entry is correct and the loop is broken.
do
	echo "";
	echo "The details you have entered are:";
	echo "Name: $contactName; Address: $address; Phone Number: $phoneNumber; Email: $email";
	echo "Are these details correct? Yes/No";
	read correct

	case $correct in	# Case statement nested in while loop to allow for option to correct or complete the entry
		[yY] | [yY][Ee][Ss] )
			echo $contactName ";" $address ";" $phoneNumber ";" ${email,,} >> ./contactDetails.csv;	# New contact is added to the contactDetails file
			echo "$contactName has been saved. Returning to the main menu"
       			break;	# Loop broken allowing return to the main menu
			;;
		[nN] | [nN][Oo] )
			echo "Which detail would you like to correct?";
			echo "1) Name";
			echo "2) Address";
			echo "3) Phone Number";
			echo "4) Email";
			read correction

			case $correction in	# Nested case statement to allow edit of specific entry value rather than redoing whole entry
				[1] )
					echo "Please enter the corrected name:"
					read contactName
					while [[ -z $contactName ]]; do
					        echo "Cannot leave blank, please enter the contact name"
        					read contactName
					done
					;;
				[2] )
					echo "Please enter the corrected address:"
					read address
					while [[ -z $address ]]; do
                                                echo "Cannot leave blank, please enter the contact address"
                                                read address
                                        done
					;;
				[3] )
					echo "Please enter the corrected phone number:"
					checknum
					;;
				[4] )
					echo "Please enter the corrected email:"
					validatemail
					;;

				*) echo "invalid input"
				   ;;
			esac
	esac
done

