FROM ubuntu:14.04

RUN apt-get update
RUN apt-get -y install libapache2-mod-php5 php5-mysql unzip wget php5-curl

RUN wget https://github.com/Pligg/pligg-cms/releases/download/2.0.2/2.0.2.zip
RUN unzip 2.0.2.zip
RUN rm -rf /var/www/html
RUN mv pligg-cms-master /var/www/html

WORKDIR /var/www/html

# Why completion like: mv test_{.default,} doesn't work?
RUN mv favicon.ico.default favicon.ico
RUN mv languages/lang_english.conf.default languages/lang_english.conf
RUN mv logs.default logs

ADD config/dbconnect.php /var/www/html/libs/dbconnect.php
ADD config/settings.php /var/www/html/settings.php
RUN chmod 666 libs/dbconnect.php settings.php

RUN chmod 777 \
  admin/backup/ \
  avatars/groups_uploaded/ \
  avatars/user_uploaded/ \
  cache/ languages/

RUN chown -R www-data:www-data .

EXPOSE 80

ENTRYPOINT ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
