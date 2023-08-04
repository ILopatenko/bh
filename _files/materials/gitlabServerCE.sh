#!/bin/bash
# GITLAB SERVER COMMUNITY EDITION

sudo update && sudo upgrade -y
sudo apt-get install -y curl openssh-server ca-certificates tzdata perl -y
curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash
sudo EXTERNAL_URL="http://gitlab.kitqa.com" apt-get install gitlab-ce -y

echo "NOW YOU CAN LOGIN INTO YOUR GITLAB"
echo "USERNAME: root"
sudo cat /etc/gitlab/initial_root_password | grep Password: