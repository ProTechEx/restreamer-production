#! /bin/bash

# kill any existing processes
sudo killall ffmpeg > /dev/null 2>&1
sudo killall ffprobe > /dev/null 2>&1
sudo killall nginx > /dev/null 2>&1
sudo killall php > /dev/null 2>&1
sudo killall php-fpm > /dev/null 2>&1
sudo killall streamlink > /dev/null 2>&1

# wait for processes to terminate
sleep 3

sudo killall ffmpeg > /dev/null 2>&1
sudo killall ffprobe > /dev/null 2>&1
sudo killall nginx > /dev/null 2>&1
sudo killall php > /dev/null 2>&1
sudo killall php-fpm > /dev/null 2>&1
sudo killall streamlink > /dev/null 2>&1

# wait for processes to terminate
sleep 3

# clean up left over files
sudo rm -rf /home/restreamer/video/* > /dev/null 2>&1
sudo rm -rf /home/restreamer/hls/* > /dev/null 2>&1
sudo rm -f /home/restreamer/cache/*.db > /dev/null 2>&1
sudo rm -f /home/restreamer/php/daemon.sock > /dev/null 2>&1

echo "Restreamer Stopped"
echo ""