#!/bin/bash
CURPATH=`pwd`
DIRPATH=$CURPATH/DataTest
IPERFDIR=$DIRPATH/iperfdata_test

if [ $# != 1 ]; then
        echo "Missing number of parameters!"
        echo "Please input:./iperf_server.sh [iperf.txt]"
        echo "  eg. ./iperf_server.sh iperf_gnb_1ue_4mbps_dl.txt"
        exit
fi

if [ ! -d $DIRPATH ];then
        mkdir $DIRPATH
fi

if [ ! -d $IPERFDIR ];then
        mkdir $IPERFDIR
fi

iperf -s -u -i1 | tee $IPERFDIR/$1

echo "iperf data saved to:"$IPERFDIR/$1
