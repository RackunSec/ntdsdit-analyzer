#!/usr/bin/env bash
file=$1
client_name=$2
usage () {
        printf "Usage: ./stats (output file from ntdsdit-analyzer.sh) (client name in quotes)\n"
}
if [[ "$file" == "" ]] || [[ "$client_name" == "" ]]
then
        usage
else
        if [[ -f "$file" ]]
        then
                # start analysis:
                printf -- "------------------------------------------------\n"
                printf "Password byte counts:\n------------------------------------------------\n"
                for byte_count in $(seq 1 16)
                do
                        count=$(egrep -E "^.{$byte_count}\$" $file | wc -l);
                        printf "$byte_count: $count\n"
                done
                count=$(egrep -E '^.{17}' $file|wc -l)
                printf "17+: $count\n"
                printf -- "------------------------------------------------\n"
                count=$(egrep -E '^[A-Z].+[0-9]$' $file|wc -l)
                printf "Passwords with format ^[A-Z].+[0-9]\$: $count\n"
                count=$(egrep -i $client_name $file | wc -l)
                printf "Passwords with client name: $client_name: $count\n"
                count=$(egrep -iE '^(winter|summer|fall|spring)[0-9]{4}$' $file | wc -l)
                printf "Passwords with the format (Spring|Fall|Winter|Summer)YEAR: $count\n"
                printf -- "------------------------------------------------\n"
                printf "\n"
        else
                printf "[!] Could not open file: $file\n"
        fi
fi
