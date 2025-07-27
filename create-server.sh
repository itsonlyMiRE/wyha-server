#!/bin/bash
#https://mms.alliedmods.net/mmsdrop/2.0/mmsource-2.0.0-git1333-linux.tar.gz
#
#https://sm.alliedmods.net/smdrop/1.13/sourcemod-1.13.0-git7214-linux.tar.gz
#
#https://github.com/itsonlyMiRE/wyha-server
#https://github.com/kgns/weapons/releases/download/v1.7.8/weapons-v1.7.8.zip
#https://github.com/komashchenko/PTaH/releases/download/v1.1.4/linux.zip
#https://github.com/vanz666/NoLobbyReservation/releases/download/0.0.2/nolobbyreservation.zip
#https://github.com/eldoradoel/NoLobbyReservation
#
# 

set -e

cd /home/csgoserver
curl -Lo linuxgsm.sh https://linuxgsm.sh && chmod +x linuxgsm.sh && bash linuxgsm.sh csgoserver
./csgoserver install
./csgoserver mods-install
./csgoserver mods-install


### nolobbyreservation ###
# plugin
cd /home/csgoserver/serverfiles/csgo
mkdir nolobby && cd nolobby && \
	wget https://github.com/vanz666/NoLobbyReservation/releases/download/0.0.2/nolobbyreservation.zip && \
	unzip nolobbyreservation.zip && \
	mv ./addons/sourcemod/plugins/nolobbyreservation.smx ../addons/sourcemod/plugins/ && \
	cd .. && rm -rf nolobby
# files
git clone https://github.com/eldoradoel/NoLobbyReservation && \
	cp -r NoLobbyReservation/csgo/addons/sourcemod/* /home/csgoserver/serverfiles/csgo/addons/sourcemod/


### weapons ###
# weapons
cd /home/csgoserver/serverfiles/csgo
mkdir weapons && cd weapons && \
	wget https://github.com/kgns/weapons/releases/download/v1.7.8/weapons-v1.7.8.zip && \
 	unzip weapons-v1.7.8.zip && \
  	cp -r ./addons /home/csgoserver/serverfiles/csgo/ && \
   	cd .. && rm -rf weapons
# ptah
cd /home/csgoserver/serverfiles/csgo
mkdir ptah && cd ptah && \
	wget https://github.com/komashchenko/PTaH/releases/download/v1.1.4/linux.zip && \
	unzip linux.zip && \
  	cp -r ./addons /home/csgoserver/serverfiles/csgo/ && \
   	cd .. && rm -rf ptah
# choose not to follow guidelines
sed -i 's/\("FollowCSGOServerGuidelines"[[:space:]]*"\)yes"/\1no"/' /home/csgoserver/serverfiles/csgo/addons/sourcemod/configs/core.cfg
  	

### pull server files ###
cp /home/csgoserver/wyha-server/csgoserver.cfg /home/csgoserver/lgsm/config-lgsm/csgoserver/csgoserver.cfg
cp /home/csgoserver/wyha-server/officeserver.cfg /home/csgoserver/serverfiles/csgo/cfg/officeserver.cfg
