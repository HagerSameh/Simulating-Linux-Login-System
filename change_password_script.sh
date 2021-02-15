#!/usr/bin/sh

# changepassword
read -p "Enter user name: " uname
read -p "Enter old password: " old_password
read -p "Enter new password: " new_password

# search if user, and pw already exist
uexist=$(cat users | grep -w ^$uname | cut -d: -f1)
upwexist=$(cat users | grep -w ^$uname":"$old_password | cut -d: -f2) 

if [[ $uname == $uexist ]]
then
	if [[ $old_password == $upwexist ]]
	then
		sed -i  "s/$uname:$old_password/$uname:$new_password/g" users # replace old with new 
                echo Password is updated successfully.
	else
		echo wrong password
	fi
else
	echo user not exist
fi


