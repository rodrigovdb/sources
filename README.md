# Source files

## User files

Just copy all files to user home and be happy.

Includes:
* vimrc
* bashrc
* gitconfig
* rspec

## Root files

As the user files, just copy all files to /root and be happy to.

Includes:
* vimrc
* bashrc

# Vagrant

Vagrant files, provision and sample files to:

* PostgreSQL with PostGIS

## Help on solve issues
Ubuntu trusty/64 box:
```
$ vagrant box add ubuntu/trusty64 https://github.com/kraksoft/vagrant-box-ubuntu/releases/download/14.04/ubuntu-14.04-amd64.box
```

Inside vm:
```
$ sudo ln -s /opt/VBoxGuestAdditions-4.3.10/lib/VBoxGuestAdditions /usr/lib/VBoxGuestAdditions
```
