#!/bin/bash
# run with
# 'sudo su'
# 'source setup.sh'
# to force variables to be exported in the same shell
source ./root_setup.sh
su ubuntu << 'eof'

echo "scheduling startup at reboot"
chmod +x ./startup.sh
crontab -r
echo "SHELL=/bin/bash" >> /tmp/usercron
echo "PATH=$PATH" >> /tmp/usercron
crontab /tmp/usercron
rm -f /tmp/usercron
eof

echo "cleaning setup files"
rm ./*setup.sh
rm ./*.md

echo "setup complete... rebooting now"
reboot now
