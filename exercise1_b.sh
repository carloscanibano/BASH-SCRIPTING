#!/bin/bash

#Taking care of arguments...
if [ $# -ne 1 ]; then
	echo "We only need one argument";
	exit -1;
fi

#Using grep and cut to filter file structure...
result=$(grep -i "[a-z]*:$1:" /etc/group | cut -d ":" -f 4);

if [ -z "$result" -o "$result" == "" ]; then
	echo "-ERROR- No users belong to GID: $1";
	exit -1;
fi

#For-each loop type in case we have more than one user related with a GID
for user in $result; do
	echo "$user";
done

exit 0;