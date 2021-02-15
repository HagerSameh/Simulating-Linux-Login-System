#!/usr/bin/sh
read -p "Enter group name you want to delete: " gname
 echo The Group name you just entered is: $gname 
 var_gname=$(cat groups | grep -w $gname)  
  if [[ -z $var_gname ]]
              then
                echo Sorry $gname  not found. 
               else  
        num_of_fields=$(cat groups | grep -w $gname | awk -F: '{print NF}') 
         if [[ $num_of_fields -gt 2 ]] 
         then 
               echo Sorry group: $gname contain members. 
         else  
             sed -i "/^$gname/d" groups 
         fi 
               
fi 
               
    
