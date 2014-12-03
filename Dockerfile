## -*- docker-image-name: "armbuild/image-ocs-perf-3.17:utopic" -*-
FROM armbuild/ocs-distrib-ubuntu:utopic

# Prepare rootfs for image builder
RUN /usr/local/sbin/builder-enter

# Install packages
RUN apt-get -q update &&	\
    apt-get -q upgrade && 	\
    apt-get install -y -q 	\
	    emacs23-nox		\
	    git			\
	    libelf1 		\
    	    libdw1     	  	\
	    libperl5.20		\
	    wget		\
    && apt-get clean

# Install iperf
RUN wget http://ftp.fr.debian.org/debian/pool/main/l/linux-tools/linux-tools-3.16_3.16-2_armhf.deb -O /tmp/linux-tools.deb && \
    dpkg -i /tmp/linux-tools.deb &&								      			      \
    rm -f /tmp/linux-tools.deb

# Clean rootfs from image-builder
RUN /usr/local/sbin/builder-leave
