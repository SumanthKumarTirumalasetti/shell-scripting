#!/bin/bash
echo $1 $2 $3 $4 $5 $6 $7 $8 $9 #positional aruguments
echo $@ # List of all arguments
echo $# # Number of all arguments
echo $0 # Script name
echo $PWD # present working directory
echo $USER # present working user
echo $HOME # Present user home directory
echo $$ # Process id of current script
sleep 100&
echo $! # Process id of last command in background
echo $? # Exit status of last command