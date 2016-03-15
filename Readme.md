Casebox2
========

Branches
--------

* v1 - Casebox v1 installation script (Vagrant, Ansible, LAMP5).
* v2 - Casebox v2 installation script (Vagrant, Ansible, LEMP7).

Installation
------------

Download and install:

* VirtualBox (https://www.virtualbox.org/)
* Vagrant (https://www.vagrantup.com/)
* Git (https://git-scm.com/)

Clone Casebox v1|v2 ansible installation script (https://github.com/KETSE/casebox-vagrant.git)

Navigate to ```/path/to/casebox``` directory.

Run vagrant (virtualbox) machine: ```vagrant up```


Vagrant (virtualbox) ssh access
-------------------------------

In order to login into vagrant (virtualbox) machine run ```vagrant ssh``` command. 

Also you can login via ssh connection ```ssh vagrant@192.168.33.3```.

Vagrant credentials (user/password): vagrant / vagrant

Vagrant box host/ip: 192.168.33.3.xip.io / 192.168.33.3


Links
-----

Casebox v1 instance: [http://192.168.33.3.xip.io/default](http://192.168.33.3.xip.io/default)

Casebox v2 instance: [http://192.168.33.3.xip.io/c/default](http://192.168.33.3.xip.io/c/default)

Solr admin interface: [http://192.168.33.3.xip.io:8983/solr/#/](http://192.168.33.3.xip.io:8983/solr/#/)


Credentials
-----------

In order to fetch credentials about mysql root password or casebox default password, 
login to vagrant box using 'vagrant ssh' command. 

After that use 'cat' command to list the following files with credentials:

* MySQL ```root``` password in file: ```/root/.mysql.root.password```
* MySQL ```casebox``` password in file: ```/home/vagrant/.mysql.casebox.password```
* Casebox default ```root``` user password: ```a```


Vagrant utils
-------------

Run vagrant (virtualbox) machine: ```vagrant up```

Stop vagrant (virtualbox) machine: ```vagrant halt```

Update vagrant (virtualbox) machine: ```vagrant reload --provision```


Issuses
-------

*   Issue: "It appears your machine doesn't support NFS, or there is not an adapter to enable NFS on this machine for Vagrant"
    
    Fix: Run 'apt-get install nfs-kernel-server' command. (https://help.ubuntu.com/community/SettingUpNFSHowTo)
    
    OS: Gnu/Linux
