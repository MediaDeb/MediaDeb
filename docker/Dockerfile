FROM debian:stretch


RUN echo "deb http://mirror.yandex.ru/debian/ stretch main contrib non-free" > /etc/apt/sources.list
RUN echo "deb http://security.debian.org/ stretch/updates main"             >> /etc/apt/sources.list
RUN echo "deb http://mirror.yandex.ru/debian/ stretch-updates main"         >> /etc/apt/sources.list
RUN echo "deb http://mirror.yandex.ru/debian/ stretch-backports main contrib non-free" >> /etc/apt/sources.list
RUN echo "deb http://security.debian.org/ stretch/updates non-free" >> /etc/apt/sources.list
RUN echo "deb http://security.debian.org/ stretch/updates non-free" >> /etc/apt/sources.list

RUN apt-get update
RUN apt-get -y upgrade
RUN apt-get -y install apt-transport-https apt-utils

RUN apt-get update
RUN apt-get -y --force-yes install multistrap sudo git build-essential devscripts wget mtd-utils gpgv cmake cpio lzop

ENV PATH  /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV HOME  /var/lib/jenkins

# Remember to remove /etc/apt/apt.conf.d/docker-gzip-indexes or multistrap will break
RUN rm /etc/apt/apt.conf.d/docker-gzip-indexes

# Linaro abe build deps
RUN apt-get install -y --force-yes bison automake autoconf libtool libncurses-dev gawk gcc-multilib g++-multilib zlib1g-dev flex autogen texinfo libpython2.7-dev dejagnu mingw-w64 zip

#qemu user emulation support
RUN apt-get install -y --force-yes  qemu-user-static

# Create passwd and group if needed, make them world-writable
# Jenkins will need to fill in uid/gid there.
# Failing to do so breaks some apps, like gcc's buildsystem

RUN touch /etc/group
RUN touch /etc/passwd
RUN chmod 777 /etc/passwd
RUN chmod 777 /etc/group

RUN echo "jenkins ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ENTRYPOINT ["/bin/bash", "--login"]
