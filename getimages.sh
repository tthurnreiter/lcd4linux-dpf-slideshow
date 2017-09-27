#!/bin/bash
#continue on error
set +e
declare -a static_images=( "http://www.raiba-regensburg.de/webcam/webcam.jpg"
  		   "http://www.raiba-regensburg.de/webcam/webcam2.jpg"
	           "http://195.37.211.74/record/current.jpg"
	           "http://www.nkk.de/webcam/webcam.jpg"
	)
declare -a mjpeg_streams=(
                   "http://stream.dom.r-kom.de/"
	           "http://stream.neupfarrplatz.r-kom.de/"
	           "http://stream.bismarckplatz.r-kom.de/"
        )

counter=0
filename=image

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
mkdir ./out/
# Getting static images
for image in "${static_images[@]}"
do
    wget -q -O $filename$counter $image
    convert $filename$counter -resize '320X240' -background transparent -gravity center -extent '320x240' out/$filename$counter.png
    rm ./$filename$counter
    counter=$((counter+1))
done
# Getting mjpeg snapshots
for stream in "${mjpeg_streams[@]}"
do
    ffmpeg -i $stream -vframes 1 -r 1 -y -f mjpeg $filename$counter
    convert $filename$counter -resize '320X240' -background transparent -gravity center -extent '320x240' out/$filename$counter.png
    rm ./$filename$counter
    counter=$((counter+1))
done

exit 0
