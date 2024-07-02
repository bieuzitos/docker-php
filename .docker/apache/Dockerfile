FROM httpd:2.4

RUN apt-get update

COPY /config/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY /config/httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf

COPY /sites-enabled/ /usr/local/apache2/sites-enabled/
COPY /ssl/ /usr/local/apache2/ssl/

CMD [ "httpd", "-D", "FOREGROUND" ]