#!/bin/sh
## Prework
### sudo apt install bridge-utils dnsmasq
### sudo vim /etc/sysctl.conf
### + net.ipv4.ip_forward = 1
### sudo vim /etc/dnsmasq.conf
### + dhcp-range=192.168.1.50,192.168.1.150,255.255.255.0,12h
sudo brctl addbr br-lan && brctl addif br-lan eth0 && ifconfig br-lan 192.168.1.1 up && ifconfig eth0 0.0.0.0 up && iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
