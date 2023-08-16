#!/bin/bash

# DigitalOcean Marketplace Image Validation Tool
# © 2021 DigitalOcean LLC.
# This code is licensed under Apache 2.0 license (see LICENSE.md for details)

install_path="/var/www/freescout"

sudo mkdir -p $install_path
sudo chown www-data:www-data $install_path
sudo git clone https://github.com/freescout-helpdesk/freescout $install_path
# sudo chown -R www-data:www-data $install_path
sudo find $install_path -type f -exec chmod 664 {} \;    
sudo find $install_path -type d -exec chmod 775 {} \;

rm -rvf /etc/nginx/sites-enabled/default

ln -s /etc/nginx/sites-available/freescout \
      /etc/nginx/sites-enabled/freescout

rm -rf /var/www/html/index*debian.html

chown -R www-data: /var/www
