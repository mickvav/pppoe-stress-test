#!/bin/bash

minlan=1
maxlan=1000
for i in `seq $minlan $maxlan`; do 
  ip link add link br0 dev eth0-m$i type macvlan
  ifconfig eth0-m$i up
done


