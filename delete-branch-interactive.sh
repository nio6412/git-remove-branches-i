#!/bin/bash

function removeCurrentBranch {
	sed -E '/\*/d'
}

function leftTrim {
	sed -E 's/\*?[[:space:]]+//'
}

function askAndDelete {
	read -p "Delete branch '$1'? (Y/n) " yn
	case $yn in
		[Nn]* ) ;;
		* ) git branch -D $1;;
	esac
}

all_branches=$(git branch | removeCurrentBranch | leftTrim)

for i in $all_branches
do
	askAndDelete $i
done 
