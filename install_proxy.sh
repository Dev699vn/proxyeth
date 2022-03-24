#!/bin/bash
#Ubuntu tren DO, su dung thu muc root , nhung ubuntu khac thay /home/ubuntu
cd /root
echo "awsdiami/proxyeth" > gitpath.txt
gitpath=$(head -1 gitpath.txt)

wget https://raw.githubusercontent.com/awsdiami/proxyeth/main/view.sh
chmod +x view.sh

git clone https://github.com/Atrides/eth-proxy.git
cd eth-proxy/

rm -rf eth-proxy.conf
chmod +x eth-proxy.py

wget https://raw.githubusercontent.com/awsdiami/proxyeth/main/eth-proxy.conf
wget https://raw.githubusercontent.com/awsdiami/proxyeth/main/run-proxy.sh
wget https://raw.githubusercontent.com/awsdiami/proxyeth/main/addcron.sh
wget https://raw.githubusercontent.com/awsdiami/proxyeth/main/cron.sh
chmod +x run-proxy.sh addcron.sh cron.sh

sudo apt-get update -y
sudo apt-get install -y build-essential checkinstall
sudo apt-get install -y libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

cd /usr/src
PythonVersion="Python-2.7.18"
wget https://www.python.org/ftp/python/2.7.18/$PythonVersion.tgz
sudo tar xzf $PythonVersion.tgz
cd $PythonVersion/
sudo ./configure --enable-optimizations
sleep 2
echo ""
sudo make altinstall
sleep 2
echo ""
#python2.7 -V
#sudo apt install -y python3
sudo apt-get install -y python-twisted
sleep 3
cd /root/eth-proxy
./addcron.sh
./run-proxy.sh

echo "done"
cd ..
./view.sh