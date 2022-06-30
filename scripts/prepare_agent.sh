#!/bin/bash

# prepare for agent installation
yum -y install git \
               vim \
               java-1.8.0-openjdk

# permit ssh password auth, so from Jenkins when you add a new node you just need to configure the path (/home/vagrant) and add the credentials (user: vagrant, password: vagrant)
sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config \
&& systemctl restart sshd

# disable firewall
systemctl stop firewalld \
&& systemctl disable firewalld
