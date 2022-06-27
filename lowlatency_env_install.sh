#!/bin/bash -e

sudo apt-get update -y
sudo apt-get install -y linux-lowlatency

echo "Reboot Now and run fix_cpufrequency.sh in root"