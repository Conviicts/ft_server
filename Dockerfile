FROM debian:buster

RUN apt-get update && \
	apt-get install -y wget && \
	apt-get install -y php-mbstring php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli && \
	apt-get install -y php7.3-common php7.3-json php7.3-opcache php7.3-readline php-zip php-gd php-mysql && \
	apt-get install -y nginx && \
	apt-get install -y openssl && \
	apt-get install -y mariadb-server

COPY srcs/run.sh ./
COPY srcs/nginx-host-conf ./
COPY srcs/config.inc.php ./
COPY srcs/wp-config.php ./
COPY srcs/autoindex.sh ./

CMD bash ./run.sh
