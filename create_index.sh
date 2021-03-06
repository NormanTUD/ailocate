#!/bin/bash

echo "Creating index"

#rm ~/.ailocate_index

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for item in $(locate $HOME | egrep -i "\.\(jpe?g|gif|png)$" | grep -v '/\.' ); do
	echo "Indexing $item"
	echo ""

	if grep -q "$item" ~/.ailocate_index; then
		echo "$item already indexe in ~/.ailocate_index"
	else
		predictions=$(python3 predict_single_file.py $item | grep -v xmin | sed -e 's/.*\s//' | sort | uniq | paste -d ":"  - - | sed -e 's/:$//')
	fi

	echo ">>>>>>>>>>>>>>>"
	echo "$item;$predictions"
	echo "$item;$predictions" >> ~/.ailocate_index
	echo "<<<<<<<<<<<<<<<"
done
IFS=$SAVEIFS
