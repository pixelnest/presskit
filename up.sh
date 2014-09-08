#!/bin/bash

# -------------------------------------------------------
# Packages.
# -------------------------------------------------------

apt-get update
apt-get install -y wget zip unzip
apt-get install -y php5 php5-common libapache2-mod-php5 php5-cli

# -------------------------------------------------------
# Symlink.
# -------------------------------------------------------

mkdir /pxn && ln -sf /vagrant /pxn/presskit

# -------------------------------------------------------
# Variables.
# -------------------------------------------------------

REPO=/pxn/presskit
WWW=/var/www/presskit

# -------------------------------------------------------
# Presskit installation and configuration.
# -------------------------------------------------------

# Download presskit().
cd /tmp
wget http://dopresskit.com/dopresskit_install.zip
mkdir $WWW
unzip dopresskit_install.zip -d $WWW
rm dopresskit_install.zip

# Install presskit().
cd $WWW
php install.php

# Clean-up.
rm _data.xml
rm -rf images/
rm install.php

# Symlinks.
ln -sf $REPO/data.xml $WWW
ln -sf $REPO/images/  $WWW

#
# Sub-presskits
#

mkdir $WWW/steredenn
mkdir $WWW/shmupfest
mkdir $WWW/bulletml_for_unity

ln -sf $REPO/steredenn/data.xml          $WWW/steredenn/
ln -sf $REPO/steredenn/images/           $WWW/steredenn/

ln -sf $REPO/shmupfest/data.xml          $WWW/shmupfest/
ln -sf $REPO/shmupfest/images/           $WWW/shmupfest/

ln -sf $REPO/bulletml_for_unity/data.xml $WWW/bulletml_for_unity/
ln -sf $REPO/bulletml_for_unity/images/  $WWW/bulletml_for_unity/

# -------------------------------------------------------
# Apache
# -------------------------------------------------------

echo '<Directory /var/www/presskit>' >> /etc/apache2/apache2.conf
echo '  Options Indexes Multiviews FollowSymLinks' >> /etc/apache2/apache2.conf
echo '</Directory>' >> /etc/apache2/apache2.conf

# Main-presskit.
chmod 755 $WWW/images
chmod 644 $WWW/images/*

#
# Sub-presskits
#

chmod 755 $WWW/steredenn/images
chmod 644 $WWW/steredenn/images/*

chmod 755 $WWW/shmupfest/images
chmod 644 $WWW/shmupfest/images/*

chmod 755 $WWW/bulletml_for_unity/images
chmod 644 $WWW/bulletml_for_unity/images/*

sudo service apache2 stop
sudo service apache2 start

# -------------------------------------------------------
# Done. \o/
# -------------------------------------------------------

echo "\n\nDone!\n\n"
