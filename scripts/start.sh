#! /bin/bash

# vars
IPADDRESS="$(ip addr | grep 'state UP' -A2 | tail -n1 | awk '{print $2}' | cut -f1  -d'/')";

# check ownership
sudo chown -R restreamer:restreamer /home/restreamer

# kill any existing processes
sudo killall ffmpeg > /dev/null 2>&1
sudo killall ffprobe > /dev/null 2>&1
sudo killall nginx > /dev/null 2>&1
sudo killall php > /dev/null 2>&1
sudo killall php-fpm > /dev/null 2>&1
sudo killall streamlink > /dev/null 2>&1

# wait for processes to terminate
sleep 3

# clear up left over files
sudo rm -rf /home/restreamer/hls/* > /dev/null 2>&1

# set permissions
sudo chmod 777 /home/restreamer/bin/ffprobe > /dev/null 2>&1
sudo chmod 777 /home/restreamer/bin/ffmpeg > /dev/null 2>&1
sudo chmod 777 /home/restreamer/bin/mp4decrypt > /dev/null 2>&1
sudo chmod 777 /home/restreamer/nginx/sbin/nginx > /dev/null 2>&1
sudo chmod 777 /home/restreamer/php/bin/php > /dev/null 2>&1
sudo chmod 777 /home/restreamer/php/sbin/php-fpm > /dev/null 2>&1
sudo chmod 777 /home/restreamer/includes/*.conf > /dev/null 2>&1

sudo chmod +x /home/restreamer/bin/ffprobe > /dev/null 2>&1
sudo chmod +x /home/restreamer/bin/ffmpeg > /dev/null 2>&1
sudo chmod +x /home/restreamer/bin/mp4decrypt > /dev/null 2>&1
sudo chmod +x /home/restreamer/nginx/sbin/nginx > /dev/null 2>&1
sudo chmod +x /home/restreamer/php/bin/php > /dev/null 2>&1
sudo chmod +x /home/restreamer/php/sbin/php-fpm > /dev/null 2>&1

# start nginx
sudo /home/restreamer/nginx/sbin/nginx

# start php-fpm deamon
sudo -u restreamer start-stop-daemon --start --quiet --pidfile /home/restreamer/php/daemon.pid --exec /home/restreamer/php/sbin/php-fpm -- --daemonize --fpm-config /home/restreamer/php/etc/daemon.conf

# start restreamer deamon
sudo nohup /home/restreamer/php/bin/php -q /home/restreamer/scripts/deamon.php & > /home/restreamer/logs/deamon.log 2>&1

# output
echo "Restreamer Started"
