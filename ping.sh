#!/bin/bash
CURPATH=`pwd`
DIRPATH=$CURPATH/DataTest
pingDIR=$DIRPATH/ping_report
TIME=60

if [ $# != 2 ]; then
        echo "Missing number of parameters!"
        echo "Please input:./ping.sh [ip address] [ping.txt]"
        echo "  eg. ./ping.sh 10.45.0.1 ping_gnb_1ue_4mbps_dl.txt"
        exit
fi

if [ ! -d $DIRPATH ];then
        mkdir $DIRPATH
fi

if [ ! -d $pingDIR ];then
        mkdir $pingDIR
fi

ping $1 -c $TIME| tee $pingDIR/$2

