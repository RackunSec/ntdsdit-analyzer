#!/usr/bin/env bash
# Script to create stats file from hashcat pot and ntds.dit file
# 2021 Douglas Berdeaux @RackunSec
if [[ "$1" = "" ]] || [[ "$2" = "" ]] || [[ "$3" = "" ]] || [[ "$1" = "--help" ]] || [[ "$1" = "-h" ]]
then
        printf "[?] Usage: ./ntdsdit-analyzer hashcat_pot ntds.dit_file output_file\n"
        exit 1
fi
# Check if files exist:
if [[ -f "$1" ]] && [[ -f "$2" ]]
then
        for cracked in $(cat $1);
                do hash=$(echo $cracked|awk -F: '{print $1}') &&\
                        passwd=$(echo $cracked|awk -F: '{print $2}') &&\
                        count=$(grep $hash $2|wc -l) &&\
                        #echo "passwd: $passwd, hash: $hash, count: $count";
                        for i in $(seq 1 $count);
                        do
                                echo $passwd >> $3
                        done
                done;
else
        printf "[!] Error opening files $1 and or $2\n"
        printf "[!] Please ensure they exist and re-run this program.\n"
        exit 1
fi
printf "[!] Program completed.\n"
printf "[#] $(wc -l $3) lines written to $3\n"
echo ""
