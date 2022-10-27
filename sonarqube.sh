#!/bin/bash

#Author: Donah
#Date: 10/26/2022
#Description:---- Sonaqube install on CentOS 7-----
## Please run this as user vagrant

user_name=`whoami`
if [ $user_name != vagrant ]

then
echo "Must be run as user vagrant !!!!"
exit 1
fi

#Java 11 installation
sudo yum update -y
sudo yum install java-11-openjdk-devel -y
sudo yum install java-11-openjdk -y

###SonarQube Download
cd /opt
sudo yum install wget unzip -y
sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip

##Extracting Packages
sudo unzip /opt/sonarqube-9.3.0.51899.zip

##Change Ownership to user and Switching to Linux
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899
cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64/
##If firewarll is enabled
sudo firewall-cmd --permanent --add-port=9000/tcp
sudo firewall-cmd --reload 
 ./sonar.sh start


echo "Installation done successefully please get the ip address and access your SonarQube on the browser"