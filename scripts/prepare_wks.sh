#!/usr/bin/env bash

# Packages
GIT="git"
UNZIP="unzip"
JAVA="java-1.8.0-openjdk"
GRADLE="gradle"

# Install Git
GIT_INSTALLED=$(rpm -q $GIT | grep "is not installed")
echo "Checking for $GIT: $GIT_INSTALLED"
if [ "package $GIT is not installed" == "$GIT_INSTALLED" ]; then
  yum -y install $GIT
fi

# Install Wget
WGET_INSTALLED=$(rpm -q wget | grep "is not installed")
echo "Checking for wget: $WGET_INSTALLED"
if [ "package wget is not installed" == "$WGET_INSTALLED" ]; then
  yum -y install wget
fi

# Install unzip
UNZIP_INSTALLED=$(rpm -q $UNZIP | grep "is not installed")
echo "Checking for $UNZIP: $UNZIP_INSTALLED"
if [ "package $UNZIP is not installed" == "$UNZIP_INSTALLED" ]; then
  yum -y install $UNZIP
fi

# Install JAVA
JAVA_INSTALLED=$(rpm -q $JAVA | grep "is not installed")
echo "Checking for $JAVA: $JAVA_INSTALLED"
if [ "package $JAVA is not installed" == "$JAVA_INSTALLED" ]; then
  yum -y install $JAVA
fi

# Install Gradle
GRADLE_INSTALLED=$(gradle --version | grep -i "$GRADLE")
echo "Checking for $GRADLE: $GRADLE_INSTALLED"
if [ "" == "$GRADLE_INSTALLED" ]; then
  wget -O ~/gradle-4.7-bin.zip https://services.gradle.org/distributions/gradle-4.7-bin.zip
  mkdir /opt/gradle
  unzip -d /opt/gradle/ ~/gradle-4.7-bin.zip
  echo "export PATH=$PATH:/opt/gradle/gradle-4.7/bin" > /etc/profile.d/gradle.sh
  chmod 755 /etc/profile.d/gradle.sh
fi