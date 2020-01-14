#! /bin/bash
set -e

echo "Install dependencies"
echo $SYS_PASSWORD | sudo apt install apt-transport-https ca-certificates curl software-properties-common
echo "Done"

echo "Add key"
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | echo $SYS_PASSWORD | sudo apt-key add -
curl -O https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo $SYS_PASSWORD | sudo apt-key add  apt-key.gpg
echo "Done"

echo "Verify key"
echo $SYS_PASSWORD | sudo apt-key fingerprint 0EBFCD88
echo "Done"

echo "Add apt repository"
echo $SYS_PASSWORD | sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo "Done"

echo "System Update Again"
echo $SYS_PASSWORD | sudo apt update
echo "Done"

echo "Install Docker CE"
echo $SYS_PASSWORD | sudo apt  install docker-ce
echo "Done"

echo "Add user to group"
echo $SYS_PASSWORD | sudo -aG docker $USER
echo "Done"
