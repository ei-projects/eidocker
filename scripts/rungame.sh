#!/bin/bash

set -e

export HOME=/root

EI_UID="$(stat -c '%u' /wine)"

rm -rf /root/.wine
cp -r /wine /root/.wine
chown -R root /root/.wine

LC_ALL=ru_RU.CP1251 wine explorer /desktop=name,1024x768 \
    'Z:\EI\Starter\EIStarter.exe' || status=$?

# Wait some time until wine syncs configs
sleep 5

cp -rf /root/.wine/. /wine
chown -R $EI_UID /wine

exit $status
