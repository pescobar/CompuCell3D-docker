FROM centos:8
MAINTAINER Pablo Escobar <pablo.escobarlopez@unibas.ch>

ENV CC3D_VERSION=4.2.5

RUN yum -y install epel-release && \
    yum -y install \
    fontconfig \
    freetype \
    xorg-x11-fonts-100dpi \
    xorg-x11-fonts-75dpi \
    libglvnd-glx \
    libXi \
    libxkbcommon-x11 \
    libxkbcommon \
    mesa-dri-drivers \
    wget \
&& yum -y clean all

WORKDIR /usr/local/src
RUN wget -O CC3D_${CC3D_VERSION}_RedHat_8.0_64bit.tar.gz -nc https://sourceforge.net/projects/cc3d/files/${CC3D_VERSION}/linux/CC3D_${CC3D_VERSION}_RedHat_8.0_64bit.tar.gz

WORKDIR /opt
RUN tar xf /usr/local/src/CC3D_${CC3D_VERSION}_RedHat_8.0_64bit.tar.gz && \
    ln -s /opt/CC3D_${CC3D_VERSION}_RedHat_8.0_64bit /opt/CC3D

RUN mkdir /scratch && chmod 777 /scratch

ENTRYPOINT ["/opt/CC3D/compucell3d.sh"]
