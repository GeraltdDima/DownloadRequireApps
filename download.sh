#!/bin/bash

sudo apt update && sudo apt updrade

echo "Download wget"
sudo apt install wget
echo "Finished"

echo "Download google chrome deb package"
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O google-chrome.deb
echo "Finished"

echo "Download visual studio code deb package"
wget https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64 -O vscode.deb
echo "Finished"

echo "Download discord deb package"
wget https://discord.com/api/download?platform=linux&format=deb -O discord.deb
echo "Finished"

echo "Download whatsapp deb package"
wget https://web.whatsapp.com/download/desktop/linux -O whatsapp.deb
echo "Finished"

echo "Download dotnet tar.gz file"
wget https://download.visualstudio.microsoft.com/download/pr/2c5c94e4-3b77-4f0e-bb93-4a42f7b6da74/ea2d87b680b7ed659bba196bc9f97411/dotnet-sdk-7.0.100-linux-x64.tar.gz -O dotnet-sdk.tar.gz
echo "Finished"

echo "Download jetbrains toolbox tar.gz file"
wget https://download.jetbrains.com/toolbox/jetbrains-toolbox-1.27.0.13406.tar.gz -O jetbrains-toolbox.tar.gz
echo "Finished"

echo "Install apps:"

sudo apt-get install ./google-chrome.deb
sudo apt-get install ./vscode.deb
sudo apt-get install ./whatsapp.deb
sudo apt-get install ./discord.deb

echo "Finished installation apps"

echo "Download tar"
sudo apt install tar
echo "Finished"

echo "Download docker"

for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker $USER
newgrp docker

echo "Test docker"
sudo docker run hello-world
echo "Docker installation finished"

echo "Download my sql-server"
sudo apt install mysql-server
echo "Finished"

echo "Move toolbox and dotnet to home"
mv ./dotnet-sdk.tar.gz $HOME
mv ./jetbrains-toolox.tar.gz $HOME

cd $HOME

echo "Install dotnet"
mkdir ~/dotnet
mv ~/dotnet-sdk.tar.gz ~/dotnet

cd ~/dotnet

tar -xzvf ./dotnet-sdk.tar.gz
rm ./dotnet-sdk.tar.gz

cd $HOME

echo "Next you need to do it"
cat ~/.bashrc

echo "Set at the end it"

echo "export DOTNET_ROOT=$HOME/dotnet"
echo "export PATH=$PATH:$HOME/dotnet"

echo "Dotnet installation finished"

echo "Download jetbrains-toolbox"
mkdir ~/jetbrains-toolbox

mv ~/jetbrains-toolbox.tar.gz ~/jetbrains-toolbox

cd ~/jetbrains-toolbox
tar -xzvf ./jetbrains-toolbox.tar.gz

echo "Jetbrains toolbox installation finished"
echo "Every process has been finished successfly"

echo "Thanks for using"
