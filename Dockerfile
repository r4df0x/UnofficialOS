FROM ubuntu:22.04

RUN apt update  \
    && DEBIAN_FRONTEND=noninteractive \
      apt install -y \
      gcc make git unzip wget \
      xz-utils libsdl2-dev libsdl2-mixer-dev libfreeimage-dev libfreetype6-dev libcurl4-openssl-dev \
      rapidjson-dev libasound2-dev libgl1-mesa-dev build-essential libboost-all-dev cmake fonts-droid-fallback \
      libvlc-dev libvlccore-dev vlc-bin texinfo premake4 golang libssl-dev curl patchelf \
      xmlstarlet patchutils gawk gperf xfonts-utils default-jre python3 python-is-python3 xsltproc libjson-perl \
      lzop libncurses5-dev device-tree-compiler u-boot-tools rsync p7zip libparse-yapp-perl \
      zip binutils-aarch64-linux-gnu dos2unix p7zip-full libvpx-dev bsdmainutils bc meson p7zip-full \
      qemu-user-binfmt zstd parted imagemagick locales \
      && apt autoremove --purge -y \
      && apt clean -y \
      && rm -rf /var/lib/apt/lists/*

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8

RUN adduser --disabled-password --gecos '' docker

RUN mkdir -p /work && chown docker /work

WORKDIR /work
USER docker
