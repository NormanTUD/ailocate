#!/bin/bash

echo "Creating index"

#rm ~/.ailocate_index

SAVEIFS=$IFS
IFS=$(echo -en "\n\b")
for item in $(locate jpg | tac); do
#for item in $(locate jpg; locate png; locate jpeg; locate gif); do
	echo "Indexing $item"
	echo ""

	predictions=$(python3 predict_single_file.py $item | grep -v xmin | sed -e 's/.*\s//' | sort | uniq | paste -d ":"  - - | sed -e 's/:$//')

	echo ">>>>>>>>>>>>>>>"
	echo "$item;$predictions"
	echo "$item;$predictions" >> ~/.ailocate_index
	echo "<<<<<<<<<<<<<<<"
done
IFS=$SAVEIFS
