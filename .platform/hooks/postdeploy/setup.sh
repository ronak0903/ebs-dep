#!/bin/bash

set -e

echo "Installing Jenkins..."

yum update -y

wget -O /etc/yum.repos.d/jenkins.repo \
https://pkg.jenkins.io/redhat-stable/jenkins.repo

rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key

dnf install -y fontconfig java-17-amazon-corretto

yum install -y jenkins

echo "Starting services..."

systemctl daemon-reload

systemctl enable docker
systemctl start docker

systemctl enable jenkins
systemctl start jenkins

echo "Docker status:"
systemctl status docker --no-pager || true

echo "Jenkins status:"
systemctl status jenkins --no-pager || true