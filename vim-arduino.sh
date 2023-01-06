#!/bin/bash

sudo apt-get update

## to compile arduino sketches:
ARDUINO_HOME="//usr/share/arduino/"
# check $ARDUINO_HOME for details
sudo apt-get install arduino-mk

## create filesystem
# I store all my arduino sketches into a github repository
# I store all my cloned repos into a git folder in the home directory
GIT_DIR="/home/alexandros/git"
if [ -d "$GIT_DIR" ]; then
    echo "Git directory exists. 
        Proccesing to seup arduino sketches directory ..."
else
    echo "Git Directory does not exist. Creating one ..."
    mkdir ${GIT_DIR}    
fi

# This repo contains a child Makefile which references the original
# used to compile C++ sketches which resides in $ARDUINO_HOME
# cat ~/git/arduino_sketches/Makefile for details

ARDUINO_SKETCHES_DIR="${GIT_DIR}/arduino_sketches"
if  [ -d "$ARDUINO_SKETCHES_DIR" ]; then
    cd ${GIT_DIR}
    git clone https://github.com/alexandrosdms/arduino_sketches.git
fi

## Test arduino connection
cd ${ARDUINO_SKETCHES_DIR}
pwd
make
BUILD_DIR="${ARDUINO_SKETCHES_DIR}/build-uno"
if [ -d "$BUILD_DIR" ]; then
    echo "Arduino UNO setted up correctly!"
    echo "Uploading onboard blinking LED sketch ..."
    make upload clean # deletes $BUILD_DIR
fi

## Installing Serial Monitor Software
sudo apt-get install screen
# type: make upload monitor clean to read the Serial Monitor
# screen -l to list active screens
# screnn -r {SCREEN_ID} to return to $SCREEN_ID screen
# screen -X quit to kill


