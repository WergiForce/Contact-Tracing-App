**COVID-19 Tracing Application**

Welcome to the COVID-19 Contact Tracing Application. This application is written in bash/shell script and was originally designed for use from the linux command line.

Files included are listed below:

| menu.sh | This is the main menu and operating script for the application, all other scripts can be executed from here, and once their process is complete, they return to this menu. |
| --- | --- |
| AddContact.sh | This is the script which allows entry of new contacts to the contactDetails.csv file, with prompts guiding the user to enter the relevant information at the approriate time. There are error checks within this script to prevent entering null or invalid values. |
| Search.sh | This script allows the user to search for the details of previously entered contacts. |
| Remove.sh | This script allows the removal of contact entries should it be required or requested. Allows the user to search for the contact prior to removal. |
| Email.sh | This script allows for an email to be sent to contacts contained withing the contactDetails.csv file, should they need to be contacted. Allows for searching of contact details if an email address is not known. |
| Functions.sh | A script containing several functions that are used within different scripts of the application, to cut down on the amount of duplicated code from script to script. |
| contactDetails.csv | A .csv file used to store contact information for later lookup, reference, contact or deletion. |

**App Function**

To start the app, execute the menu.sh file in the terminal. This will display a menu, giving you several options.

Pressing 1 will execute the AddContact.sh file, simply follow the on screen prompts to enter in the contact details as needed. Invalid or null values are not allowed in the contact detail fields, and the program will prompt a valid entry. Once entry is completed, you will be given a summary of the details entered. At this point, you can submit the entry, or correct any mistakes that may have been made. Submitting an entry will return you to the main menu.

Pressing 2 will execute the Search.sh file, bringing you to the search function of the application. You can enter any aspect of a contact&#39;s details to search for them. Once the search is complete, you will be asked if you wish to search again or return to the main menu.

Pressing 3 will execute the Remove.sh file, bringing you to the remove function of the application, used to remove contacts for any reason. You are given an opportunity ot seach for a contact&#39;s details before removal, as removal is done using the contact&#39;s email address as a unique identifier. You can skip the search if the email is known. Once the deletion is complete you can perform another one or return to the main menu.

Pressing 4 will execute the Email.sh file, bringing you to the email function of the application. You are given the opportunity to search for a contact&#39;s details if required. Follow the on screen prompts to construct the email and it will be sent on completion of this process.

Pressing 5 will exit the program and return you to the project folder within the terminal.

**Known Issues/Bugs**

Some constraints to phone and email format, perhaps too restritive, will not allow some formats that may in fact be valid in real world situation.

Remove menu still offers to remove contacts even if no contact matches the entered email address.

Some UI and messaging improvements could be beneficial to the overall application. Further testing required.
