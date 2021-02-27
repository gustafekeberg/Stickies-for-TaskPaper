#!/bin/zsh

if [[ -z "$1" || -z "$2" ]]; then
	echo Missing script input: '<src dir>' '<dst dir>'
	return
fi
src=$1
dst=$2

name="Daily Driver"

themes=(default
	yellow
	dark
	grey
	green
	orange
	pink
	blue)

# cd $1

for (( i = 1; i <= $#themes; i++ ))
do
	currentfilename="${dst}/${name}-${themes[i]}.less"
	echo "Writing:" $currentfilename

	printf "// src: ${name}.less"		> $currentfilename
	printf "\n\n" 						>> $currentfilename
	cat "${src}/${name}.less" 			>> $currentfilename
	printf "\n\n" 						>> $currentfilename
	printf "// src: _${themes[i]}.less"	>> $currentfilename
	printf "\n\n" 						>> $currentfilename
	cat "${src}/_${themes[i]}.less" 	>> $currentfilename
done