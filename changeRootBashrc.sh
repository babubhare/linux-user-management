#!/bin/bash

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
