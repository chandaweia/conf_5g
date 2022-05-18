#/bin/bash
#RUN COMMAND: ./run_perf.sh perf_gnb_1ue_4mbps_dl.data cpu_1_ue_4_mbps_ul_gnb.txt 
#OUTPUT: (1)perf_gnb_1ue_4mbps_dl.data   and   (2)perf_gnb_1ue_4mbps_dl.data-data.txt
#OUTPUT: cpu_1_ue_4_mbps_ul_gnb.txt

CURPATH=`pwd`
DIRPATH=$CURPATH/perfdata_test
DIRTXT=$DIRPATH/perfreport_test
CPUDIR=$CURPATH/cpuusage_test
TIME=60

if [ $# != 1 ]; then
	echo "Missing number of parameters!"
	echo "Please input:./run_perf.sh [perf.data]"
	exit
fi

if [ ! -d $DIRPATH ];then
	mkdir $DIRPATH
fi
echo "perf data will save to:"$DIRPATH/$1

if [ ! -d $DIRTXT ];then
        mkdir $DIRTXT
fi
echo "perf report will save to:"$DIRTXT/$1-data.txt

sudo perf record -a -F 99 -g -p $(pgrep nr-softmodem -d ',') -o $DIRPATH/$1 -- sleep $TIME

sudo perf report -i $DIRPATH/$1 --no-children > $DIRTXT/$1-data.txt

if [ ! -d $CPUDIR ];then
        mkdir $DIRPATH
fi
echo "CPU Usage Record will save to:"$DIRPATH/$1
if [ ! -d $DIRPATH ];then
        mkdir $DIRPATH
fi

if [ ! -d $DIRPATH ];then
        mkdir $DIRPATH
fi

python monitor_cpuusage.py $TIME > $DIRPATH/$1

