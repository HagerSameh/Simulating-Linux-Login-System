#!/usr/bin/sh

function loginUser {
read -p "Enter user name: " uname
read -p "Enter password: " password

 

# search if user, and pw already exist
uexist=$(cat users | grep -w ^$uname | cut -d: -f1)
upwexist=$(cat users | grep -w ^$uname":"$password | cut -d: -f2) 

 

if [[ $uname == $uexist ]]
then

     

    if [[ $password == $upwexist ]]
    then

      
     GROUP=$(cat users | grep -w ^$uname | cut -d: -f4)
    PS3="[$uname@localhost $GROUP]"
    echo -e "you are logged in."

 

    else
        echo wrong password.
    fi
else
    echo user not exist.

 

fi

}



PS3="[$USER Enter choice:] "
 Flage=0

 while [[ $Flage  -eq  0 ]]
 do
select i in "Add User" "Add Group" "Remove User" "Remove Group" "Test Login" "Change Password" Exit

               do
         if [[ $i == "Add User" ]] 
            then 
             clear; 

              ./add_user_script.sh
 
              break
            fi
 


              if [[ $i == "Add Group" ]] 
             then 
             clear; 
             ./add_group_script.sh 
              break
            fi 
             
             if [[ $i == "Remove User" ]] 
            then 
             clear; 
               ./remove_user_script.sh  
              break
            fi 


               if [[ $i == "Remove Group" ]] 
            then 
             clear; 
             ./remove_group_script.sh 
              break
            fi 

             if [[ $i == "Test Login" ]] 
            then 
             clear; 
                  loginUser
              
           break
              
            fi  
 
               if [[ $i == "Change Password" ]] 
            then 
             clear; 
             ./change_password_script.sh 
              break
            fi 



                 if [[ $i == "Exit" ]]
            then
                Flage=1
              break
                fi

             done
        done

