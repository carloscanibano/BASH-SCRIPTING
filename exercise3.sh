#!/bin/bash

#Taking care of arguments...
if [ $# -ne 2 ]; then
	echo "This script needs two arguments to work properly";
	exit -1;
fi

#Sorting numbers before the work starts
if [ $1 -gt $2 ]; then
	max=$1;
	min=$2;
else 
	max=$2;
	min=$1;
fi

#This empty string is helpful for adding in one place all the number factors...
result="";

while [ $max -ne $min ]; do
	result+=$(factor $max | cut -d ":" -f 2);
	let max=max-1;
done

#As we don't want repeated numbers in our final output, we need to filter them in any way...
result=$(echo "$result" | tr -c [:alnum:] [\\n\*] | sort -n | uniq);

#For-each loop type for printing our final number list with no repeated numbers
for num in $result; do
	if [ $num -ge $min ]; then
		echo "$num";
	fi
done

exit 0;