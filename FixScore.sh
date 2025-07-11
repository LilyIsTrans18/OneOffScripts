#!/bin/bash
#Lily's Homemade Script to fix the Score command so you dont have to manually go in and possibly mess things

user=$(whoami)

if [ "$user" != "root" ]; then
echo "This script must be run as sudo, you are editing the score command which is owned by root"
exit
fi

echo "Verification successful, running command.."
echo "Fixing 20b"
sed -i 's/if egrep -q "^Question b.*8$".*/if egrep -q "^Question b.*8"/' /usr/local/bin/score
echo "Fixing 20c"
sed -ie 's/\\././g' /usr/local/bin/score && sed -ie 's/8\$/8/g' /usr/local/bin/score
echo "Fixed"
