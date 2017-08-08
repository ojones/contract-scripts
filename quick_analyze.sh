#!/bin/bash

# Counts and sorts structs and functions within solidity contract
# Take 1 argument which is the filepath of the file you want to analyze
# Only works on solidty contracts
# Only tested on Giveth Vault.sol and VaultController.sol

FILE=$1

printf "\n"
printf "Quick analysis of contract code...\n\n"

printf "List line counts of each found struct:\n"

awk '/^ *struct/ { print $0 }' $FILE | sed 's/^.*struct//' | sed 's/[{].*$//' | sed '/^[[:blank:]]*$/d' | while read -r line; do  echo $(cat $FILE | grep -c "$line") $(echo $line); done | sort -nr

printf "\n"
printf "List line counts of each found function:\n"

awk '/^ *function/ { print $0 }' $FILE | sed 's/^.*function//' | sed 's/[(].*$//' | sed '/^[[:blank:]]*$/d' | while read -r line; do echo $(cat $FILE | grep -c "$line") $(echo $line); done | sort -nr
