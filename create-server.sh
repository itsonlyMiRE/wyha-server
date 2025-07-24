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
cd ./serverfiles/csgo
mkdir nolobby && cd nolobby && \
	wget https://github.com/vanz666/NoLobbyReservation/releases/download/0.0.2/nolobbyreservation.zip && \
	unzip nolobbyreservation.zip && \
	mv ./addons/sourcemod/plugins/nolobbyreservation.smx ../addons/sourcemod/plugins/ && \
	cd .. && rm -rf nolobby
git clone https://github.com/eldoradoel/NoLobbyReservation && \
	cp -r NoLobbyReservation/csgo/addons/sourcemod/* /home/csgoserver/serverfiles/csgo/addons/sourcemod/
cp /home/csgoserver/wyha-server/csgoserver.cfg /home/csgoserver/lgsm/config-lgsm/csgoserver/csgoserver.cfg
cp /home/csgoserver/wyha-server/officeserver.cfg /home/csgoserver/serverfiles/csgo/cfg/officeserver.cfg
