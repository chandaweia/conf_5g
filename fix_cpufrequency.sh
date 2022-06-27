#!/bin/bash -e

echo "Run it in root"
sudo su

sudo apt-get install -y cpufrequtils
sudo apt install -y linux-tools-$(uname -r)

echo "GRUB_CMDLINE_LINUX_DEFAULT=\"quiet intel_pstate=disable processor.max_cstate=1 intel_idle.max_cstate=0 idle=poll\"" >> /etc/default/grub
echo "blacklist intel_powerclamp" >>  /etc/modprobe.d/blacklist.conf
echo GOVERNOR=\"performance\" >> /etc/default/cpufrequtils
sudo systemctl disable ondemand.service
sudo /etc/init.d/cpufrequtils restart

echo off > /sys/devices/system/cpu/smt/control
cpupower idle-set -D 0

echo "Install Complete!"
#echo "check watch -n.1 "grep \"^[c]pu MHz\" /proc/cpuinfo""


checkcpu="watch -n.1 \"grep \"^[c]pu MHz\" /proc/cpuinfo\""
echo "Check CPU frequency by: $checkcpu"
echo "Check hyperthreading by: lscpu"
