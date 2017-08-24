#!/bin/bash
#continue on error
set +e

echo "-----------------------------------------"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR
echo "DEBUG: changing to directory $DIR"
echo "-----------------------------------------"
numberofpictures=`ls -1 ./out | wc -l`
echo "DEBUG: $numberofpictures pictures found"
echo "-----------------------------------------"
if [ ! -f "/tmp/value.dat" ] ; then
  echo "DEBUG: No save file found"
  counter=0
else
  echo "DEBUG: Read save file"
  counter=`cat /tmp/value.dat`
fi
echo "-----------------------------------------"
echo "DEBUG: old counter: $counter"
counter=$(((counter+1)%numberofpictures))
echo "DEBUG: new counter: $counter"
echo "-----------------------------------------"
echo "DEBUG: Copying ./out/image$counter.png to ./display.png"
cp ./out/image$counter.png ./display.png
echo "-----------------------------------------"
echo "DEBUG: save to file"
echo "${counter}" > /tmp/value.dat
echo "-----------------------------------------"

exit 0

