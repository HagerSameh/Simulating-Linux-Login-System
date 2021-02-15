#!/usr/bin/sh
read -p "Enter username you want to delete: " uname

 old_row=$(cat users | grep -w ^$uname)  
  if [[ -z $old_row ]]
              then
                echo Sorry $uname  not found. 
               else 
               sed -i -e "/^$uname/d" users  
               old_roww=$(cat groups | grep -w $uname) 
               new_row=$(echo $old_roww | sed  "s/:$uname//"

) 
               sed -i -e "s/$old_roww/$new_row/" groups 
               echo "The User Name you just entered is: $uname successfully deleted

"       
                
fi 
               
    
