#!/bin/bash

#Taking care of arguments...
if [ $# -ne 2 ]; then
	echo "This script needs two arguments to work properly";
	echo "Usage: ./exercise2_b.sh FILE NUM";
	exit -1;
fi

#Detailed explanation on memoir.pdf
result=$(tr -c [:alnum:] [\\n\*] < $1 | sort | uniq -c | sort -nr | head -$2);

if [ -z "$result" -o "$result" == "" ]; then
	echo "Bad result. Check file existence/correct argument format";
	exit -1;
else 
	echo "$result";
fi

exit 0;