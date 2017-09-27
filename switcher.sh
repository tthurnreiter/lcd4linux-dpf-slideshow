#!/bin/bash
#continue on error
set +e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

numberofpictures=`ls -1 ./out | wc -l`

if [ ! -f "/tmp/lcd4linux-dpf-slideshow/value.dat" ] ; then
  mkdir /tmp/lcd4linux-dpf-slideshow/
  # No save file found
  counter=-1
else
  # Read save file
  counter=`cat /tmp/lcd4linux-dpf-slideshow/value.dat`
fi

# Increment counter
counter=$(((counter+1)%numberofpictures))
# Copy ./out/image$counter.png to ./display.png"
cp ./out/image$counter.png ./display.tmp
#mv is supposedly atomic, cp is not. this hopefully avoids errors caused by lcd4linux loading truncated files
mv ./display.tmp ./display.png

#save to file"
echo "${counter}" > /tmp/lcd4linux-dpf-slideshow/value.dat

exit 0

