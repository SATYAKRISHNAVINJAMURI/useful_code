#!/bin/bash
far(){
	if [[ $# -ne 3 ]];
       	then
	    echo "Insufficient parameters. Usage far <file_path> <find_text> <text to be replace>"	     
	fi		
	file=$1
	find_text=$2
	replace_text=$3	
	if [[ -d $file ]]; then
		if [ -z "$(ls -A "$file")" ]; then
			:
   		else
			for in_file in "$file"/*
    			do
    				if [ -d "$in_file" ]
 				then
            				far "$in_file" "$find_text" "$replace_text"
				else
					sed -i -e "s/$find_text/$replace_text/g" $in_file
    				fi
   			done
		fi
	elif [[ -f $file ]]; then
  			sed -i -e "s/$find_text/$replace_text/g" $file
	else
    		echo "$file is not valid"
    		exit 1
	fi
			
}
