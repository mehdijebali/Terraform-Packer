#!/bin/bash

sudo yum update -y

# Install nginx
sudo amazon-linux-extras enable nginx1
sudo yum clean metadata
sudo yum -y install nginx

# Install docker
sudo yum -y install docker

#Start Nginx & docker 
sudo systemctl enable docker.service
sudo systemctl enable nginx