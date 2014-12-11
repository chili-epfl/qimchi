#!/bin/bash

# Mount something

# cd into something

now=$(date +"%Y_%m_%d-%H_%M_%S")
ffmpeg -f x11grab -s 1360x768 -r 10 -i :0.0 screen_$now.mkv

#Type q to exit!
