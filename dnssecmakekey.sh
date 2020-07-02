#!/bin/bash

#self explainatory

cd /etc/bind/zones

dnssec-keygen -a ECDSAP384SHA384 -b 8192 -n ZONE $1
dnssec-keygen -f KSK -a ECDSAP384SHA384 -b 8192 -n ZONE $1

export include='$INCLUDE'

for i in `ls K$1*.key`
do
	echo $include $i >> db.$1
done
