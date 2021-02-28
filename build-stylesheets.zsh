#!/bin/zsh

if [[ -z "$1" || -z "$2" ]]; then
	echo Missing script input: '<src dir>' '<dst dir>'
	return
fi

src=$1
dst=$2

commonfile="Daily Driver.less"
stylename="Daily Driver"
themes=(blue green grey orange pink purple red white yellow)

for theme in $themes
do
	currentfilename="${dst}/${stylename}-${theme}.less"
	echo "Writing:" $currentfilename
	cat "${src}/${commonfile}" 			> $currentfilename
	printf "\n\n" 						>> $currentfilename
	printf "@set-theme: '${theme}';"	>> $currentfilename
done