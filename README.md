Introduction
============

This repository serves as the canonical location for installation instructions, classroom exercises and home exercises for the Linux Fundamental course at Frisco Masjid.

Linux Installation
==================

To ensure all students have a standard working linux environment, this course will use open source vagrant boxes to install centos 7.

You will need to install the following on your workstation:

* Git Version 2.16.1
* VirtualBox Version 5.2.6
* Vagrant Version 2.0.2

Installation on Windows
=======================

* Download and install Virtual Box from here: https://download.virtualbox.org/virtualbox/5.2.6/VirtualBox-5.2.6-120293-Win.exe
* Download and install Vagrant from here: https://releases.hashicorp.com/vagrant/2.0.2/vagrant_2.0.2_x86_64.msi (assuming you have a 64 bit system)
* Download and install git from here: https://github.com/git-for-windows/git/releases/download/v2.16.1.windows.4/Git-2.16.1.4-32-bit.exe

Accept all defaults from each installer.

Once completed, open the `Git Bash` application and run the following commands for verification:

```
vagrant -v
VBoxManage -version
git version
```

If each command returns the version we expect, and does not error out, you are ready to proceed to the next step.



Installation on Mac OS X
========================

First download and install virtualbox from here: https://download.virtualbox.org/virtualbox/5.2.6/VirtualBox-5.2.6-120293-OSX.dmg


The easiest way to install all dependencies on Mac OS X is to use homebrew (https://brew.sh/).
You can install homebrew and all the dependencies for this class with the following steps.
Open a new window in `terminal.app` and:

```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/cask
brew install git
brew cask install vagrant
vagrant plugin install vagrant-vbguest
```

Verification:

To verify proper installation of all requirements run the following commands from your `terminal.app`:

```
vagrant -v
VBoxManage -version
git version
```

If all the commands return the version you expect, you are ready to move to on the next step.



Using this repository
=====================

Once you have installed all required software on your workstation, to bring up a linux virtual machine follow these steps:

```
git clone https://github.com/faraazkhan/frisco-linux-fundamentals.git
cd frisco-linux-fundamentals
vagrant up
```

Quick demo:
[![asciicast](https://asciinema.org/a/5wh0SfytawHkTG2ps4uvI5XFQ.png)](https://asciinema.org/a/5wh0SfytawHkTG2ps4uvI5XFQ)

If everything is set up correctly, this will download the Centos/7 vagrant box and start it up for you.

You should be able to ssh into this linux vm by simply typing `vagrant ssh` from within the project directory.

You can exit this ssh session, by simply typing "exit" inside the vagrant virtual machine session.

To stop the virtual machine, without fully destroying it, run : `vagrant halt` inside the project directory on your host.

To delete the virtual machine, type: `vagrant destroy` inside the project directory on your host.

Differentiating between your Host and the Vagrant Machine
========================================================

When you are new to using the command line, it can sometimes be confusing to determine whether a command is being run on your host or the vagrant virtual machine.

The simplest mechanism to determine where your Terminal session is running is to notice the `command prompt`.

If you see something like: `vagrant@friscomasjid`. Then you are in the Vagrant virtual machine.

Sometimes, for example when you run `sudo su` the prompt might be slightly different like `root@friscolinux`

The default structure of this command prompt is `<name of the user>@<host name>`. As long as the host name shown is `friscolinux` your session is running inside the virtual machine.

Otherwise on your host.

Another more reliable way is to simply run the command `hostname`, on the Vagrant virtual box it will return `friscolinux`
