FROM debian:bullseye

RUN	apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
		vsftpd \
		net-tools \
		bash
RUN	rm -f /bin/sh && ln -s /bin/bash /bin/sh

COPY	./conf/vsftpd.conf /etc/vsftpd.conf
COPY	./conf/entrypoint.sh /usr/sbin/entrypoint.sh
RUN	chmod +x /usr/sbin/entrypoint.sh

RUN	useradd -m -s /bin/bash -d /var/www/html/wordpress pducloux \
	&& usermod -aG root pducloux \
	&& usermod -aG ftp pducloux \
	&& (echo 'pducloux'; echo 'pducloux') | passwd pducloux \
	&& echo "pducloux" > /etc/vsftpd.userlist \
	&& echo "pducloux" > /etc/vsftpd.chroot_list \
	&& mkdir -p /var/log/vsftpd \
	&& touch /var/log/vsftpd/vsftpd.log \
	&& chown -R pducloux:pducloux /var/log/vsftpd \
	&& mkdir -p /var/www/html \
	&& chown -R pducloux:pducloux /var/www/html
