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

echo "-----------------------------------------"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "DEBUG: $DIR"
cd $DIR
echo "-----------------------------------------"
echo "DEBUG: getting static images"
echo "-----------------------------------------"
for image in "${static_images[@]}"
do
    echo "DEBUG: counter: $counter"
    echo "-----------------------------------------"
    echo "DEBUG: loading $image to $filename$counter"
    echo "-----------------------------------------"
    wget -q -O $filename$counter $image
    echo "-----------------------------------------"
    echo "DEBUG: convert $filename$counter"
    echo "-----------------------------------------"
    #convert  -resize '320X240' out/$filename$counter.png
    convert $filename$counter -resize '320X240' -background transparent -gravity center -extent '320x240' out/$filename$counter.png
    echo "-----------------------------------------"
    echo "DEBUG: remove $filename$counter"
    echo "-----------------------------------------"
    rm ./$filename$counter
    echo "-----------------------------------------"
    counter=$((counter+1))
done
echo "-----------------------------------------"
echo "DEBUG: getting mjpeg snapshots"
echo "-----------------------------------------"
for stream in "${mjpeg_streams[@]}"
do
    echo "DEBUG: counter: $counter"
    echo "-----------------------------------------"
    echo "DEBUG: loading $stream to $filename$counter"
    echo "-----------------------------------------"
    ffmpeg -i $stream -vframes 1 -r 1 -y -f mjpeg $filename$counter
    echo "-----------------------------------------"
    echo "DEBUG: convert $filename$counter"
    echo "-----------------------------------------"
    #convert $filename$counter -resize '320X240' out/$filename$counter.png
    convert $filename$counter -resize '320X240' -background transparent -gravity center -extent '320x240' out/$filename$counter.png
    echo "-----------------------------------------"
    echo "DEBUG: remove $filename$counter"
    echo "-----------------------------------------"
    rm ./$filename$counter
    echo "-----------------------------------------"
    counter=$((counter+1))
done

echo "DEBUG: finished updating pictures"
exit 0
