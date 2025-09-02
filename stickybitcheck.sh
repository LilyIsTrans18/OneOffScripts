#!/bin/bash
#Lily's bash script that checks if there are new stickybits on the system. Useful as a cron job.
ls -Rl / 2> /dev/null | grep rws | grep -vF \.rws > ~/tmpSB
md5one="$(md5sum ~/stickybits | awk '{ print $1 }' )"
md5two="$(md5sum ~/tmpSB | awk '{ print $1 }' )"

if [ "$md5one" != "$md5two" ]; then
touch ~/Desktop/stickybitAlert
notify-send "stickybitschanged"
mv ~/tmpSB ~/stickybitsCHANGED
exit
fi
#if no sticky bits changed, remove the temporary file. otherwise keep it so user can look at it
rm ~/tmpSB
