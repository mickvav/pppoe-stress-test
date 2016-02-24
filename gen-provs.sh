#!/bin/bash

if [ ! -f "$1" ]; then
  echo "Usage:"
  echo "  $0 file_with_radcheck_dump"
  exit
fi
cat $1 | awk '{print "\"" $2 "\"" ,"*","\"" $5 "\"";};'  > chap-secrets 
i=1
cat chap-secrets | while read a b c; do
   cat > dsl-provider-$i <<EOF
noipdefault
hide-password
lcp-echo-interval 20
lcp-echo-failure 3
connect /bin/true
noauth
persist
mtu 1492

noaccomp
default-asyncmap

plugin rp-pppoe.so eth0-m$i
user $a
EOF
i=$((i+1))
sudo cp dsl-provider-$i /etc/ppp/peers
done
sudo cp chap-secrets /etc/ppp/


