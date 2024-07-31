#!/bin/bash

#Script should be execute with sudo/root access.
if [[ "${UID}" -ne 0 ]]
then
	echo "Please run with sudo or root"
	exit 1
fi

#User should provide atleast one argument as username else guide him.

if [[ "${#}" -lt 1 ]]
then
	echo "Usage: ${0} USER_NAME [COMMENT].."
	echo "Create a user with name USER_NAME and comments field of COMMENT"
	exit 1
fi
#Store 1st argument as user name

USER_NAME="${1}"
echo "User_name:$USER_NAME"

#In case of more then one argument store is as account commants

shift
COMMENT="${@}"

#Create a password

PASSWORD=$(date +%s%N)
echo $PASSWORD 

#Create The User 

useradd -c $COMMENT -m $USER_NAME

#Check if user is successfuly create or not.

if [[ $? -ne 0 ]]
then
	echo "The account cloud not be created"
	exit 1

#set the password for the user.
passwd $USER_NAME

#Check if password is successfully set or not

if [[ $? -ne 0 ]]
then
	echo "Password cloud not be set"
	exit 1
fi

#Force password change on first login.

#Display the username, password, and the host where user create.

