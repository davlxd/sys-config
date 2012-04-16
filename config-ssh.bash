#! /bin/bash

#Set ControlMaster to ssh

echo -e "\n>> Enable ssh Control Master (y/n):"
read YN
if [ $YN = "Y" -o $YN = "y" ]; then
  ssh_config="$HOME/.ssh/config"
  if [ ! -d "$HOME/.ssh" ]; then
    mkdir "$HOME/.ssh"
  fi
  if [ ! -f $ssh_config ]; then
    touch $ssh_config
  fi
  echo -e "Host *\nControlMaster auto\nControlPath ~/.ssh/ControlMaster-%r@%h:%p" > $ssh_config
  chmod 600 $ssh_config
fi


echo -e "\n>> Enable ssh Server AliveInterval-60, CountMax-100(y/n):"
read YN
if [ $YN = "Y" -o $YN = "y" ]; then
  ssh_config="$HOME/.ssh/config"
  if [ ! -d "$HOME/.ssh" ]; then
    mkdir "$HOME/.ssh"
  fi
  if [ ! -f $ssh_config ]; then
    touch $ssh_config
  fi
  echo -e "ServerAliveInterval 60\nServerAliveCountMax 100" >> $ssh_config
  chmod 600 $ssh_config
fi
