#!/bin/bash

minlan=1
maxlan=1000
for i in `seq $minlan $maxlan`; do 
   ifconfig eth0-m$i down
  ip link del link br0 dev eth0-m$i
done


