#!/bin/bash

if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Not running as root"
    exit
fi


cd /usr/share/spotify/Apps
cp xpui.spa xpui.spa.bak  # create the backup
unzip -p xpui.spa xpui.js | sed 's/adsEnabled:\!0/adsEnabled:false/' > xpui.js
zip --update xpui.spa xpui.js
rm xpui.js
