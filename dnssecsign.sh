#!/bin/sh

cd /etc/bind/zones

#script to generate entropy, I just download a large file, as that will allow the kernel to use latency and such to generate entropy (this isnt perfect, but it helps)
/home/gido5731/entropytime.sh >/dev/null &
epid=$?

#/dev/random is good but it blocks, you really want an entropy script or RNG.
dnssec-signzone -3 $(head -c 1000 /dev/random | sha1sum | cut -b 1-16) -N UNIXTIME -o $1 -t db.$1

rndc reload

kill -9 $epid
