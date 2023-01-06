#!/bin/bash

sudo apt-get update

## to compile arduino sketches:
ARDUINO_HOME="//usr/share/arduino/"
# check $ARDUINO_HOME for details
sudo apt-get install arduino-mk

## create filesystem
# I store all my arduino sketches into a github repository
# I store all my cloned repos into a git folder in the home directory
GIT_DIR="~/git"
if [ -d "$GIT_DIR" ]; then
    echo "Git directory does not exist. Creating one ..."
    mkdir ~/git
fi
cd ~/git
# This repo contains a child Makefile which references the original
# used to compile C++ sketches which resides in $ARDUINO_HOME
# cat ~/git/arduino_sketches/Makefile for details
git clone https://github.com/alexandrosdms/arduino_sketches.git

## Test arduino connection
cd ~/git/arduino_sketches/exploring_arduino
make
BUILD_DIR="~/git/arduino_sketches/exploring_arduino/build-uno"
if [ -d "$BUILD_DIR" ]; then
    echo "Arduino UNO is setted up correctly!"
    echo "Uploading onboard blinking LED sketch ..."
    make upload clean # deletes $BUILD_DIR
fi

## Installing Serial Monitor Software
sudo apt-get install screen
# type: make upload monitor clean to read the Serial Monitor
# screen -l to list active screens
# screnn -r {SCREEN_ID} to return to $SCREEN_ID screen
# screen -X quit to kill


