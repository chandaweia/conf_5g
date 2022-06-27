#!/bin/bash -e

#Switch to General Kernel(Link:https://www.modb.pro/db/148406)
#vim /boot/grub/grub.cfg
#In the first menuentry
#linux   /boot/vmlinuz-4.15.0-188-lowlatency root=UUID=5fac4c69-51f6-47af-9773-a0d722426942 ro console=ttyS0,115200
#initrd  /boot/initrd.img-4.15.0-188-lowlatency

sudo apt-get update -y
sudo apt-get install -y linux-lowlatency

echo -e "\nLatency kernel has been installed successfully!"
echo "*****Reboot Now and run fix_cpufrequency.sh in root*****"