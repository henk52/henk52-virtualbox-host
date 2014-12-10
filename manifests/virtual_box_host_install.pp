# See: http://www.if-not-true-then-false.com/2010/install-virtualbox-with-yum-on-fedora-centos-red-hat-rhel/
binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel dkms

yum install VirtualBox-4.3

/etc/init.d/vboxdrv setup
## OR ##
service vboxdrv setup


usermod -a -G vboxusers user_name


