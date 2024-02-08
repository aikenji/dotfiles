#!/bin/bash

DOT_FOLDERS=*/

for folder in $DOT_FOLDERS
do
    echo "[-] $folder"
    stow -D -v -t $HOME $folder
done
