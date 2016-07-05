FROM ubuntu:14.04
MAINTAINER Robert (robert@nigma.org)

WORKDIR /root/

# Installing python and python3
RUN DEBIAN_FRONTEND=noninteractive apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install git python python-dev python-pkg-resources python-setuptools python-virtualenv python-pip python3-pip python3-requests vim nano -y

# Installing python modules
RUN DEBIAN_FRONTEND=noninteractive pip install requests tabulate

# Git clone the learning material
RUN DEBIAN_FRONTEND=noninteractive git clone https://github.com/CiscoDevNet/apicem-ga-1.2-ll-sample-code-basic-labs.git
RUN DEBIAN_FRONTEND=noninteractive git clone https://github.com/CiscoDevNet/apicem-ga-1.2-ll-sample-code-policy-labs.git

# Adding ENV to config.py and lab1 if using your own apic-em.
COPY apicem.py /root/apicem-ga-1.2-ll-sample-code-basic-labs
COPY apicem_config.py /root/apicem-ga-1.2-ll-sample-code-basic-labs
COPY lab1-1-post-ticket.py /root/apicem-ga-1.2-ll-sample-code-basic-labs

COPY apicem.py /root/apicem-ga-1.2-ll-sample-code-policy-labs
COPY apicem_config.py /root/apicem-ga-1.2-ll-sample-code-policy-labs

# Adding a nice motd
RUN echo '[ ! -z "$TERM" -a -r /etc/motd ] && cat /etc/motd' >> /etc/bash.bashrc
COPY motd /etc/

# Clean up
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Start bash in /root/ folder
CMD /bin/bash
