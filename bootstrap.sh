#!/usr/bin/env bash
apt-get -y update
add-apt-repository ppa:ondrej/php5-5.6 -y
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927
echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.2 multiverse" > /etc/apt/sources.list.d/mongodb-org-3.2.list
apt-get update
apt-get install -y mongodb-org php5 php5-dev libcurl4-openssl-dev
pecl install mongodb

cat ./apache-plzenskybarcamp.conf > /etc/apache2/sites-available/plzenskybarcamp.conf
a2ensite plzenskybarcamp
echo "extension=mongodb.so" > /etc/php5/mods-available/mongodb.ini
php5enmod mongodb
service apache2 restart
