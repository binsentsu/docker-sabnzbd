#!/usr/bin/with-contenv bash

#. /etc/profile

# See https://openvpn.net/index.php/open-source/documentation/manuals/65-openvpn-20x-manpage.html (--up cmd)

if [ ! -e "/dev/random" ]; then
  # Avoid "Fatal: no entropy gathering module detected" error
  echo "INFO: /dev/random not found - symlink to /dev/urandom"
  ln -s /dev/urandom /dev/random
fi

echo "STARTING SABNZBD with USER ${USER_NAME}"

# ENV Variables missing - fix needed
exec s6-setuidgid abc python3 /app/sabnzbd/SABnzbd.py --config-file /config --server 0.0.0.0:8080

echo "Startup script SABnzbd completed."
