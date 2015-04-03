#!/bin/bash

# Install packet
apt-get install qtcreator
apt-get install arduino-core 
apt-get install arduino-mk

# install Arduino template
cp -R arduino/ /usr/share/qtcreator/templates/wizards/
chmod -R 755 /usr/share/qtcreator/templates/wizards/arduino/

# install Atmel template
cp -R atmega/ /usr/share/qtcreator/templates/wizards/
chmod -R 755 /usr/share/qtcreator/templates/wizards/atmega/

# Configure right for USB devices
usermod -a -G dialout $(whoami)
cp 60-avrisp.rules /etc/udev/rules.d/
service udev restart

echo "Don't forget to manually modify line 218 : #sudo gedit /usr/share/arduino/Arduino.mk"
