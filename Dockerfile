FROM centos:8
MAINTAINER Pablo Escobar <pablo.escobarlopez@unibas.ch>

ENV CC3D_VERSION=4.2.5

RUN yum -y install epel-release && \
    yum -y install \
    libglvnd-glx \
    libXi \
    wget \
&& yum -y clean all

WORKDIR /usr/local/src
RUN wget -O CC3D_${CC3D_VERSION}_RedHat_8.0_64bit.tar.gz -nc https://sourceforge.net/projects/cc3d/files/${CC3D_VERSION}/linux/CC3D_${CC3D_VERSION}_RedHat_8.0_64bit.tar.gz

WORKDIR /opt
RUN tar xf CC3D_${CC3D_VERSION}_RedHat_8.0_64bit.tar.gz && \
    ln -s /opt/CC3D_${CC3D_VERSION}_RedHat_8.0_64bit /opt/CC3D

ENTRYPOINT ["/opt/CC3D/compucell3d.sh"]