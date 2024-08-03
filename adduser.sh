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

echo "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== dev insecure public key" > "/home/${iuser}/.ssh/authorized_keys"

# Bash file changes
echo "# BABU CHANGES " >> /root/.bashrc
echo "kernel_version=\$(uname -r)" >> /root/.bashrc
echo "temp=\$(lsb_release -i)" >> /root/.bashrc
echo "count=\${#temp}" >> /root/.bashrc
echo "bc_distribution_id=\$(lsb_release -i | cut -c 17-\$count)" >> /root/.bashrc
echo "temp=\$(lsb_release -i)" >> /root/.bashrc
echo "count=\${#temp}" >> /root/.bashrc
echo "bc_release=\$(lsb_release -r | cut -c 10-\$count)" >> /root/.bashrc
echo "temp=\$(lsb_release -i)" >> /root/.bashrc
echo "count=\${#temp}" >> /root/.bashrc
echo "bc_codename=\$(lsb_release -c | cut -c 11-\$count)" >> /root/.bashrc
echo "temp=\$(lsb_release -i)" >> /root/.bashrc
echo "count=\${#temp}" >> /root/.bashrc
echo "bc_systemname="v-lpic-\${bc_distribution_id}\${bc_release}\${bc_codename}\${kernel_version}"" >> /root/.bashrc
echo "# END CHANGES" >> /root/.bashrc

echo "color_prompt=yes" >> /root/.bashrc

echo "if [ "\$color_prompt" = yes ]; then" >> /root/.bashrc
    echo "PS1='\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\$bc_systemname\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> /root/.bashrc
echo "else" >> /root/.bashrc
    echo "PS1='\${debian_chroot:+(\$debian_chroot)}\u@\$bc_systemname:\w\$ '" >> /root/.bashrc
echo "fi" >> /root/.bashrc

sudo hostnamectl set-hostname ${bc_systemname}
