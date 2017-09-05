#!/bin/bash

wget -O - https://debmon.org/debmon/repo.key 2>/dev/null | apt-key add - 
echo 'deb http://debmon.org/debmon debmon-jessie main' >/etc/apt/sources.list.d/debmon.list
echo 'deb http://httpredir.debian.org/debian jessie-backports main' >> /etc/apt/sources.list.d/debmon.list
apt-get update  
apt-get install icinga2 -y 
apt-get install nagios-plugins -y 

icinga2 node wizard && systemctl restart  icinga2.service
#vim  /etc/icinga2/zones.conf
#Create zones.conf
#sed  's/ZoneName/$HOSTNAME/g;s/NodeName/$HOSTNAME/g'  /etc/icinga2/zones.conf > /etc/icinga2/zones2.conf
#rm /etc/icinga2/zones.conf
#mv /etc/icinga2/zones2.conf /etc/icinga2/zones.conf
sed -i -e "s#ZoneName#\"$(hostname)\"#g;s#NodeName#\"$(hostname)\"#g" /etc/icinga2/zones.conf




#Restart Ichinga
systemctl restart icinga2.service
