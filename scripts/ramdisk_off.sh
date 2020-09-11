sudo sed -i '/home\/restreamer/d' /etc/fstab
sleep 2
umount -f /home/restreamer/hls
sudo mount -av