Fedora for students
========================================
Docker image of Fedora 24 Linux aimed on groups of 
students learning Computer Science. This image has `/etc`, 
`/root` and `/home` directories are stored in persistent volumes.
Container has SSHD server running as prime process.
So, users can connect to container using all possible SSH clients.
Many usefull console utilities are installed too.


Included software
========================================

- Console applications: Midnight Commander, VIM, Nano, tmux, screen, bc, sshfs, ssh, gpg, tons of other things...
- VCS: git, mercurial.
- Console internet: curl, lynx, elinks, toxic instant messenger.
- Golang v1.5.4 - environment, godoc and other tools are installed
- Nodejs v6.3.1 and npm 3.10.3 for javascript development

To build image
========================================

Run `build.sh` script - the image of `vodolaz095/fedora-for-students` will be created


To run image
=======================================
Run `start.sh` script - the image will be started with persistent 
volumes for `/home`, `/root`,`/etc`.

Two users are created by defauls - `root` with password of `root` and 
limited user  `fedora` with password `fedora`.


To connect
=======================================

As root:

```shell

$ ssh root@$(docker inspect --format='{{ .NetworkSettings.Networks.bridge.IPAddress}}' vodolaz095/fedora-for-students)

```

As ordinary user:

```shell

$ ssh fedora@$(docker inspect --format='{{ .NetworkSettings.Networks.bridge.IPAddress}}' vodolaz095/fedora-for-students)

```

To create new user
======================================
After you have connected to server as root:

```shell

$ useradd someUserName
$ passwd someUserName

```

Limitations
=======================================
Since there is only 1 process running - SSHD server, cron, other process like webservers, 
database servers cannot be used in  this particular docker image.
But all console commands, even the detached processes can be executed until the SSH server is running


