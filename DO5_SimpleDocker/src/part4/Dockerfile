FROM nginx

USER root

COPY server/server /home/server
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY server/startServer.sh /home/startServer.sh

RUN apt -y update && \
    apt -y upgrade && \
    apt install -y libfcgi libfcgi-dev spawn-fcgi && \
    chmod +x /home/startServer.sh && \
    chmod 777 /var/cache/nginx/ /var/run/

USER nginx

CMD ["/home/startServer.sh"]



