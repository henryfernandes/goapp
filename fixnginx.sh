#!/bin/bash
h1=`sudo docker inspect app1 | grep IPA | grep -v Sec | awk -F"\"" '{print $4}'`; sed -i "s/h1/${host1}/g" nginx/default.conf
h2=`sudo docker inspect app2 | grep IPA | grep -v Sec | awk -F"\"" '{print $4}'`; sed -i "s/h2/${host2}/g" nginx/default.conf

