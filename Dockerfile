FROM fedora:24

MAINTAINER https://github.com/vodolaz095/fedora-for-students/issues

ADD etc/yum.repos.d /etc/yum.repos.d/

RUN dnf upgrade -y \
    && dnf install -y openssh openssh-server \
    screen tmux \
    mc nano vim bc \
    golang golang-godoc \
    passwd \
    git mercurial \
    sshfs \
    nodejs npm \
    toxic \
    lynx elinks wget curl \
    && dnf clean all

ADD etc/skel /etc/skel
ADD etc/motd /etc/motd

RUN /bin/ssh-keygen -t rsa     -f /etc/ssh/ssh_host_rsa_key     -N ''
RUN /bin/ssh-keygen -t ecdsa   -f /etc/ssh/ssh_host_ecdsa_key   -N ''
RUN /bin/ssh-keygen -t ed25519 -f /etc/ssh/ssh_host_ed25519_key -N ''

RUN echo -e "root\nroot" | (/bin/passwd --stdin root)

RUN /usr/sbin/useradd fedora
RUN echo -e "fedora\nfedora" | (/bin/passwd --stdin fedora)

EXPOSE 22

VOLUME /home/
VOLUME /root/
VOLUME /etc/

ENTRYPOINT ["/usr/sbin/sshd","-D"]