#!/usr/bin/env bash

# Packages
JAVA="java-1.8.0-openjdk"
JENKINS="jenkins"

# Install JAVA
JAVA_INSTALLED=$(rpm -q $JAVA | grep "is not installed")
echo "Checking for $JAVA: $JAVA_INSTALLED"
if [ "package $JAVA is not installed" == "$JAVA_INSTALLED" ]; then
  yum -y install $JAVA
fi

# Install Wget
WGET_INSTALLED=$(rpm -q wget | grep "is not installed")
echo "Checking for wget: $WGET_INSTALLED"
if [ "package wget is not installed" == "$WGET_INSTALLED" ]; then
  yum -y install wget
fi

# Install Jenkins
JENKINS_INSTALLED=$(rpm -q $JENKINS | grep "is not installed")
echo "Checking for $JENKINS: $JENKINS_INSTALLED"
if [ "package $JENKINS is not installed" == "$JENKINS_INSTALLED" ]; then
  wget --no-check-certificate -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins.io/redhat-stable/jenkins.repo
  rpm --import http://pkg.jenkins.io/redhat-stable/jenkins.io.key
  yum -y install $JENKINS
  systemctl enable $JENKINS
  systemctl start $JENKINS
  echo "Acces the server at http://127.0.0.1:8080"
fi
sleep 10
echo "The initial password is: " $(cat /var/lib/jenkins/secrets/initialAdminPassword)

# Disable firewall
systemctl stop firewalld \
&& systemctl disable firewalld
