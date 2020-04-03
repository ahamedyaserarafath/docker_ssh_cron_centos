FROM centos:latest

MAINTAINER ahamed

ADD run.sh /tmp/run.sh
ADD root_cron /tmp/root_cron

## Install crontab and basic configuratoin
RUN yum -y update \
	&& yum -y install crontabs \
	&& sed -i -e '/pam_loginuid.so/s/^/#/' /etc/pam.d/crond \
	&& crontab /tmp/root_cron 

## Install openssh and give access to outside
RUN yum install -y openssh-server passwd \
	&& mkdir /var/run/sshd \
	&& ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' \
	&& echo 'secret@123' | passwd --stdin root \
	&& adduser anotheruser \
	&& echo 'secret@123' | passwd --stdin anotheruser 

RUN chmod +x /tmp/run.sh

EXPOSE 22
CMD /tmp/run.sh
