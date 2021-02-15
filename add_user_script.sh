#!/usr/bin/sh
PS3=$(printf "Enter your choice: ") 

read -p "Enter username you want to add: " uname

               echo The User Name you just entered is: $uname 
              var_uname=$(cat users | grep -w $uname)
              if [[ -n $var_uname ]]
              then
                echo Sorry $uname already exists. 
              
              else
               read -p "Enter User Password: " upassword

               echo The User Password you just entered is: $upassword 

               read -p "Enter User Group: " ugroup 
               
               echo The User Group you just entered is: $ugroup  
 
               var_ugroup=$(cat groups | grep -w $ugroup)
  
               if [[ -z $var_ugroup ]] 
               then  
                echo Sorry $ugroup not exists.  
 
                
                 select j in "Would you like to add this group" Exit 
                  do 
                  if [[ $j == "Would you like to add this group" ]]  
                  then  
                   bash add_group_script.bash  
                   read -p "Would you like to continue adding this user or exit? c=continue " choice 
                   if [[ $choice == c ]] 
                   then  
                  echo "$uname:$upassword:$(cat users | wc -l| awk '{print $1}'):$ugroup" >> users     
                  sed -i "/^$ugroup/s/$/:$uname/" groups         
                   echo " "
                  echo "The user $uname is created successfully in group $ugroup"
                    
                   fi
                   
                  fi    
         

                     if [[ $j == Exit ]]
                  then 
                   
                   break;
                  fi

              done                     
                   else
               
                  echo "The user $uname is created successfully in group $ugroup"
                   echo "  "
             
        
               fi

              fi
  

