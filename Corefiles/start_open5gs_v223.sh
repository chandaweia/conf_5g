#!/bin/bash

cd /usr/local/cuidi/Core/open5gs

./install/bin/open5gs-mmed &

sleep 1

./install/bin/open5gs-sgwcd &

sleep 1

./install/bin/open5gs-smfd &

sleep 1

./install/bin/open5gs-amfd &

sleep 1

./install/bin/open5gs-sgwud &

sleep 1

./install/bin/open5gs-upfd &

sleep 1

./install/bin/open5gs-hssd &

sleep 1

./install/bin/open5gs-pcrfd &

sleep 1

./install/bin/open5gs-nrfd &

sleep 1

./install/bin/open5gs-ausfd &

sleep 1

./install/bin/open5gs-udmd &

sleep 1

./install/bin/open5gs-pcfd &

sleep 1

./install/bin/open5gs-nssfd &

sleep 1

./install/bin/open5gs-udrd &
