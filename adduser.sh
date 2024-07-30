#!/bin/bash
iuser=dev
ipasswd=dev

adduser ${iuser} --gecos "dev,dev,dev,dev" --disabled-password
passwd "$iuser" <<<"$ipasswd"$'\n'"$ipasswd"
chmod 0700 "/home/${iuser}/.ssh"
touch "/home/${iuser}/.ssh/authorized_keys"
chmod 0600 "/home/${iuser}/.ssh/authorized_keys"
chown -R $iuser:$iuser "/home/${iuser}/.ssh"
chown -R $iuser:$iuser "/home/${iuser}"

touch /etc/sudoers.d/dev
echo "Defaults:${iuser} !fqdn" >> /etc/sudoers.d/${iuser}
echo "Defaults:${iuser} !requiretty" >> /etc/sudoers.d/${iuser}
echo "${iuser} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${iuser}
