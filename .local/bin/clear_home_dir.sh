#!/bin/bash

remove_file() {
	rm ${HOME}/"$1" &> /dev/null
}

remove_dir() {
	rm -r ${HOME}/"$1" &> /dev/null
}

remove_file .python_history
remove_file .viminfo
remove_file .fehbg

remove_dir .pki
remove_dir .gnupg
