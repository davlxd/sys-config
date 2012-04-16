#! /bin/bash
# Inspired by http://www.cslog.cn/Content/ubuntu_virtualbox_usb_dev/
# and http://en.gentoo-wiki.com/wiki/VirtualBox#USB_Devices_Grayed_Out

usb_group="usbfs"
set -x

if [ $EUID -ne 0 ]; then
  echo "must be root"
  exit 1
fi

grep $usb_group /etc/group
if [ $? -e 1 ]; then # Remove the following 3 lines ?
  echo "group $usb_group exist, exit ..."
  exit 1
fi
groupadd $usb_group

echo -e "Input username:"
read username
adduser $username $usb_group

devgid=`grep $usb_group /etc/group | awk -F: '{print $3}'`

cp /etc/fstab /etc/fstab.backup
echo "none  /proc/bus/usb usbfs devgid=$devgid,devmode=644  0 0" >> /etc/fstab
