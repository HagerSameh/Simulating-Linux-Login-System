#!/usr/bin/sh
read -p "Enter Group Name: " gname

               echo The Group Name you just entered is: $gname  

              var_gname=$(cat groups | grep -w $gname)
              if [[ -n $var_gname ]]
              then

                echo "Sorry $gname already exists. 

 "
              else
              echo The Group is $gname and is created successfully. 
               echo "$gname:$(cat groups | wc -l| awk '{print $1}')" >> groups   
               


              fi 
