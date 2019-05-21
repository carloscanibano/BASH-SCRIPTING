#!/bin/bash

#Taking care of arguments...
if [ $# -eq 0 ]; then
	echo "Need at least one parameter";
	exit -1;
fi

counter=0;
argNumber=$#;

while [ $counter -lt $argNumber ]; do
	#Analyzing the file structure, we look for a pattern with grep and the seventh
	#field splitted with ':'
	result=$(grep -i -m 1 "$1:" /etc/passwd | cut -d ":" -f 7);
	#In case we don't find any related user...
	if [ -z "$result" -a "$result" != " " ]; then
		echo "-ERROR- $1: no such user";
	else
		echo "$1: $result";
	fi

	let counter=counter+1;
	#Shifting arguments helps us to use only the first arg shell variable
	shift
done

exit 0;

