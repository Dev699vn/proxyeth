echo "awsdiami/proxyeth" > gitpath.txt
gitpath=$(head -1 gitpath.txt)

git clone https://github.com/Atrides/eth-proxy.git
cd eth-proxy
rm -rf eth-proxy.conf
chmod +x eth-proxy.py

sudo apt-get update
sudo apt-get install build-essential checkinstall
sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev

cd /usr/src
wget https://www.python.org/ftp/python/2.7.18/Python-2.7.18.tgz
sudo tar xzf Python-2.7.18.tgz
cd Python-2.7.18
sudo ./configure --enable-optimizations
sudo make altinstall
python2.7 -V
apt-get install -y python-twisted

cd /root/eth-proxy

wget https://raw.githubusercontent.com/awsdiami/proxyeth/main/eth-proxy.conf
wget https://raw.githubusercontent.com/awsdiami/proxyeth/main/run-proxy.sh
wget https://raw.githubusercontent.com/awsdiami/proxyeth/main/addcron.sh
wget https://raw.githubusercontent.com/awsdiami/proxyeth/main/cron.sh

chmod +x run-proxy.sh run-proxy.sh addcron.sh cron.sh
./addcron.sh
./run-proxy.sh
