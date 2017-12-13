FROM ubuntu:artful

RUN apt-get update -qq && apt-get install -y \
	ffmpeg \
	imagemagick \
	lcd4linux \
	wget

COPY . /root/lcd4linux-dpf-slideshow/

RUN chmod 600 /root/lcd4linux-dpf-slideshow/lcd4linux.conf

CMD ["lcd4linux", "-Ff", "/root/lcd4linux-dpf-slideshow/lcd4linux.conf"]
