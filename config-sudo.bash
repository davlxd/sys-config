#! /bin/bash

#add specified user to /etc/sudoers

if [ $EUID -ne 0 ]; then
  echo "must be root"
  exit 1
fi

echo -e "Input username:"
read username
cp /etc/sudoers /etc/sudoers.backup
chmod +w /etc/sudoers
echo -e "$username\tALL=(ALL)\tALL" >> /etc/sudoers
chmod -w /etc/sudoers
