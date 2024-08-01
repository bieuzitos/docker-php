FROM httpd:2.4

RUN apt-get update && apt-get install -y openssl

RUN mkdir -p /usr/local/apache2/ssl

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /usr/local/apache2/ssl/server.key \
    -out /usr/local/apache2/ssl/server.crt \
    -subj "/C=US/ST=State/L=City/O=Organization/OU=Unit/CN=localhost"

COPY /config/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY /config/httpd-ssl.conf /usr/local/apache2/conf/extra/httpd-ssl.conf

COPY /sites-enabled/ /usr/local/apache2/sites-enabled/

CMD [ "httpd", "-D", "FOREGROUND" ]