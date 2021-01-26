#!/bin/bash
# This is an emailing script used to contact indiviuals or groups fromt he contactDetails file.
. ./functions.sh # Allows for the use of functions from the functions.sh script.

valid=false
until [ "$valid" == "true" ]; do	# While loop implemented to ensure the application doesn't move on before the user is ready or inputs the appropriate command.
	echo "Do you wish to search for a contact to email? Yes/No"
        read searching
        case $searching in	# Read the user input to see what they would like to do, search for contacts or move straight to emailing. Invalid input restarts to loop to prevent crashes
		[yY] | [yY][Ee][Ss] )
			search		# Uses the search function found in the functions.sh shell script file

                        echo ""
                        echo "Would you like to email one or more of these contacts? Yes or No"
                        read option
                        while [[ -z $option ]]; do      # Ensures an option is chosen, does not allow a null entry
				echo "Please choose an option"
                                read option
                        done
                        case $option in         # Nested case, checks if the user would like to email one of the contacts they've searched for or return to the main menu.
                                [yY] | [yY][Ee][Ss] )
					valid=true
                                        ;;

                                [nN] | [nN][Oo] )
                                        echo "Returning to the main menu"
                                        ./menu.sh
                                        ;;
                                * ) echo "Invalid input"	# Invalid inputs cause the while loop to restart, preventing crashes
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
echo "Please enter the email of the individual you wish to contact. For multiple contacts, please separate their emails with only one space"

read email	# Multiple emails can be entered here, null values will trigger the while loop. Emails entered that are not in the database will simply received a "could not deliver" return email.
while [[ -z email ]]; do
	echo "Null value not permitted, please enter at least one valid email"
	read email
done

echo ""
echo "Please enter the subject of the email"

read subject
while [[ -z $subject ]]; do	# Null values not accepted
	echo "Null value not permitted, please enter a subject line"
	read subject
done

echo ""
echo "Please enter your message below. Pressing Return will send the email"

read message
while [[ -z $message ]]; do
	echo "Null value not permitted, please enter a message"
	read message
done


echo $message | mail -s $subject $email		#Eemail is sent using the linux mail component. Invalid email addresses will return as undeliverables.

echo "Email has been sent. Returning to main menu."
