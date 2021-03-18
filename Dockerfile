# Dave Hay (C) 2021
FROM nginx:mainline-alpine
RUN apk add openssl
RUN rm /etc/nginx/conf.d/*
RUN openssl req -subj '/C=GB/O=IBM/CN=david_hay.uk.ibm.com' -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/nginx.crt -keyout /etc/nginx/nginx.key
ADD nginx.conf /etc/nginx/
ADD hello.html /usr/share/nginx/html/index.html
