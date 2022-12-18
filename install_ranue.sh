#!/bin/bash -e
current_path="$PWD"  # same as `pwd`
OAI_ONVM=$(dirname "$PWD")
echo export HOME=OAI_ONVM >> /root/.bashrc

if [ $# != 1 ]; then
	echo "Missing number of parameters!"
	echo "Please input:./install_gnbue.sh ran|ue|both"
	exit
fi

cd $OAI_ONVM/oai-onvm/cmake_targets/
./build_oai -I -w USRP

if [ $1 == "ran" ];then
    ./build_oai -c --gNB -w USRP
elif [ $1 == "ue" ];then
    ./build_oai -c --nrUE -w SIMU
elif [ $1 == "both" ];then
    ./build_oai --gNB --nrUE -w SIMU
else
    echo "Wrong parameter!"
fi

echo -e "\nInstall $1 Succesfully!"



