# ntdsdit-analyzer
Coorelate Hashcat pot with ntds.dit secretsdump.py output file. Hashcat will produce a file with unique `hash:password` lines. This program will search the Impacket `secretsdump.py` generated file for the hash and for each find it will append the password to the `output_file`. This is useful if you use Pipal to analyze AD passwords for your clients.
## USAGE
```
chmod +x ./ntdsdit-analyzer.sh
./ntdsdit-analyzer.sh hashcat_pot ntds.dit_file output_file
```
