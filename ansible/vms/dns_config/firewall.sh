#!/bin/bash#!/bin/bash

set -x
# set -euo pipefail

systemctl stop firewalld
systemctl disable firewalld
systemctl mask firewalld
sudo apt-get install iptable
systemctl start iptables.service
systemctl enable iptables.service
