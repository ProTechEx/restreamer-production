rm /home/restreamer/logs/error.log
cd /home/restreamer/logs/build/ && find . -name "*.log" -print0 | xargs -0 rm
cd /home/restreamer/logs/ffmpeg/ && find . -name "*.log" -print0 | xargs -0 rm
rm /home/restreamer/tmp/*.txt

echo "Logs have been cleared"
echo ""