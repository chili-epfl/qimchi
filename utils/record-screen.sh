#!/bin/bash

udisks --mount /dev/sda2

cd /media/Spare/tmp

now=$(date +"%Y_%m_%d-%H_%M_%S")
ffmpeg -f x11grab -s 1360x768 -r 10 -i :0.0 screen_$now.mkv

#Type q to exit!
