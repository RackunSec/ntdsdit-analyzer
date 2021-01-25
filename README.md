# ntdsdit-analyzer
Coorelate Hashcat pot with ntds.dit secretsdump.py output file. Hashcat will produce a file with unique `hash:password` lines. This program will search the Impacket `secretsdump.py` generated file for the hash and for each find it will append the password to the `output_file`. This is useful if you use Pipal to analyze AD passwords for your clients.
## USAGE
### CREATE PASSWORD FILE
```
chmod +x ./ntdsdit-analyzer.sh
./ntdsdit-analyzer.sh hashcat_pot ntds.dit_file output_file
```
### STATS
Once you have the password file, `output_file`, run the `stats.sh` file against it like so:
```
chmod +x ./stats.sh
./stats.sh output_file "Client 2"
```
