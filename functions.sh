#!/bin/bash
# This file contains functions that perform tasks that are required at multilple points thoughout the application

function validatemail {		# Validates the email address ensuring it matches a valid email layout and is not a null value
	validemail=false
	while [[ "$validemail" == "false" ]]; do
	        read email
	        if [ -z $email ]	# Prevents null value
	        then
	                echo "Cannot leave blank, please enter a valid email"
	        elif ! [[ "$email" =~ ^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$ ]]	# Ensures valid email layout
	        then
	                echo "Invalid entry, please enter a valid email address"
	        else
	                validemail=true
	                break
	        fi
	done
}

function checknum {		# Ensures value entered is numerical and is not blank
	contactNumber=false
	while [[ "$contactNumber" == "false" ]]; do
	        read phoneNumber
	        re='^[0-9]+$'
	        if [ -z "$phoneNumber" ]	# Prevents null value
	        then
	                echo "Cannot leave blank, please enter a valid phone number"
	        elif ! [[ $phoneNumber =~ $re ]]	# Ensures value entered is numerical. Number format not specified to allow for landlines and international numbers
	        then
	                echo "Invalid entry, please enter a valid phone number"
	        else
	                contactNumber=true	# Ends loop if valid format is entered.
	                break
	        fi
	done
}

function search {	# Search function used in Search.sh Remove.sh and Email.sh for checking entries against existing data file.
	echo ""
        echo "Please enter the name, email, phone number or address of the contact you are looking for:"
        read searchParam
        while [[ -z $searchParam ]]; do		# Cannot search for null values, which are not allowed anywhere in the applicatoin.
                echo "No search entered, please enter a seach parameter"
                read searchParam
        done
        echo ""
        grep -i $searchParam contactDetails.csv | awk 'BEGIN {
							print "The following results matched your search:"
							}
							{print "Name: " $1 " \t Address: " $2 " \t Phone Number: " $3 " \t Email: "$4}
							END {print "Total number of contacts found: " NR}' FS=";"	# Prints out all results from the search along with returning the number of matches to the search.

}
