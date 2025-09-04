#!/bin/bash
#Lily's bash script that checks if there are new stickybits on the system. Useful as a cron job.
#tree is selected as the default command, because it makes the file easier to cross compare for the user. If you don't/can't have tree on your system, remove the comment on ls -Rl...
tree / -pf 2> /dev/null | grep rws | grep -vF \.rws | grep -v timeshift > ~/tmpSB
#ls -Rl / 2> /dev/null | grep rws | grep -vF \.rws > ~/tmpSB
#If you need a new stickybits file, use the command above you've selected
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
