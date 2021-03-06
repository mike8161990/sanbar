# Sanbar Website

## Local Setup

Install .NET Core SDK

    wget https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
    sudo dpkg -i packages-microsoft-prod.deb

    sudo apt-get update; \
    sudo apt-get install -y apt-transport-https && \
    sudo apt-get update && \
    sudo apt-get install -y dotnet-sdk-3.1

Install NPM and Angular CLI

    sudo apt install npm
    npm install -g @angular/cli

Install Docker

    sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        software-properties-common
    
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

    sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"

    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io

    sudo usermod -aG docker $USER

    sudo systemctl enable docker

Install Docker-Compose

    sudo curl -L "https://github.com/docker/compose/releases/download/1.27.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

## Remote Host

The production server needs Docker installed as well as access granted to the deployment service account. Uses the commands below to generate the secrets.

    sudo adduser deploy
    sudo usermod -aG docker deploy
    sudo su deploy
    ssh-keygen

## Other Notes

For local development, a self-signed certificate was generated using this command

    openssl req -x509 -newkey rsa:4096 -nodes \
        -subj '/CN=app.mikeschwartz.net' \
        -keyout frontend/test-certs/privkey.pem \
        -out frontend/test-certs/fullchain.pem
