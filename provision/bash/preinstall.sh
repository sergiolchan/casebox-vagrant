#!/usr/bin/env bash
echo -e "\n[*] Fix name server.\n"
echo "nameserver 8.8.8.8" > /etc/resolv.conf
apt-get update --fix-missing;
echo -e "\n[*] Install python-pip, python-dev, git, curl, wget, nano.\n"
apt-get install -y build-essential libssl-dev libffi-dev python-dev python-pip git curl wget nano;
pip install --upgrade setuptools;
echo -e "\n[*] Install markupsafe.\n"
pip install markupsafe;
echo -e "\n[*] Install ansible.\n"
pip install ansible;
echo -e "\n[*] Autoremove unused software .\n"
echo -e "Downloading and Installing Java 8"
mkdir /opt/javainstaller
wget http://interact.com.mx/java/jdk-8u121-linux-i586.tar.gz -P /opt/javainstaller/
wget http://interact.com.mx/java/ujavainstaller.sh -P /opt/javainstaller/
chmod +x /opt/javainstaller/ujavainstaller.sh
/opt/javainstaller/ujavainstaller.sh /opt/javainstaller/jdk-8u121-linux-i586.tar.gz
apt-get autoremove -y;
echo -e "\n[x] Done.\n"
