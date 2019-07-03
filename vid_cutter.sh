#!/bin/bash -x

# Script License: GPL
# Dependensies: ffmpeg (You need ffmpeg installed in your system)
# Usage: "Takes single/multiple file paths as input and cuts video of specified length in mp4"
# Example: "./vid_mp3.sh Downloads/input1.mkv Downloads/input2.mkv" converts 'Downloads/input1.mkv' and 'Downloads/input2.mkv' to 'Downloads/input1.mp4' and 'Downloads/input2.mp4

if [ $# -gt 0 ]; then
    while test $# -gt 0
    do
        Filo=${1//\ /\\\ };
        echo -n "Enter the start time for $Filo here (hh:mm:ss) -->"
        read start_time
        echo -n "Enter duration to cut $Filo here (hh:mm:ss) -->"
        read duration
        echo "
        Converting $Filo
        command: ffmpeg -i $Filo -ss $start_time -t $duration -async 1 $Filo.mp4"
        eval "ffmpeg -i $Filo -ss $start_time -t $duration -async 1 $Filo.mp4 "
        shift
    done
else
    echo "
    Which video file to cut?
    Script usage ./vid_cutter.sh <video filepath> ...
    ";
fi
