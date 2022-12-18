#!/bin/bash -e
echo "export HOME=/mydata" >> ~/.bashrc
cd $HOME
git clone git@github.com:accel5g/oai-onvm.git
cd oai-onvm
git checkout fix-fake-cu-setupinfo
cd externel
rm -rf openNetVM
git clone https://github.com/accel5g/openNetVM.git
cd openNetVM
git submodule sync
git submodule update --init

#set up Environment
echo "export ONVM_HOME=$(pwd)" >> ~/.bashrc
ls dpdk/config/ 
cd dpdk
echo export RTE_SDK=$(pwd) >> ~/.bashrc
echo export RTE_TARGET=x86_64-native-linuxapp-gcc  >> ~/.bashrc
echo export ONVM_NUM_HUGEPAGES=1024 >> ~/.bashrc
export ONVM_NIC_PCI=" 06:00.0 06:00.1 "
source ~/.bashrc
sudo sh -c "echo 0 > /proc/sys/kernel/randomize_va_space"
cd ../scripts
./install.sh
