#!/usr/bin/env bash

DOTFILES_HOME=$(cd `dirname ${BASH_SOURCE[0]}`; pwd)
BASH_PROFILE="$HOME/.bash_profile"

_create_all_file_for () {
	CURRENT_DIR=$(cd  ${DOTFILES_HOME}; pwd)
	CURRENT_DIR+=/$1

	all_file="$CURRENT_DIR/all"

	if [ ! -f "$all_file" ]; then
		echo "generating all file for $1"

		for file in `find "$CURRENT_DIR" -type f`; do
			echo "adding $file to all file"
			
			echo ". $file" >> "$all_file"
		done
	fi
}

_copy_bash_profile() {
	cp -f $DOTFILES_HOME/.bash_profile $BASH_PROFILE
}

_copy_bash_profile

for dir in 'alias' 'completion' 'colors'; do
	_create_all_file_for $dir
done

source $BASH_PROFILE

