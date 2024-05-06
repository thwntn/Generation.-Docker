FROM  nginx:1.25.3

COPY ./html /var/www/nginx/
COPY ./default.conf /etc/nginx/conf.d

RUN chmod 777 -R /var/www/nginx/