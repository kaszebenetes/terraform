#!/bin/bash

set -x
# set -euo pipefail


systemctl stop firewalld
systemctl disable firewalld
systemctl mask firewalld
sudo apt-get install iptable
systemctl start iptables.service
systemctl enable iptables.service

iptables -I OUTPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -I INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -I INPUT -p tcp -s 10.0.2.4 --dport 22 -j ACCEPT
iptables -I INPUT -p tcp -s 10.0.1.4 --dport 80 -j ACCEPT
iptables -I OUTPUT -p tcp --dport 80 -j ACCEPT
iptables -I OUTPUT -p tcp --dport 443 -j ACCEPT
iptables -I OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -j DROP
iptables -A OUTPUT -j DROP

sudo bash -c "iptables-save > /etc/sysconfig/iptables"
