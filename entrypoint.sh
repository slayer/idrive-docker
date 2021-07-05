#!/bin/sh
# Entrypoint for idrive
echo "init.."

# Reinstall IDrive (force last version)
echo "Reinstall IDrive.."
cd /work
curl -O https://www.idrivedownloads.com/downloads/linux/download-for-linux/LinuxScripts/IDriveForLinux.zip

unzip -o IDriveForLinux.zip
rm IDriveForLinux.zip
cd /work/IDriveForLinux/scripts
chmod a+x *.pl

# docker logs
tail -f /var/log/idrive.log
