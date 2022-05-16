#!/bin/bash -e
#Run this script in root

CorePATH=/users/weicuidi

sudo apt update
sudo apt install mongodb
sudo systemctl start mongodb 
sudo systemctl enable mongodb
sudo apt install python3-pip python3-setuptools python3-wheel ninja-build build-essential flex bison git libsctp-dev libgnutls28-dev libgcrypt-dev libssl-dev libidn11-dev libmongoc-dev libbson-dev libyaml-dev libnghttp2-dev libmicrohttpd-dev libcurl4-gnutls-dev libnghttp2-dev libtins-dev libtalloc-dev meson

cp $CorePATH/conf_5g/Corefiles/*.sh $CorePATH/Core/
chmod +x $CorePATH/Core/*.sh

cd $CorePATH/Core/

sudo ./netconf.sh
sudo ./fwd.sh

cd $CorePATH/Core/open5gs
meson build --prefix=`pwd`/install
ninja -C build

./build/tests/attach/attach 
./build/tests/registration/registration

cd build
meson test -v

ninja install

cp -r $CorePATH/conf_5g/Corefiles/dump $CorePATH/
cd $CorePATH/
mongorestore

curl -fsSL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install nodejs

cd $CorePATH/Core/open5gs/webui/
npm ci --no-optional

cp $CorePATH/Core/conf_5g/open5gs/*yaml $CorePATH/Core/open5gs/install/etc/open5gs
#Next step you could try to check whether Core works or not
#1. cd $CorePATH/Core/open5gs/webui/
#2. npm run dev
#3. User: admin
#   Pwd:1423


