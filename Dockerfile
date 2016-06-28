FROM ubuntu:14.04
MAINTAINER Robert (robert@nigma.org)

# Installing python and python3
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install git python python-dev python-pkg-resources python-setuptools python-virtualenv python-pip python3-pip python3-requests vim nano -y

# Installing python modules
RUN DEBIAN_FRONTEND=noninteractive pip install requests tabulate

# Git clone the learning material
RUN DEBIAN_FRONTEND=noninteractive cd /root/ && git clone https://github.com/CiscoDevNet/apicem-ga-ll-sample-code.git

# Adding ENV to config.py and lab1 if using your own docker.
COPY apicem_config.py /root/apicem-ga-ll-sample-code
COPY lab1-01-post-ticket.py /root/apicem-ga-ll-sample-code

# Fixing a bug in the script
COPY lab6-3-delete-policy-tag-association.py /root/apicem-ga-ll-sample-code

# Adding a nice motd
RUN echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/motd' >> /etc/bash.bashrc
COPY motd /etc/

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Start bash in /root/ folder
CMD cd /root/ && /bin/bash
