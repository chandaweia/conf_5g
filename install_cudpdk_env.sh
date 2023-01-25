#!/bin/bash -e
OAI_ONVM=/mydata
echo "export HOME=/mydata" >> ~/.bashrc
source ~/.bashrc

git config --global user.name "cuidi"
git config --global user.email "cuidi@gwu.edu"

cd $HOME/oai-onvm
git checkout cu-dpdk-uldl
sudo apt-get install build-essential linux-headers-$(uname -r) git bc gcc make pkg-config
sudo apt-get install libnuma-dev
cd $HOME/oai-onvm/externel
git clone https://github.com/accel5g/openNetVM.git
cd openNetVM
git submodule sync
git submodule update --init
echo export ONVM_HOME=$(pwd) >> /root/.bashrc
cd dpdk
echo export RTE_SDK=$(pwd) >> /root/.bashrc
echo export RTE_TARGET=x86_64-native-linuxapp-gcc  >> /root/.bashrc
echo export ONVM_NUM_HUGEPAGES=1024 >> /root/.bashrc
echo  export ONVM_NIC_PCI=" 06:00.0 06:00.1 " >> /root/.bashrc
source /root/.bashrc
sudo sh -c "echo 0 > /proc/sys/kernel/randomize_va_space"
cd $HOME/oai-onvm/externel/openNetVM/scripts
./install.sh
cd $HOME/oai-onvm/externel/openNetVM/onvm
make
