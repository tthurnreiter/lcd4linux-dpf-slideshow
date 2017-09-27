#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $DIR

lcd4linux -Ff ./lcd4linux.conf -o bild.png &

