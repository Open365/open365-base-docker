FROM    ubuntu:15.10
RUN     apt-get update && \
        apt-get -y --no-install-recommends install software-properties-common && \
        add-apt-repository ppa:serge-hallyn/virt && \
        apt-get update &&\
        DEBIAN_FRONTEND=noninteractive apt-get -y --no-install-recommends install \
            xserver-xspice \
            libpam-ldapd \
            x11-xserver-utils \
            ratpoison \
            gnome-themes-standard \
            xserver-xorg-video-qxl \
            spice-vdagent \
            breeze \
            frameworkintegration \
            nodejs \
            npm \
            nodejs-legacy \
            git \
            && \
        apt-get clean && \
        rm -rf /var/lib/apt/lists/*

RUN     mv /usr/sbin/spice-vdagentd /usr/sbin/spice-vdagentd.old && \
        /usr/sbin/locale-gen es_ES.UTF-8

ENV     BROWSER eyeos-open
COPY    spice-vdagentd /usr/sbin/
COPY    .gtkrc-2.0 /root/
COPY    spiceqxl.xorg.conf /etc/X11/
COPY    resolution.desktop /etc/xdg/autostart/
COPY    keyboard.desktop /etc/xdg/autostart/
COPY    setcustomresolution /usr/bin/setcustomresolution
COPY    ratpoisonrc /etc/skel/.config/
COPY    eyeos-open/eyeos-open.sh /usr/bin/eyeos-open
COPY    eyeos-open/mimeapps.list /etc/xdg/
COPY    eyeos-open/eyeos-open.desktop /usr/share/applications/eyeos-open.desktop
