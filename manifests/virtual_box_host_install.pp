# See: http://www.if-not-true-then-false.com/2010/install-virtualbox-with-yum-on-fedora-centos-red-hat-rhel/
#binutils gcc make patch libgomp glibc-headers glibc-devel kernel-headers kernel-devel dkms

$arPackageList = [
  "binutils",
  "gcc",
  "make",
  "patch",
  "libgomp",
  "glibc-headers",
  "glibc-devel",
  "kernel-headers",
  "kernel-devel",
  "dkms"
                 ]
package { $arPackageList: }

#yum install VirtualBox-4.3
# VirtualBox-4.3-4.3.18_96516_fedora18-1.x86_64.rpm 
# exec { } for wget.
# rpm the file. (Also conditional exec) or can package be made to get files localy?
$szVboxFedoraRpmFileName = 'VirtualBox-4.3-4.3.18_96516_fedora18-1.x86_64.rpm'

exec { 'get_VBoxFedoraRpm':
  creates => "/tmp/$szVboxFedoraRpmFileName",
  command => "/usr/bin/wget --directory-prefix=/tmp http://10.1.233.3:/storage/$szVboxFedoraRpmFileName",
}

  
exec { 'install_VBoxFedoraRpm':
  creates => '/opt/DUDE',
  command => "rpm -ivh /tmp/$szVboxFedoraRpmFileName",
  require => [
               File [ "/tmp/$szVboxFedoraRpmFileName" ],
               Package [ $arPackageList ],
             ],
}


#/etc/init.d/vboxdrv setup
## OR ##
#service vboxdrv setup


#usermod -a -G vboxusers user_name


