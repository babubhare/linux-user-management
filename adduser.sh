#!/bin/bash
iuser=dev
ipasswd=dev

mkdir /etc/skel/.ssh

adduser ${iuser} --gecos "dev,dev,dev,dev" --disabled-password
passwd "$iuser" <<<"$ipasswd"$'\n'"$ipasswd"
chmod 0700 "/home/${iuser}/.ssh"
touch "/home/${iuser}/.ssh/authorized_keys"
chmod 0600 "/home/${iuser}/.ssh/authorized_keys"
chown -R $iuser:$iuser "/home/${iuser}/.ssh"
chown -R $iuser:$iuser "/home/${iuser}"
touch "/home/${iuser}/.bash_aliases"

echo "alias ll='ls -al --color=auto'" >> /home/${iuser}/.bash_aliases

touch /etc/sudoers.d/dev
echo "Defaults:${iuser} !fqdn" >> /etc/sudoers.d/${iuser}
echo "Defaults:${iuser} !requiretty" >> /etc/sudoers.d/${iuser}
echo "${iuser} ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/${iuser}

echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== ${iuser} insecure public key" > "/home/${iuser}/.ssh/authorized_keys"
echo "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN1YdxBpNlzxDqfJyw/QKow1F+wvG9hXGoqiysfJOn5Y ${iuser} insecure public key" > "/home/${iuser}/.ssh/authorized_keys"

# Bash file changes
echo "# BABU CHANGES " >> /home/${iuser}/.bashrc
echo "kernel_version=\$(uname -r)" >> /home/${iuser}/.bashrc
echo "temp=\$(lsb_release -i)" >> /home/${iuser}/.bashrc
echo "count=\${#temp}" >> /home/${iuser}/.bashrc
echo "bc_distribution_id=\$(lsb_release -i | cut -c 17-\$count)" >> /home/${iuser}/.bashrc
echo "temp=\$(lsb_release -i)" >> /home/${iuser}/.bashrc
echo "count=\${#temp}" >> /home/${iuser}/.bashrc
echo "bc_release=\$(lsb_release -r | cut -c 10-\$count)" >> /home/${iuser}/.bashrc
echo "temp=\$(lsb_release -i)" >> /home/${iuser}/.bashrc
echo "count=\${#temp}" >> /home/${iuser}/.bashrc
echo "bc_codename=\$(lsb_release -c | cut -c 11-\$count)" >> /home/${iuser}/.bashrc
echo "temp=\$(lsb_release -i)" >> /home/${iuser}/.bashrc
echo "count=\${#temp}" >> /home/${iuser}/.bashrc
echo "bc_systemname="v-awsdevops-\${bc_distribution_id}\${bc_release}\${bc_codename}\${kernel_version}"" >> /home/${iuser}/.bashrc
echo "# END CHANGES" >> /home/${iuser}/.bashrc

echo "color_prompt=yes" >> /home/${iuser}/.bashrc

echo "if [ "\$color_prompt" = yes ]; then" >> /home/${iuser}/.bashrc
    echo "PS1='\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\$bc_systemname\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> /home/${iuser}/.bashrc
echo "else" >> /home/${iuser}/.bashrc
    echo "PS1='\${debian_chroot:+(\$debian_chroot)}\u@\$bc_systemname:\w\$ '" >> /home/${iuser}/.bashrc
echo "fi" >> /home/${iuser}/.bashrc

source /home/${iuser}/.bashrc
sudo hostnamectl set-hostname ${bc_systemname}
