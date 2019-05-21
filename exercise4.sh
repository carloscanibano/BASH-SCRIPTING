#!/bin/bash

#Taking care of arguments...
if [ ! -d "$1" ]; then
	echo "Script needs only one parameter and must be a existing directory";
	exit -1;
fi

#Special loop type that finds any file ending with '.jpg' and not splitting results with 
#a blank space for later wc operation.
find $1 -name "*[.]jpg" | while read f 
do
	file_size=$(wc -c < "$f");
	#1048576 B = 1 MB
	if [ "$file_size" -gt 1048576 ]; then
		mogrify -resize 750 "$f";
		echo "$f";
	fi
done

exit 0;