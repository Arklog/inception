FROM debian:bullseye

RUN	apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		vsftpd

COPY	./conf/vsftpd.conf /etc/vsftpd.conf
COPY	./conf/entrypoint.sh /usr/sbin/entrypoint.sh
RUN	chmod +x /usr/sbin/entrypoint.sh
