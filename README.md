# DNSSEC-autosign
Script to automatically sign dnssec



## How this works
This requires that your zone files are in /etc/bind/zones and are in the format of db.{FQDN} without the trailing period (`.`).

The entropytime.sh is hard mapped to my home directory, so you will have to modify your script to work with this

dnssecmakekey.sh: This takes the domain as the input and creates the zone keys, then includes the keys in the zone file. You will have to change your named.conf to point to the .signed version of the zone file, but I am not eager enough to automate that.

dnssecsign.sh: This simply resigns the zones and then replaces the serial number with the current unix time. I use this instead of incrementing since it does not edit the original zone file so the serial will not increase past n+1, where n is the original serial number, unless the zone is incremented before the expiration. This also takes the domain as the input, and has all the same filename requirements as the previous script.

entropytime.sh: This is just a cheap way to create entropy. This helps for doing many at a time, as /dev/random blocks, but is definitely more secure, which I took as a large priority. I did, however, increase my entropy pool.
