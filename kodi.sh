#!/bin/bash

# Fix kodi BT speaker issue

while read a ; do echo ${a//audiodevice*audiodevice/audiodevice>ALSA:bluealsa<\/audiodevice} ; done < /home/pi/.kodi/userdata/guisettings.xml > /tmp/guisettings.xml.t ; mv /tmp/guisettings.xml{.t,}

mv /home/pi/.kodi/userdata/guisettings.xml /home/pi/.kodi/userdata/guisettings.xml.old

cp /tmp/guisettings.xml /home/pi/.kodi/userdata/guisettings.xml

if ! grep -q "defaults.bluealsa" /home/pi/.asoundrc

then

printf '\n' >> /home/pi/.asoundrc
printf 'defaults.bluealsa.interface "hci0"\n' >> /home/pi/.asoundrc
printf 'defaults.bluealsa.device "7C:49:EB:DC:14:BE"\n' >> /home/pi/.asoundrc
printf 'defaults.bluealsa.profile "a2dp"\n' >> /home/pi/.asoundrc
printf 'defaults.bluealsa.delay 10000\n' >> /home/pi/.asoundrc

fi

kodi
