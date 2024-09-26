#!/bin/bash

# Bash file changes
echo "# BABU CHANGES " >> /home/kali/.bckalibashrc
echo "kernel_version=\$(uname -r)" >> /home/kali/.bckalibashrc
echo "temp=\$(lsb_release -i)" >> /home/kali/.bckalibashrc
echo "count=\${#temp}" >> /home/kali/.bckalibashrc
echo "bc_distribution_id=\$(lsb_release -i | cut -c 17-\$count)" >> /home/kali/.bckalibashrc
echo "temp=\$(lsb_release -i)" >> /home/kali/.bckalibashrc
echo "count=\${#temp}" >> /home/kali/.bckalibashrc
echo "bc_release=\$(lsb_release -r | cut -c 10-\$count)" >> /home/kali/.bckalibashrc
echo "temp=\$(lsb_release -i)" >> /home/kali/.bckalibashrc
echo "count=\${#temp}" >> /home/kali/.bckalibashrc
echo "bc_codename=\$(lsb_release -c | cut -c 11-\$count)" >> /home/kali/.bckalibashrc
echo "temp=\$(lsb_release -i)" >> /home/kali/.bckalibashrc
echo "count=\${#temp}" >> /home/kali/.bckalibashrc
echo "bc_systemname="v-kali-\${bc_distribution_id}\${bc_release}\${bc_codename}\${kernel_version}"" >> /home/kali/.bckalibashrc
echo "# END CHANGES" >> /home/kali/.bckalibashrc

sudo hostnamectl set-hostname ${bc_systemname}
