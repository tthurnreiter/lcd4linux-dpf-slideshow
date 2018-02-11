Downloads images from public webcams and displays them in a slideshow on a hacked AX206-based Digital Picture Frame (see https://github.com/dreamlayers/dpf-ax)



Requires: lcd4linux>=r1200 with DPF driver and button_exec plugin, wget, ffmpeg, imagemagick



Run with run.sh or copy lcd4linux.conf to /etc/lcd4linux.conf and use lcd4linux service

Or use docker:
To build the image: docker build -t lcd4linux-dpf-slideshow .
To run the image: docker run -d --privileged lcd4linux-dpf-slideshow

NOTE: after the first start there may be a up to five minutes long delay before the first image is loaded (including loads of file not found errors on the command line), as the image updater script is configured to run every 5 minutes
