#!/bin/zsh

if [[ -z "$1" || -z "$2" ]]; then
	echo Missing script input: '<src dir>' '<dst dir>'
	return
fi
src=$1
dst=$2

commonfile="Daily Driver.less"
stylename="Daily Driver"

cd $src
for file in _*.less
do
	currentthemename=$(echo "${file}" | awk '{gsub("_","")} {print $0}')
	
	currentfilename="${dst}/${stylename}-${currentthemename}"
	echo "Writing:" $currentfilename

	printf "// src: ${commonfile}"	> $currentfilename
	printf "\n\n" 					>> $currentfilename
	cat "${src}/${commonfile}" 		>> $currentfilename
	printf "\n\n" 					>> $currentfilename
	printf "// src: ${file}"		>> $currentfilename
	printf "\n\n" 					>> $currentfilename
	cat "${src}/${file}" 			>> $currentfilename
done