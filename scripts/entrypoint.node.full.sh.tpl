#!/bin/bash

sudo yum update -y
sudo yum install -y pcre2-devel.x86_64 python gcc python3-devel tzdata curl unzip bash java-11-amazon-corretto htop

# LOCUST
export LOCUST_VERSION="2.9.0"
sudo pip3 install locust==$LOCUST_VERSION


sudo echo "#!/bin/bash" > /etc/profile.d/script.sh
sudo echo "export PATH=\"\$PATH:\$JMETER_BIN\"" >> /etc/profile.d/script.sh
sudo chmod +x /etc/profile.d/script.sh


export PRIVATE_IP=$(hostname -I | awk '{print $1}')
echo "PRIVATE_IP=$PRIVATE_IP" >> /etc/environment

export JVM_ARGS="${JVM_ARGS}"
echo "JVM_ARGS=${JVM_ARGS}" >> /etc/environment

source ~/.bashrc

mkdir -p ~/.ssh
echo 'Host *' > ~/.ssh/config
echo 'StrictHostKeyChecking no' >> ~/.ssh/config

touch /tmp/finished-setup

