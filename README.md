Downloads images from public webcams and displays them in a slideshow on a hacked AX206-based Digital Picture Frame (see https://github.com/dreamlayers/dpf-ax)



Requires: lcd4linux>=r1200 with DPF driver and button_exec plugin, wget, ffmpeg, imagemagick



Run with run.sh or copy lcd4linux.conf to /etc/lcd4linux.conf and use lcd4linux service

Or use docker:
To build the image: docker build -t lcd4linux-dpf-slideshow .
To run the image: docker run --privileged lcd4linux-dpf-slideshow

